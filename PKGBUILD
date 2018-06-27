# Maintainer: Jake <aur@ja-ke.tech>

pkgname=octoprint-venv
pkgver=1.3.8
pkgrel=4
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
        'octoprint.service'
        'octoprint.sysusers'
        'octoprint.tmpfiles')
sha256sums=('f447d2888004ff85971691a0e0f01d74dec6169b7ac599ec51bf44cfe42f2f92'
            '7f7aa02075901d7501a03bda082f050ba5862e58034f0216b5a76d2a25135d3a'
            '79d0f9fe053181eaa77f472b5235463ce217475d47fada9869f42d313b4651a9'
            'ff05d3e76a59f23f2d06d318f8bac1bf5797fafe1c86c45de0249983d2072c25')


package() {
    cd "${srcdir}/OctoPrint-${pkgver}"
    
    virtualenv2 "${pkgdir}/opt/$pkgname"
    "${pkgdir}/opt/$pkgname/bin/python2" setup.py install --optimize=1
    sed -i "s|${pkgdir}/opt/$pkgname|/opt/$pkgname|g" "${pkgdir}/opt/$pkgname/bin/"* # relocate without breaking plugin system
    
    install -Dm644 "${srcdir}/octoprint.service" "${pkgdir}/usr/lib/systemd/system/octoprint.service"
    install -Dm644 "${srcdir}/octoprint.sysusers" "${pkgdir}/usr/lib/sysusers.d/octoprint.conf"
    install -Dm644 "${srcdir}/octoprint.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/octoprint.conf"
    
    install -d "${pkgdir}/usr/bin/"
    ln -s /opt/$pkgname/bin/octoprint "${pkgdir}/usr/bin/octoprint"
    
    install -d "${pkgdir}/var/lib/octoprint" "${pkgdir}/etc/"
    ln -s /var/lib/octoprint/.octoprint/ "${pkgdir}/etc/octoprint"
    
}
