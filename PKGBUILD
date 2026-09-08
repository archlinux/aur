# Maintainer: panxuc <https://github.com/panxuc>

pkgname=fcitx5-wetypex
pkgver=2.2.3.657
pkgrel=1
pkgdesc="Native Linux compatibility layer for WeType on Fcitx5"
arch=('x86_64')
url="https://github.com/panxuc/fcitx5-wetypex"
license=('MIT' 'ISC' 'BSD-2-Clause')
options=('!debug')
depends=(
    'fcitx5>=5.1.9'
    'fcitx5-qt'
    'libime>=1.1.15'
    'libc++'
    'json-c'
    'curl'
    'bubblewrap'
    'util-linux'
    'python'
    'qt6-base'
    'qt6-svg'
    'qt6-webengine'
    'wl-clipboard'
    'pipewire'
    'ffmpeg'
    'libnotify'
    'polkit'
)
makedepends=('cmake' 'clang' 'git' 'boost')
optdepends=('fcitx5-configtool: manage input methods')
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    'libkqueue::git+https://github.com/mheily/libkqueue.git#commit=46a3e130f88b0b0742575dcb01d77e336538024b'
)
sha256sums=("4788fd5a77d2d531c77b080d599e1666a139424fb483cca2fd92340c1bccb9e4" "SKIP")
install=fcitx5-wetypex.install

build() {
    cmake -S "${srcdir}/${pkgname}-${pkgver}" -B "${srcdir}/build" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DFETCHCONTENT_SOURCE_DIR_KQUEUE="${srcdir}/libkqueue"
    cmake --build "${srcdir}/build" --parallel
}

package() {
    DESTDIR="${pkgdir}" cmake --install "${srcdir}/build"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/NOTICE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/README.md" \
        "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
