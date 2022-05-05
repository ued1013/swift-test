//
//  ViewController.swift
//  test01
//
//  Created by 植田崇弘 on 2022/05/01.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timerLabel: UILabel!
    var elapsedTime: Float = 0.0
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tappedStart(_ sender: Any) {
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { (timer) in
                    self.elapsedTime += 0.01
                    // ミリ秒は小数点第一位、第二位なので100をかけて100で割った余り
                    let milliSecond = Int(self.elapsedTime * 100) % 100
                    // 秒は1・2桁なので60で割った余り
                    let second = Int(self.elapsedTime) % 60
                    // 分は経過秒を60で割った余り
                    let minutes = Int(self.elapsedTime / 60)
                    self.timerLabel.text = String(format: "%02d:%02d:%02d", minutes, second, milliSecond)
                }
    }
    @IBAction func tappedStop(_ sender: Any) {
        if let t = timer {
                    t.invalidate()
                }
                elapsedTime = 0.0
    }
    @IBAction func tappedReset(_ sender: Any) {
        self.elapsedTime = 0.0
        self.timerLabel.text = "00:00:00"
    }
}

