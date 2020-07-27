# Maintainer: Nocifer <apmichalopoulos at gmail dot com>

pkgname=zmeventnotification
pkgver=5.15.6
pkgrel=2
pkgdesc='A Machine Learning powered, Secure Websocket & MQTT based event notification server for ZoneMinder'
arch=('any')
url='https://github.com/pliablepixels/zmeventnotification'
license=('GPL')
depends=('opencv' 'perl-config-inifiles' 'perl-crypt-eksblowfish' 'perl-json' 'perl-lwp-protocol-https' 'perl-net-mqtt-simple'
         'perl-net-websocket-server' 'python-face_recognition' 'python-gifsicle' 'python-future' 'python-imageio' 'python-imageio-ffmpeg'
         'python-imutils' 'python-pyzm-git' 'python-requests' 'python-scikit-learn' 'python-shapely')
makedepends=('git')
conflicts=('zmeventnotification-git')
backup=('etc/zoneminder/zmeventnotification.ini'
        'etc/zoneminder/secrets.ini'
        'etc/zoneminder/objectconfig.ini')
install=$pkgname.install
source=("git+https://github.com/pliablepixels/$pkgname.git#tag=v$pkgver"
        # YOLOv3
        "https://raw.githubusercontent.com/pjreddie/darknet/master/cfg/yolov3.cfg"
        "https://raw.githubusercontent.com/pjreddie/darknet/master/data/coco.names"
        "https://pjreddie.com/media/files/yolov3.weights"
        # YOLOv3 Tiny
        "https://raw.githubusercontent.com/pjreddie/darknet/master/cfg/yolov3-tiny.cfg"
        #"https://raw.githubusercontent.com/pjreddie/darknet/master/data/coco.names"
        "https://pjreddie.com/media/files/yolov3-tiny.weights"
        # YOLOv4 (not yet enabled because it requires an OpenCV version newer than the current stable 4.3.0)
        #"https://raw.githubusercontent.com/AlexeyAB/darknet/master/cfg/yolov4.cfg"
        #"https://raw.githubusercontent.com/pjreddie/darknet/master/data/coco.names"
        #"https://github.com/AlexeyAB/darknet/releases/download/darknet_yolo_v3_optimal/yolov4.weights"
        )
sha256sums=('SKIP'
            '22489ea38575dfa36c67a90048e8759576416a79d32dc11e15d2217777b9a953'
            '634a1132eb33f8091d60f2c346ababe8b905ae08387037aed883953b7329af84'
            '523e4e69e1d015393a1b0a441cef1d9c7659e3eb2d7e15f793f060a21b32f297'
            '84eb7a675ef87c906019ff5a6e0effe275d175adb75100dcb47f0727917dc2c7'
            'dccea06f59b781ec1234ddf8d1e94b9519a97f4245748a7d4db75d5b7080a42c')
     
prepare() {
    cd $pkgname
    
    # Change the default upstream ZM address to match the one used by the ZoneMinder package in the AUR
    sed -i 's|https://portal/zm|http://localhost:8095|g' secrets.ini
    
    # Hackilly disable SSL by default (because it requires the user to first generate an SSL certificate or the notification server won't work)
    sed -i '111s|enable = yes|enable = no|g' zmeventnotification.ini
}

package() {
    # Create the folder structure
    install -dm755                                                      $pkgdir/etc/zoneminder
    install -dm755                                                      $pkgdir/usr/bin
    install -dm755                                                      $pkgdir/var/lib/$pkgname
    install -dm755 -o http -g http                                      $pkgdir/var/lib/$pkgname/bin
    install -dm755 -o http -g http                                      $pkgdir/var/lib/$pkgname/push
    install -dm755 -o http -g http                                      $pkgdir/var/lib/$pkgname/contrib
    install -dm755 -o http -g http                                      $pkgdir/var/lib/$pkgname/images
    install -dm755 -o http -g http                                      $pkgdir/var/lib/$pkgname/mlapi
    install -dm755 -o http -g http                                      $pkgdir/var/lib/$pkgname/known_faces
    install -dm755 -o http -g http                                      $pkgdir/var/lib/$pkgname/unknown_faces
    install -dm755 -o http -g http                                      $pkgdir/var/lib/$pkgname/models/yolov3
    install -dm755 -o http -g http                                      $pkgdir/var/lib/$pkgname/models/tinyyolo
    install -dm755 -o http -g http                                      $pkgdir/var/lib/$pkgname/models/yolov4
    install -dm755 -o http -g http                                      $pkgdir/var/lib/$pkgname/misc
    
    # Move the object recognition model files into place
    install -m644 yolov3.cfg                                            $pkgdir/var/lib/$pkgname/models/yolov3
    install -m644 coco.names                                            $pkgdir/var/lib/$pkgname/models/yolov3
    install -m644 yolov3.weights                                        $pkgdir/var/lib/$pkgname/models/yolov3
    
    install -m644 yolov3-tiny.cfg                                       $pkgdir/var/lib/$pkgname/models/tinyyolo
    install -m644 coco.names                                            $pkgdir/var/lib/$pkgname/models/tinyyolo
    install -m644 yolov3-tiny.weights                                   $pkgdir/var/lib/$pkgname/models/tinyyolo
    
    # See comment in source section for why these are disabled
    #install -m644 yolov4.cfg                                            $pkgdir/var/lib/$pkgname/models/yolov4
    #install -m644 coco.names                                            $pkgdir/var/lib/$pkgname/models/yolov4
    #install -m644 yolov4.weights                                        $pkgdir/var/lib/$pkgname/models/yolov4
    
    # Move the rest of the files into place
    cd $pkgname
    
    install -m755 -o http -g http zmeventnotification.pl                $pkgdir/usr/bin

    install -m755 -o http -g http pushapi_plugins/pushapi_pushover.py   $pkgdir/var/lib/$pkgname/bin

    install -m755 -o http -g http hook/zm_event_start.sh                $pkgdir/var/lib/$pkgname/bin
    install -m755 -o http -g http hook/zm_event_end.sh                  $pkgdir/var/lib/$pkgname/bin
    install -m755 -o http -g http hook/zm_detect.py                     $pkgdir/var/lib/$pkgname/bin
    install -m755 -o http -g http hook/zm_train_faces.py                $pkgdir/var/lib/$pkgname/bin
    
    install -m644 -o http -g http docs/guides/contrib_guidelines.rst    $pkgdir/var/lib/$pkgname/contrib
    install -m755 -o http -g http contrib/*                             $pkgdir/var/lib/$pkgname/contrib
    
    install -m644 zmeventnotification.ini                               $pkgdir/etc/zoneminder/
    install -m644 secrets.ini                                           $pkgdir/etc/zoneminder/
    install -m644 hook/objectconfig.ini                                 $pkgdir/etc/zoneminder/
    
    # Temp fix for hardcoded /zm/ links in the configuration files
    ln -sf /etc/zoneminder                                              $pkgdir/etc/zm
    
    # Install the accompanying Python package zmes_hooks
    cd hook
    
    python setup.py install --root="${pkgdir}/" --optimize=1
}
