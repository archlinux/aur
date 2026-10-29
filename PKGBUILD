# Maintainer: panxuc <https://github.com/panxuc>

pkgname=fcitx5-wetypex
pkgver=2.2.3.657
pkgrel=14
pkgdesc="Native Linux compatibility layer for WeType on Fcitx5"
arch=('x86_64')
url="https://github.com/panxuc/fcitx5-wetypex"
license=('MIT' 'ISC' 'BSD-2-Clause' 'curl')
options=('!debug')
depends=(
    'fcitx5>=5.1.9'
    'fcitx5-qt'
    'libime>=1.1.15'
    'libc++'
    'json-c'
    'curl'
    'openssl'
    'bubblewrap'
    'util-linux'
    'python'
    'python-fonttools'
    'python-pillow'
    'fontconfig'
    'wayland'
    'qt6-base'
    'qt6-svg'
    'qt6-webengine'
    'layer-shell-qt'
    'wl-clipboard'
    'pipewire'
    'ffmpeg'
    'libnotify'
    'polkit'
)
makedepends=('cmake' 'clang' 'git' 'boost' 'openssl')
optdepends=('fcitx5-configtool: manage input methods')
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}-${pkgrel}/${pkgname}-${pkgver}.tar.gz"
    'https://curl.se/download/curl-8.22.0.tar.xz'
    'libkqueue::git+https://github.com/mheily/libkqueue.git#commit=46a3e130f88b0b0742575dcb01d77e336538024b'
)
sha256sums=("a2ed25d3805678fe2a8e4d633cef4641f5fa9fde26ee3d3461e6177a4e1bd291" "f7ef3ae8a22e521f289803fe93543eb64c329b58aa73a9e224dfd915a2a5f4f7" "SKIP") # first checksum is filled by the release workflow
install=fcitx5-wetypex.install

build() {
    cmake -S "${srcdir}/${pkgname}-${pkgver}" -B "${srcdir}/build" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib -DWETYPE_LAYER_SHELL=ON \
        -DFETCHCONTENT_SOURCE_DIR_KQUEUE="${srcdir}/libkqueue" \
        -DFETCHCONTENT_SOURCE_DIR_WETYPEX_CURL="${srcdir}/curl-8.22.0"
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
