# Maintainer: Adrian <adrian@mxlinux.org>
pkgname=mx-cleanup
pkgver=26.07.3
pkgrel=1
pkgdesc="GUI for system cleanup and maintenance"
arch=('x86_64' 'i686')
url="https://github.com/mxlinux/mx-cleanup"
license=('GPL3')
depends=('qt6-base' 'polkit')
makedepends=('cmake' 'ninja' 'qt6-tools')
install=mx-cleanup.install
source=("https://github.com/MX-Linux/mx-cleanup/archive/refs/tags/26.07.3.tar.gz")
sha256sums=('ee59678b98b82c3269886b9d822cd10ab2fc4f7a9e2a6df74210a1b14ed308ff')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

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
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -Dm755 build/mx-cleanup "${pkgdir}/usr/bin/mx-cleanup"

    install -dm755 "${pkgdir}/usr/share/mx-cleanup/locale"
    install -Dm644 build/*.qm "${pkgdir}/usr/share/mx-cleanup/locale/" 2>/dev/null || true

    install -dm755 "${pkgdir}/usr/lib/mx-cleanup"
    install -Dm755 build/helper "${pkgdir}/usr/lib/mx-cleanup/helper"
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
