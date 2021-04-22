# Maintainer: Nocifer <apmichalopoulos at gmail dot com>

pkgname=zmeventnotification
pkgver=6.1.23
pkgrel=1
pkgdesc='A machine learning powered, secure websocket & MQTT based event notification server for ZoneMinder'
arch=('any')
url='https://github.com/pliablepixels/zmeventnotification'
license=('GPL')
depends=('opencv' 'perl-config-inifiles' 'perl-crypt-eksblowfish' 'perl-json' 'perl-lwp-protocol-https' 'perl-net-mqtt-simple'
         'perl-net-websocket-server' 'python-face_recognition' 'python-gifsicle' 'python-future' 'python-imageio' 'python-imageio-ffmpeg'
         'python-imutils' 'python-pyzm-git' 'python-requests' 'python-scikit-learn' 'python-shapely'
         # ¯\_(ツ)_/¯
         'python-mysql-connector' 'python-psutil' 'python-sqlalchemy' 'qt5-base'
         # Uncomment the next line to enable support for the Google Coral Edge TPU
         #'edgetpu_api'
         )
makedepends=('git')
replaces=('zmeventnotification-git')
backup=('etc/zoneminder/zmeventnotification.ini'
        'etc/zoneminder/secrets.ini'
        'etc/zoneminder/objectconfig.ini'
        'etc/zoneminder/es_rules.json')
install=${pkgname}.install
source=("${pkgname}-git::git+https://github.com/pliablepixels/${pkgname}.git#tag=v${pkgver}"
        # YOLOv3
        'https://raw.githubusercontent.com/pjreddie/darknet/master/cfg/yolov3.cfg'
        'https://raw.githubusercontent.com/pjreddie/darknet/master/data/coco.names'
        'https://pjreddie.com/media/files/yolov3.weights'
        # YOLOv3 Tiny
        'https://raw.githubusercontent.com/pjreddie/darknet/master/cfg/yolov3-tiny.cfg'
        #'https://raw.githubusercontent.com/pjreddie/darknet/master/data/coco.names'
        'https://pjreddie.com/media/files/yolov3-tiny.weights'
        # YOLOv4
        'https://raw.githubusercontent.com/AlexeyAB/darknet/master/cfg/yolov4.cfg'
        #'https://raw.githubusercontent.com/pjreddie/darknet/master/data/coco.names'
        'https://github.com/AlexeyAB/darknet/releases/download/darknet_yolo_v3_optimal/yolov4.weights'
        # YOLOv4 Tiny
        'https://raw.githubusercontent.com/AlexeyAB/darknet/master/cfg/yolov4-tiny.cfg'
        #"https://raw.githubusercontent.com/pjreddie/darknet/master/data/coco.names'
        'https://github.com/AlexeyAB/darknet/releases/download/darknet_yolo_v4_pre/yolov4-tiny.weights'
        # Google Coral Edge TPU
        'https://dl.google.com/coral/canned_models/coco_labels.txt'
        'https://github.com/google-coral/edgetpu/raw/master/test_data/ssd_mobilenet_v2_coco_quant_postprocess_edgetpu.tflite'
        )
sha256sums=('SKIP'
            '22489ea38575dfa36c67a90048e8759576416a79d32dc11e15d2217777b9a953'
            '634a1132eb33f8091d60f2c346ababe8b905ae08387037aed883953b7329af84'
            '523e4e69e1d015393a1b0a441cef1d9c7659e3eb2d7e15f793f060a21b32f297'
            '84eb7a675ef87c906019ff5a6e0effe275d175adb75100dcb47f0727917dc2c7'
            'dccea06f59b781ec1234ddf8d1e94b9519a97f4245748a7d4db75d5b7080a42c'
            'a6d0f8e5c62cc8378384f75a8159b95fa2964d4162e33351b00ac82e0fc46a34'
            'e8a4f6c62188738d86dc6898d82724ec0964d0eb9d2ae0f0a9d53d65d108d562'
            'f858e3724962eedf3ac44e3b6cb3f0c3d9ed067c306bb831f539c578b924c90e'
            'cf9fbfd0f6d4869b35762f56100f50ed05268084078805f0e7989efe5bb8ca87'
            '93f235896748537fc71325a070ee32e9a0afda2481ceb943559325619763fa6d'
            '232775917b5e0162b25c07bb1502ec3bbdeb5d0f1a835aba3097d5a2f4fc11e1')
     
prepare() {
    cd ${pkgname}-git
    
    # Change the default upstream ZM address to match the one used by the ZoneMinder package in the AUR
    sed -i 's|https://portal/zm|http://localhost:8095|g' secrets.ini
    
    # Hackilly disable SSL by default (because it requires the user to first generate a real SSL certificate or the notification server won't work)
    sed -i '140s|enable = yes|enable = no|g' zmeventnotification.ini
}

package() {
    # Create the folder structure
    install -dm755                                                          ${pkgdir}/etc/zoneminder
    install -dm755                                                          ${pkgdir}/usr/bin
    install -dm755                                                          ${pkgdir}/var/lib/${pkgname}
    install -dm755 -o http -g http                                          ${pkgdir}/var/lib/${pkgname}/bin
    install -dm755 -o http -g http                                          ${pkgdir}/var/lib/${pkgname}/push
    install -dm755 -o http -g http                                          ${pkgdir}/var/lib/${pkgname}/contrib
    install -dm755 -o http -g http                                          ${pkgdir}/var/lib/${pkgname}/images
    install -dm755 -o http -g http                                          ${pkgdir}/var/lib/${pkgname}/mlapi
    install -dm755 -o http -g http                                          ${pkgdir}/var/lib/${pkgname}/known_faces
    install -dm755 -o http -g http                                          ${pkgdir}/var/lib/${pkgname}/unknown_faces
    install -dm755 -o http -g http                                          ${pkgdir}/var/lib/${pkgname}/models/yolov3
    install -dm755 -o http -g http                                          ${pkgdir}/var/lib/${pkgname}/models/tinyyolov3
    install -dm755 -o http -g http                                          ${pkgdir}/var/lib/${pkgname}/models/yolov4
    install -dm755 -o http -g http                                          ${pkgdir}/var/lib/${pkgname}/models/tinyyolov4
    install -dm755 -o http -g http                                          ${pkgdir}/var/lib/${pkgname}/models/coral_edgetpu
    install -dm755 -o http -g http                                          ${pkgdir}/var/lib/${pkgname}/misc
    
    # Move the object recognition model files into place
    install -m644 yolov3.cfg                                                ${pkgdir}/var/lib/${pkgname}/models/yolov3
    install -m644 coco.names                                                ${pkgdir}/var/lib/${pkgname}/models/yolov3
    install -m644 yolov3.weights                                            ${pkgdir}/var/lib/${pkgname}/models/yolov3
    
    install -m644 yolov3-tiny.cfg                                           ${pkgdir}/var/lib/${pkgname}/models/tinyyolov3
    install -m644 coco.names                                                ${pkgdir}/var/lib/${pkgname}/models/tinyyolov3
    install -m644 yolov3-tiny.weights                                       ${pkgdir}/var/lib/${pkgname}/models/tinyyolov3
    
    install -m644 yolov4.cfg                                                ${pkgdir}/var/lib/${pkgname}/models/yolov4
    install -m644 coco.names                                                ${pkgdir}/var/lib/${pkgname}/models/yolov4
    install -m644 yolov4.weights                                            ${pkgdir}/var/lib/${pkgname}/models/yolov4
    
    install -m644 yolov4-tiny.cfg                                           ${pkgdir}/var/lib/${pkgname}/models/tinyyolov4
    install -m644 coco.names                                                ${pkgdir}/var/lib/${pkgname}/models/tinyyolov4
    install -m644 yolov4-tiny.weights                                       ${pkgdir}/var/lib/${pkgname}/models/tinyyolov4
    
    install -m644 coco_labels.txt                                           ${pkgdir}/var/lib/${pkgname}/models/coral_edgetpu/coco_indexed.names
    install -m644 ssd_mobilenet_v2_coco_quant_postprocess_edgetpu.tflite    ${pkgdir}/var/lib/${pkgname}/models/coral_edgetpu
    
    # Move the rest of the files into place
    cd ${pkgname}-git
    
    install -m755 -o http -g http zmeventnotification.pl                    ${pkgdir}/usr/bin
    
    install -m755 -o http -g http pushapi_plugins/pushapi_pushover.py       ${pkgdir}/var/lib/${pkgname}/bin
    
    install -m755 -o http -g http hook/zm_event_start.sh                    ${pkgdir}/var/lib/${pkgname}/bin
    install -m755 -o http -g http hook/zm_event_end.sh                      ${pkgdir}/var/lib/${pkgname}/bin
    install -m755 -o http -g http hook/zm_detect.py                         ${pkgdir}/var/lib/${pkgname}/bin
    install -m755 -o http -g http hook/zm_train_faces.py                    ${pkgdir}/var/lib/${pkgname}/bin
    
    # Optional script to migrate your settings from 5.15.x to 6.x.x (read the official documentation for instructions)
    install -m755 -o http -g http hook/config_upgrade.py                    ${pkgdir}/var/lib/${pkgname}/bin
    
    install -m644 -o http -g http docs/guides/contrib_guidelines.rst        ${pkgdir}/var/lib/${pkgname}/contrib
    install -m755 -o http -g http contrib/*                                 ${pkgdir}/var/lib/${pkgname}/contrib
    
    install -m644 zmeventnotification.ini                                   ${pkgdir}/etc/zoneminder/
    install -m644 secrets.ini                                               ${pkgdir}/etc/zoneminder/
    install -m644 hook/objectconfig.ini                                     ${pkgdir}/etc/zoneminder/
    install -m644 es_rules.json                                             ${pkgdir}/etc/zoneminder/
    
    # Temp fix for hardcoded /zm/ links in the configuration files
    ln -sf /etc/zoneminder                                                  ${pkgdir}/etc/zm
    
    # Install the accompanying Python package zmes_hooks
    cd hook
    python setup.py install --root="${pkgdir}/" --optimize=1
}
