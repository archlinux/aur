# Maintainer: Adrian <adrian@mxlinux.org>
pkgname=mx-tools
pkgver=26.09
pkgrel=1
pkgdesc="MX Tools - Dashboard application launcher for various MX tools"
arch=('x86_64')
url="https://github.com/MX-Linux/mx-tools"
license=('GPL3')
depends=('qt6-base')
makedepends=('cmake' 'ninja' 'qt6-tools')
source=("https://github.com/MX-Linux/mx-tools/archive/refs/tags/26.09.tar.gz")
sha256sums=('bb8cae3c0d363294889f4e2b946d21e7e0b47ee9efe882620e38269c92024982')

_srcdir="${pkgname}-${pkgver}"

build() {
    cd "${srcdir}/${_srcdir}"

    rm -rf build

    cmake -G Ninja \
        -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
        -DPROJECT_VERSION_OVERRIDE="${pkgver}"

    cmake --build build --parallel
}

package() {
    cd "${srcdir}/${_srcdir}"

    install -Dm755 build/mx-tools "${pkgdir}/usr/bin/mx-tools"

    install -dm755 "${pkgdir}/usr/share/mx-tools/locale"
    install -Dm644 -t "${pkgdir}/usr/share/mx-tools/locale/" build/*.qm 2>/dev/null || true

    install -Dm644 mx-tools.desktop "${pkgdir}/usr/share/applications/mx-tools.desktop"

    install -Dm644 icons/mx-tools.png "${pkgdir}/usr/share/icons/hicolor/96x96/apps/mx-tools.png"
    install -Dm644 icons/mx-tools.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/mx-tools.svg"

    install -dm755 "${pkgdir}/usr/share/doc/mx-tools"

    install -dm755 "${pkgdir}/usr/share/man/man1"
    install -Dm644 -t "${pkgdir}/usr/share/man/man1/" help/*.1 2>/dev/null || true
    if [ -d help ]; then
        for help_file in help/*.html help/*.jpg help/*.png help/*.css; do
            [ -f "$help_file" ] && install -Dm644 "$help_file" "${pkgdir}/usr/share/doc/mx-tools/$(basename "$help_file")"
        done
    fi
    install -Dm644 help/license.html "${pkgdir}/usr/share/doc/mx-tools/license.html"
    gzip -c debian/changelog > "${pkgdir}/usr/share/doc/mx-tools/changelog.gz"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
