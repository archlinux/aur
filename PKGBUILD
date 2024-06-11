# Maintainer: Leonidas Spyropoulos <artafinde@archlinux.org>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Konstantinos Sideris <siderisk at auth dot gr>

pkgname=nheko
pkgver=0.12.0
pkgrel=1
pkgdesc="Desktop client for the Matrix protocol"
arch=('x86_64')
url="https://nheko.im/nheko-reborn/nheko"
license=(GPL-3.0-or-later)
depends=(qt6-base qt6-svg qt6-quickcontrols2 qt6-multimedia qtkeychain-qt6 \
         qt6-declarative qt6-imageformats coeurl mtxclient lmdb cmark libolm hicolor-icon-theme \
         kdsingleapplication gst-plugins-bad-libs 'org.freedesktop.secrets')
makedepends=("git" "cmake" "gcc" "fontconfig" "qt6-tools" "nlohmann-json" "asciidoc")
optdepends=('qt-jdenticon: Auto-generated profile pictures (identicons)'
            'kimageformats: Extends the formats nheko supports for image attachments'
            'gst-plugins-base-libs: VoIP/Video calls' 
            'gst-plugins-good: VoIP/Video calls'
            'gst-plugins-bad: VoIP/Video calls'
            'libnice: VoIP/Video calls'
            'gst-libav: Video messages'
            'gst-plugin-qmlgl: Video calls and Screen sharing')
makedepends=(cmake ninja qt6-tools fontconfig nlohmann-json asciidoc lmdbxx spdlog)
source=("$pkgname-$pkgver.tar.gz::https://nheko.im/nheko-reborn/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha512sums=('2b69fa093168c9af9c43b7791f4186d0409caed1f272ca72e0e932da03ffb9ceb5609a495d4d7978f8b5666340aa97f358f904c7c61c67b6bd7221093c3cb66c')

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

