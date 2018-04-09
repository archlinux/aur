# Maintainer: Jake <ja.ke@posteo.de>
# This uses the install and service file from octoprint[AUR], thanks to all Maintainers/Contributors!

pkgname=octoprint-venv
pkgver=1.3.7
pkgrel=1
pkgdesc="The snappy snappy web interface for your 3D printer! (virtualenv installation type)"
arch=('any')
url="http://octoprint.org/"
license=('AGPL3')
depends=('python2-virtualenv' )
optdepends=('ffmpeg: timelapse support'
            'mjpg-streamer: stream images from webcam')
provides=('octoprint')
conflicts=('octoprint')
install="octoprint.install"
source=("https://github.com/foosel/OctoPrint/archive/${pkgver}.tar.gz"
        'octoprint.service')
sha256sums=('e71a1bada96fa10100f6c91147bf1c5ffb56a2af21b67aaa652e2df5d8e33c00'
            '7f7aa02075901d7501a03bda082f050ba5862e58034f0216b5a76d2a25135d3a')


package() {
    cd ${srcdir}/OctoPrint-${pkgver}
    
    virtualenv2 ${pkgdir}/opt/$pkgname
    ${pkgdir}/opt/$pkgname/bin/python2 setup.py install --optimize=1
    sed -i "s|${pkgdir}/opt/$pkgname|/opt/$pkgname|g" ${pkgdir}/opt/$pkgname/bin/*
    
    install -D -m644 ${srcdir}/octoprint.service ${pkgdir}/usr/lib/systemd/system/octoprint.service
    install -d ${pkgdir}/usr/bin/
    ln -s /opt/$pkgname/bin/octoprint ${pkgdir}/usr/bin/octoprint
}
