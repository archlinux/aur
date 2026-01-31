# Maintainer: Adrian <adrian@mxlinux.org>
pkgname=mx-conky
pkgver=26.01
pkgrel=1
pkgdesc="MX Conky - Conky configuration tool, for MX, antiX, and Arch Linux"
arch=('x86_64' 'i686')
url="https://mxlinux.org"
license=('GPL3')
depends=('conky' 'qt6-base')
makedepends=('cmake' 'ninja' 'qt6-tools')
source=("https://github.com/MX-Linux/mx-conky/archive/refs/tags/26.01.tar.gz")
sha256sums=('ac9cc78f41761db2f1385a57484ff45793334a1dadcbc5746312b57d85f9e2f0')
install=mx-conky.install

build() {
    cmake -G Ninja \
        -B build \
        -S "${srcdir}/${pkgname}-${pkgver}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
        -DPROJECT_VERSION_OVERRIDE="${pkgver}"

    cmake --build build --parallel
}

package() {
    local srcroot="${srcdir}/${pkgname}-${pkgver}"

    # Install binary
    install -Dm755 build/mx-conky "${pkgdir}/usr/bin/mx-conky"

    # Install translations
    install -dm755 "${pkgdir}/usr/share/mx-conky/locale"
    install -Dm644 build/*.qm "${pkgdir}/usr/share/mx-conky/locale/" 2>/dev/null || true

    # Install desktop file
    install -Dm644 "${srcroot}/mx-conky.desktop" "${pkgdir}/usr/share/applications/mx-conky.desktop"

    # Install icons
    install -Dm644 "${srcroot}/icons/mx-conky.png" "${pkgdir}/usr/share/icons/hicolor/96x96/apps/mx-conky.png" 2>/dev/null || true
    install -Dm644 "${srcroot}/icons/mx-conky.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/mx-conky.svg"

    # Install documentation
    install -dm755 "${pkgdir}/usr/share/doc/mx-conky"
    if [ -d "${srcroot}/help" ]; then
        cp -r "${srcroot}/help/"* "${pkgdir}/usr/share/doc/mx-conky/" 2>/dev/null || true
    fi
    if [ -f "${srcroot}/debian/changelog" ]; then
        gzip -9 -c "${srcroot}/debian/changelog" > "${pkgdir}/usr/share/doc/mx-conky/changelog.gz"
    fi

    # Install license and icon credit
    install -Dm644 "${srcroot}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    if [ -f "${srcroot}/MXConky_IconCredit" ]; then
        install -Dm644 "${srcroot}/MXConky_IconCredit" "${pkgdir}/usr/share/doc/mx-conky/MXConky_IconCredit"
    fi
}
