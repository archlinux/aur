# Maintainer: Adrian <adrian@mxlinux.org>
pkgname=mx-conky
pkgver=26.07
pkgrel=1
pkgdesc="MX Conky - Conky configuration tool, for MX, antiX, and Arch Linux"
arch=('x86_64' 'i686')
url="https://mxlinux.org"
license=('GPL3')
depends=('conky' 'qt6-base')
makedepends=('cmake' 'ninja' 'qt6-tools')
source=("https://github.com/MX-Linux/mx-conky/archive/refs/tags/26.07.tar.gz")
sha256sums=('20184dd4dabf68bce8b2e4882af3e231fe8f93b84cdc31527147271c88a324c6')
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

    install -Dm644 "${srcroot}"/help/*.1 "${pkgdir}/usr/share/man/man1/" 2>/dev/null || true
    if [ -d "${srcroot}/help" ]; then
        for help_file in "${srcroot}"/help/*.html "${srcroot}"/help/*.jpg "${srcroot}"/help/*.png "${srcroot}"/help/*.css; do
            [ -f "$help_file" ] && install -Dm644 "$help_file" "${pkgdir}/usr/share/doc/mx-conky/$(basename "$help_file")"
        done
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
