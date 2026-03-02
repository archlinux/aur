# Maintainer: Benjamim Gois <benjamimgois@gmail.com>
pkgname=omnicom-git
pkgver=r1.g0000000
pkgrel=1
pkgdesc="Modern graphical interface for network device management with Serial, SSH, Telnet, IP Scanner, SNMP and Traceroute support"
arch=('any')
url="https://github.com/benjamimgois/omnicom"
license=('MIT')
depends=('python' 'python-pyqt6' 'python-pyte' 'python-paramiko' 'python-pysnmp' 'python-standard-telnetlib' 'qt6-serialport' 'picocom' 'sudo')
makedepends=('git' 'imagemagick')
provides=('omnicom')
conflicts=('omnicom')
source=("${pkgname}::git+https://github.com/benjamimgois/omnicom.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/${pkgname}"

    # Install main script
    install -Dm755 omnicom "${pkgdir}/usr/bin/omnicom"

    # Install icon in hicolor theme (FreeDesktop.org standard) - multiple sizes
    install -Dm644 assets/omnicom.png "${pkgdir}/usr/share/icons/hicolor/512x512/apps/omnicom.png"

    # Create scaled versions for better compatibility
    for size in 256 128 64 48 32 16; do
        install -dm755 "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps"
        magick assets/omnicom.png -resize ${size}x${size} "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/omnicom.png"
    done

    # Install UI icons (sidebar and misc) — instala todos os SVGs da pasta
    for icon in assets/icons/*.svg; do
        install -Dm644 "${icon}" "${pkgdir}/usr/share/omnicom/icons/$(basename ${icon})"
    done

    # Install vendor icons
    for vendor in default cisco huawei juniper fortinet d-link h3c brocade datacom aruba linux mikrotik; do
        install -Dm644 "assets/vendors/${vendor}.svg" "${pkgdir}/usr/share/omnicom/vendors/${vendor}.svg"
    done

    # Install desktop file
    install -Dm644 omnicom.desktop "${pkgdir}/usr/share/applications/omnicom.desktop"

    # Install documentation
    install -Dm644 README.md "${pkgdir}/usr/share/doc/omnicom/README.md"
    install -Dm644 docs/INTERFACE.md "${pkgdir}/usr/share/doc/omnicom/INTERFACE.md"

    # Install license
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
