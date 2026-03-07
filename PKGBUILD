# Maintainer: Adrian <adrian@mxlinux.org>
pkgname=mx-cleanup
pkgver=26.03
pkgrel=1
pkgdesc="GUI for system cleanup and maintenance"
arch=('x86_64' 'i686')
url="https://github.com/MX-Linux/mx-cleanup"
license=('GPL3')
depends=('xdg-utils' 'qt6-base' 'polkit')
makedepends=('cmake' 'ninja' 'qt6-tools')
source=("https://github.com/MX-Linux/mx-cleanup/archive/refs/tags/26.03.tar.gz")
sha256sums=('3bf6b56896fbaf6dd52c61a5ad1d23c7be2e2867725a7cf568d47e6ca6ea193a')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    rm -rf build

    cmake -G Ninja \
        -B build \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
        -DPROJECT_VERSION_OVERRIDE="${pkgver}"

    cmake --build build --parallel
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -Dm755 build/mx-cleanup "${pkgdir}/usr/bin/mx-cleanup"

    install -dm755 "${pkgdir}/usr/share/mx-cleanup/locale"
    install -Dm644 build/*.qm "${pkgdir}/usr/share/mx-cleanup/locale/" 2>/dev/null || true

    install -dm755 "${pkgdir}/usr/lib/mx-cleanup"
    install -Dm755 scripts/helper "${pkgdir}/usr/lib/mx-cleanup/helper"
    install -Dm755 scripts/helper-terminal-keep-open "${pkgdir}/usr/lib/mx-cleanup/helper-terminal-keep-open"

    install -Dm644 scripts/org.mxlinux.pkexec.mx-cleanup-helper.policy \
        "${pkgdir}/usr/share/polkit-1/actions/org.mxlinux.pkexec.mx-cleanup-helper.policy"

    install -Dm644 mx-cleanup.desktop "${pkgdir}/usr/share/applications/mx-cleanup.desktop"

    install -Dm644 images/mx-cleanup.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/mx-cleanup.png"

    install -dm755 "${pkgdir}/usr/share/doc/mx-cleanup"
    if [ -d help ]; then
        cp -r help/* "${pkgdir}/usr/share/doc/mx-cleanup/" 2>/dev/null || true
    fi
}
