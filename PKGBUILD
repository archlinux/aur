# Maintainer: Adrian <adrian@mxlinux.org>
pkgname=mx-tools
pkgver=26.03.1
pkgrel=1
pkgdesc="MX Tools - Dashboard application launcher for various MX tools"
arch=('x86_64')
url="https://github.com/MX-Linux/mx-tools"
license=('GPL3')
depends=('qt6-base')
makedepends=('cmake' 'ninja' 'qt6-tools')
source=("https://github.com/MX-Linux/mx-tools/archive/refs/tags/26.03.1.tar.gz")
sha256sums=('333f1bd4ca439f4ff7f492a61f383cf2300ac1d5117cf0c41a8b28aa95e2e390')

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
    install -Dm644 build/*.qm "${pkgdir}/usr/share/mx-tools/locale/" 2>/dev/null || true

    install -Dm644 mx-tools.desktop "${pkgdir}/usr/share/applications/mx-tools.desktop"

    install -Dm644 icons/mx-tools.png "${pkgdir}/usr/share/icons/hicolor/96x96/apps/mx-tools.png"
    install -Dm644 icons/mx-tools.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/mx-tools.svg"

    install -dm755 "${pkgdir}/usr/share/doc/mx-tools"
    if [ -d help ]; then
        cp -r help/* "${pkgdir}/usr/share/doc/mx-tools/" 2>/dev/null || true
    fi
    install -Dm644 help/license.html "${pkgdir}/usr/share/doc/mx-tools/license.html"
    gzip -c debian/changelog > "${pkgdir}/usr/share/doc/mx-tools/changelog.gz"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
