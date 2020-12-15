# Maintainer: Jake <aur@ja-ke.tech>

pkgname=octoprint-venv
pkgver=1.5.2
pkgrel=1
pkgdesc="Web interface for 3D printers (venv installation type)"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="http://octoprint.org/"
license=('AGPL3')
depends=('python')
optdepends=('ffmpeg: timelapse support'
            'mjpg-streamer: stream images from webcam')
provides=('octoprint')
conflicts=('octoprint')
install=octoprint.install
source=("https://pypi.io/packages/source/o/octoprint/OctoPrint-${pkgver}.tar.gz"
        'octoprint.service'
        'octoprint.sysusers'
        'octoprint.tmpfiles')
sha256sums=('c4531f8cb10f5afdabad086d88422643ddf962e5381c9a9854e6004318bd5c1e'
            '70be0efa0f6a536ed8a89a81bfdb5a978b1036ffead09a4db2e4d67599e02302'
            '79d0f9fe053181eaa77f472b5235463ce217475d47fada9869f42d313b4651a9'
            '67f7844f39428058d59e2a7cb03b3d3077b5f4b0a136fc9dd123e6538a92e851')

package() {
    cd "${srcdir}/OctoPrint-${pkgver}"

    python3 -m venv "${pkgdir}/opt/$pkgname"
    
    if [ ! "$CARCH" == "x86_64" ] && [ ! "$CARCH" == "i686" ]; then
        "${pkgdir}/opt/$pkgname/bin/pip3" install wheel
        "${pkgdir}/opt/$pkgname/bin/pip3" install netifaces
    fi

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
