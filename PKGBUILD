# Maintainer: Luis Aranguren <pizzaman@hotmail.com>

pkgname=zmeventnotification-git
_pkgname=zmeventnotification
pkgver=v4.6.1.r58.geab8548
pkgrel=4
pkgdesc='Event Notification Server sits along with ZoneMinder and offers real time notifications, support for push notifications as well as Machine Learning powered recognition + hooks'
arch=('x86_64')
url='https://github.com/pliablepixels/zmeventnotification'
license=('GPL' 'MIT')
depends=('perl-crypt-mysql' 'perl-config-inifiles' 'perl-crypt-eksblowfish' 'perl-net-websocket-server' 'perl-json' 'perl-lwp-protocol-https'
         'perl-io-socket-ssl' 'perl-net-mqtt-simple' 'perl-config-inifiles' 'opencv'
         #hooks
         'geos' 'hdf5' 'python-numpy' 'python-imutils' 'python-pyzm-git' 'python-sqlalchemy' 'python-psutil' 'python-future' 'python-shapely' 'python-mysql-connector'
         'python-scikit-learn' 'python-face_recognition'
)
makedepends=('cmake' 'wget' 'git')
optdepends=()
conflicts=()
backup=('etc/zoneminder/objectconfig.ini' 'etc/zoneminder/secrets.ini' 'etc/zoneminder/zmeventnotification.ini')
NoUpgrade=('etc/zoneminder/objectconfig.ini' 'etc/zoneminder/secrets.ini' 'etc/zoneminder/zmeventnotification.ini')
install=
source=("git://github.com/pliablepixels/$_pkgname.git"
        'https://raw.githubusercontent.com/pjreddie/darknet/master/cfg/yolov3.cfg'
        'yolov3_classes.txt::https://raw.githubusercontent.com/pjreddie/darknet/master/data/coco.names'
        'https://pjreddie.com/media/files/yolov3.weights'
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            '523e4e69e1d015393a1b0a441cef1d9c7659e3eb2d7e15f793f060a21b32f297'
)

pkgver() {
    cd "$_pkgname"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare () {
    cd $_pkgname

    #secrets.ini
    sed -i "s|ZM_PORTAL=https://portal/zm|ZM_PORTAL=http://127.0.0.1:8095|" secrets.ini
}

build() {
    cd $_pkgname/hook
    python setup.py build
}
     
package() {
    cd $_pkgname
    #bin
    install -Dm 755 zmeventnotification.pl "${pkgdir}/usr/bin/zmeventnotification.pl"

    #Folder structure
    mkdir -p "${pkgdir}/var/lib/zmeventnotification/push" 2>/dev/null
    mkdir -p "${pkgdir}/var/lib/zmeventnotification/bin" 2>/dev/null
    mkdir -p "${pkgdir}/var/lib/zmeventnotification/images" 2>/dev/null
    mkdir -p "${pkgdir}/var/lib/zmeventnotification/known_faces" 2>/dev/null
    mkdir -p "${pkgdir}/var/lib/zmeventnotification/misc" 2>/dev/null

    #Yolo
    install -Dm644 ${srcdir}/yolo* --target-directory "${pkgdir}/var/lib/zmeventnotification/models/yolov3/"

    #ML Hooks
    install -Dm 755 hook/zm_event_start.sh "${pkgdir}/var/lib/zmeventnotification/bin/zm_event_start.sh"
    install -Dm 755 hook/zm_event_end.sh "${pkgdir}/var/lib/zmeventnotification/bin/zm_event_end.sh"
    install -Dm 755 hook/zm_detect.py "${pkgdir}/var/lib/zmeventnotification/bin/zm_detect.py"
    install -Dm 755 hook/zm_train_faces.py "${pkgdir}/var/lib/zmeventnotification/bin/zm_train_faces.py"
    cd hook
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    cd ..

    #ES config files
    mkdir -p "${pkgdir}/etc/zoneminder" 2>/dev/null
    install --backup=numbered -m 644 zmeventnotification.ini "${pkgdir}/etc/zoneminder/"
    install --backup=numbered -m 644 secrets.ini "${pkgdir}/etc/zoneminder/"

    #Hook config files
    install --backup=numbered -m 644 hook/objectconfig.ini "${pkgdir}/etc/zoneminder/"

    #webserver should access
    chown -R http:http "${pkgdir}/var/lib/zmeventnotification"

    #symbolic link /etc/zm to /etc/zoneminder
    ln -s "/etc/zoneminder" "${pkgdir}/etc/zm"

    #Notes
    #Disabled SSL and Authnetication in zmeventnotificaiton.ini
    #Make a guide so people fill secrets.ini ZM_USER ZM_PASSWORD ZMES_PICTURE_URL or link to he website
}
