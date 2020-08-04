# Maintainer: Jake <aur@ja-ke.tech>

pkgname=octoprint-venv
pkgver=1.4.1
pkgrel=1
pkgdesc="The snappy snappy web interface for your 3D printer! (venv installation type)"
arch=('any')
url="http://octoprint.org/"
license=('AGPL3')
depends=('python')
optdepends=('ffmpeg: timelapse support'
            'mjpg-streamer: stream images from webcam')
provides=('octoprint')
conflicts=('octoprint')
install=octoprint.install
source=("https://github.com/foosel/OctoPrint/archive/${pkgver}.tar.gz"
        'octoprint.service'
        'octoprint.sysusers'
        'octoprint.tmpfiles')
sha256sums=('2d09393aa878bfffd5bbe19170844b6907801526cbe5e89e1a0438a468d356a0'
            '70be0efa0f6a536ed8a89a81bfdb5a978b1036ffead09a4db2e4d67599e02302'
            '79d0f9fe053181eaa77f472b5235463ce217475d47fada9869f42d313b4651a9'
            '67f7844f39428058d59e2a7cb03b3d3077b5f4b0a136fc9dd123e6538a92e851')

package() {
    cd "${srcdir}/OctoPrint-${pkgver}"

    python3 -m venv "${pkgdir}/opt/$pkgname"
    "${pkgdir}/opt/$pkgname/bin/python3" setup.py install --optimize=1
    sed -i "s|${pkgdir}/opt/$pkgname|/opt/$pkgname|g" "${pkgdir}/opt/$pkgname/bin/"* # relocate without breaking plugin system

    install -Dm644 "${srcdir}/octoprint.service" "${pkgdir}/usr/lib/systemd/system/octoprint.service"
    install -Dm644 "${srcdir}/octoprint.sysusers" "${pkgdir}/usr/lib/sysusers.d/octoprint.conf"
    install -Dm644 "${srcdir}/octoprint.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/octoprint.conf"

#     install -d "${pkgdir}/usr/bin/"
#     ln -s /opt/$pkgname/bin/octoprint "${pkgdir}/usr/bin/octoprint"

    install -d "${pkgdir}/var/lib/octoprint" "${pkgdir}/etc/"
    ln -s /var/lib/octoprint/.octoprint/ "${pkgdir}/etc/octoprint"
}
