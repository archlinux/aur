# Maintainer: Leonidas Spyropoulos <artafinde@archlinux.org>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Konstantinos Sideris <siderisk at auth dot gr>

pkgname=nheko
pkgver=0.11.2
pkgrel=1
pkgdesc="Desktop client for the Matrix protocol"
arch=('x86_64')
url="https://nheko.im/nheko-reborn/nheko"
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
source=("$pkgname-$pkgver.tar.gz::https://nheko.im/nheko-reborn/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha512sums=('67a634b9987afe34ce13ebf79c67464c9dcb2d72479937093ce1d1c8213e55ba7b4f3ff36684b71e7498bb133ab77d70cb5a8df538a42564cb78b604d65e0da9')

prepare() {
  mkdir -p build
}

build() {
  cmake \
    -Bbuild \
    -GNinja \
    -S "$pkgname-v$pkgver" \
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

