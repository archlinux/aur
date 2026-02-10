# Maintainer: Benjamim Gois <benjamimgois@gmail.com>
pkgname=omnicom
pkgver=1.2
pkgrel=1
pkgdesc="Modern graphical interface for serial communication with SSH and Telnet support"
arch=('any')
url="https://github.com/benjamimgois/omnicom"
license=('MIT')
depends=('python' 'python-pyqt6' 'python-pyte' 'python-paramiko' 'qt6-serialport' 'picocom' 'sudo')
optdepends=(
    'python-standard-telnetlib: Telnet protocol support (Python 3.13+)'
)
makedepends=('imagemagick')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/benjamimgois/omnicom/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('dfda010bda0a5bdc06c720dee3d9535b758ec283b33f981a30d9aaf7d8977030')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # Install main script
    install -Dm755 omnicom "${pkgdir}/usr/bin/omnicom"

    # Install icon in hicolor theme (FreeDesktop.org standard) - multiple sizes
    install -Dm644 assets/omnicom.png "${pkgdir}/usr/share/icons/hicolor/512x512/apps/omnicom.png"

    # Create scaled versions for better compatibility
    for size in 256 128 64 48 32 16; do
        install -dm755 "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps"
        magick assets/omnicom.png -resize ${size}x${size} "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/omnicom.png"
    done

    # Install SVG arrow icon
    install -Dm644 assets/icons/arrow_down.svg "${pkgdir}/usr/share/omnicom/arrow_down.svg"

    # Install vendor icons
    for vendor in generic cisco huawei juniper fortinet dlink h3c brocade datacom; do
        install -Dm644 "assets/vendors/${vendor}.svg" "${pkgdir}/usr/share/omnicom/vendors/${vendor}.svg"
    done

    # Install desktop file
    install -Dm644 omnicom.desktop "${pkgdir}/usr/share/applications/omnicom.desktop"

    # Install documentation
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 docs/INTERFACE.md "${pkgdir}/usr/share/doc/${pkgname}/INTERFACE.md"

    # Install license
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
