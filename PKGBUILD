# Maintainer: Adrian <adrian@mxlinux.org>
pkgname=mx-cleanup
pkgver=26.07.4arch
pkgrel=2
pkgdesc="GUI for system cleanup and maintenance"
arch=('x86_64' 'i686')
url="https://github.com/mxlinux/mx-cleanup"
license=('GPL3')
depends=('qt6-base' 'polkit')
makedepends=('cmake' 'ninja' 'qt6-tools')
install=mx-cleanup.install
source=("https://github.com/MX-Linux/mx-cleanup/archive/refs/tags/26.07.4arch.tar.gz")
sha256sums=('7f6872fd39f782199c02d550ce16b4d2e96dd18a6af0d715bc9e08177cd0c80d')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    rm -rf build

    # CMake's project() VERSION only accepts numeric major.minor.patch.tweak,
    # so strip any non-numeric suffix (e.g. "arch") used in the pkgver/tag.
    local _cmakever="${pkgver%%[a-zA-Z]*}"

    cmake -G Ninja \
        -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DHELPER_INSTALL_DIR=/usr/lib/mx-cleanup \
        -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
        -DPROJECT_VERSION_OVERRIDE="${_cmakever}"

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

    install -Dm644 build/org.mxlinux.pkexec.mx-cleanup-helper.policy \
        "${pkgdir}/usr/share/polkit-1/actions/org.mxlinux.pkexec.mx-cleanup-helper.policy"

    install -Dm644 mx-cleanup.desktop "${pkgdir}/usr/share/applications/mx-cleanup.desktop"

    install -Dm644 images/mx-cleanup.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/mx-cleanup.png"

    install -dm755 "${pkgdir}/usr/share/doc/mx-cleanup"
    if [ -d help ]; then
        cp -r help/* "${pkgdir}/usr/share/doc/mx-cleanup/" 2>/dev/null || true
    fi
}
