# Maintainer: Leonidas Spyropoulos <artafinde@archlinux.org>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Konstantinos Sideris <siderisk at auth dot gr>

pkgname=nheko
pkgver=0.11.1
pkgrel=4
pkgdesc="Desktop client for the Matrix protocol"
arch=('x86_64')
url="https://github.com/Nheko-Reborn/nheko"
license=(GPL3)
depends=(qt5-svg qt5-quickcontrols2 qt5-graphicaleffects qt5-multimedia qtkeychain-qt5 \
        coeurl mtxclient lmdb cmark libolm hicolor-icon-theme gst-plugins-bad-libs\
        'org.freedesktop.secrets')
optdepends=('qt-jdenticon: Auto-generated profile pictures (identicons)'
            'gst-plugins-base-libs: VoIP/Video calls' 
            'gst-plugins-good: VoIP/Video calls'
            'gst-plugins-bad: VoIP/Video calls'
            'libnice: VoIP/Video calls'
            'gst-plugin-qmlgl: Video calls and Screen sharing')
makedepends=(cmake ninja boost qt5-tools fontconfig nlohmann-json asciidoc lmdbxx spdlog)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Nheko-Reborn/nheko/archive/v$pkgver.tar.gz")
sha512sums=('3ccaa859ff76a78c024ea2159e666316a3505bc3a3220020a4805ee93351865868b56219ab8421c70ed9922c3f38fbb39370c7f98b702836bd3bb3665c712fda')

prepare() {
  mkdir -p build
}

build() {
  cmake \
    -Bbuild \
    -GNinja \
    -S "$pkgname-$pkgver" \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='lib' \
    -DBUILD_SHARED_LIBS=ON \
    -DBUILD_LIB_TESTS=OFF \
    -DBUILD_LIB_EXAMPLES=OFF \
    -Wno-dev
  cmake --build build --verbose
}

package() {
  depends+=(
    mtxclient libmatrix_client.so
    # lmdb liblmdb.so # https://bugs.archlinux.org/task/77537
    spdlog libspdlog.so
    # cmark libcmark.so # https://bugs.archlinux.org/task/77538
    libolm libolm.so
  )
  DESTDIR="${pkgdir}" cmake --install build
}

