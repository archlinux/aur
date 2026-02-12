# Maintainer: Benjamim Gois <benjamimgois@gmail.com>
pkgname=omnicom
pkgver=1.3
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
sha256sums=('42d5b681e4b8d60d55683597d35a0575f6a2ea1bc37d298898902b3b31196cbb')

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

    # Install UI icons (sidebar and misc)
    for icon in arrow_down.svg TFTP.svg serial-port-white.svg ssh_icon.svg; do
        install -Dm644 "assets/icons/${icon}" "${pkgdir}/usr/share/omnicom/icons/${icon}"
    done

    # Install vendor icons
    for vendor in default generic cisco huawei juniper fortinet d-link h3c brocade datacom aruba linux mikrotik; do
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
