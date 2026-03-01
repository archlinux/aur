# Maintainer: Adrian <adrian@mxlinux.org>
pkgname=system-keyboard-qt
pkgver=26.02arch
pkgrel=1
pkgdesc="Graphical frontend for configuring X11 keyboard layouts"
arch=('x86_64' 'i686')
url="https://github.com/MX-Linux/system-keyboard-qt"
license=('GPL')
depends=('qt6-base' 'xorg-setxkbmap' 'polkit' 'flags-common')
makedepends=('cmake' 'ninja' 'qt6-tools')
optdepends=('xdg-utils: help display')
source=("https://github.com/MX-Linux/system-keyboard-qt/archive/refs/tags/26.02arch.tar.gz")
sha256sums=('d56ff3994b67a90884c7f8944fa7debd02d788ac86a290cf1fd071005d1eb727')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    rm -rf build

    cmake -G Ninja \
        -B build \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_EXPORT_COMPILE_COMMANDS=ON

    cmake --build build --parallel
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -Dm755 build/system-keyboard-qt "${pkgdir}/usr/bin/system-keyboard-qt"

    install -dm755 "${pkgdir}/usr/share/system-keyboard-qt/locale"
    install -Dm644 build/*.qm "${pkgdir}/usr/share/system-keyboard-qt/locale/" 2>/dev/null || true

    install -dm755 "${pkgdir}/usr/lib/system-keyboard-qt"
    install -Dm755 lib/helper "${pkgdir}/usr/lib/system-keyboard-qt/helper"

    install -Dm644 policy/org.mxlinux.pkexec.system-keyboard-qt.policy \
        "${pkgdir}/usr/share/polkit-1/actions/org.mxlinux.pkexec.system-keyboard-qt.policy"

    install -Dm644 system-keyboard-qt.desktop "${pkgdir}/usr/share/applications/system-keyboard-qt.desktop"

    install -Dm644 system-keyboard-qt.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/system-keyboard-qt.svg"

    install -dm755 "${pkgdir}/usr/share/doc/system-keyboard-qt"
    if [ -f debian/changelog ]; then
        gzip -c debian/changelog > "${pkgdir}/usr/share/doc/system-keyboard-qt/changelog.gz"
    fi
    if [ -d help ]; then
        cp -r help/* "${pkgdir}/usr/share/doc/system-keyboard-qt/" 2>/dev/null || true
    fi
}
