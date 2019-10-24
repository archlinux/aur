# Maintainer: Jake <aur@ja-ke.tech>

pkgname=octoprint-venv
pkgver=1.3.12
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
        'octoprint.service'
        'octoprint.sysusers'
        'octoprint.tmpfiles')
sha256sums=('f33f0b7b462e9669bb04a4475321071433f3b607dd9e7265c4c79b0986dfcec4'
            'c6fb02d68cbfb1806c6c66134f1fa211caa1a8b7176befee53757cf546fdd4b3'
            '79d0f9fe053181eaa77f472b5235463ce217475d47fada9869f42d313b4651a9'
            '67f7844f39428058d59e2a7cb03b3d3077b5f4b0a136fc9dd123e6538a92e851')


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
