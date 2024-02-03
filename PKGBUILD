# Maintainer: Leonidas Spyropoulos <artafinde@archlinux.org>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Konstantinos Sideris <siderisk at auth dot gr>

pkgname=nheko
pkgver=0.11.3
pkgrel=10
pkgdesc="Desktop client for the Matrix protocol"
arch=('x86_64')
url="https://nheko.im/nheko-reborn/nheko"
license=(GPL-3.0-or-later)
depends=(qt5-svg qt5-quickcontrols2 qt5-graphicaleffects qt5-multimedia qtkeychain-qt5 \
        qt5-imageformats coeurl mtxclient lmdb cmark libolm hicolor-icon-theme \
        gst-plugins-bad-libs 'org.freedesktop.secrets')
optdepends=('qt-jdenticon: Auto-generated profile pictures (identicons)'
            'gst-plugins-base-libs: VoIP/Video calls' 
            'gst-plugins-good: VoIP/Video calls'
            'gst-plugins-bad: VoIP/Video calls'
            'libnice: VoIP/Video calls'
            'gst-libav: Video messages'
            'gst-plugin-qmlgl: Video calls and Screen sharing')
makedepends=(cmake ninja boost qt5-tools fontconfig nlohmann-json asciidoc lmdbxx spdlog)
source=("$pkgname-$pkgver.tar.gz::https://nheko.im/nheko-reborn/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz"
        "$pkgname-$pkgver-fix-for-fmt-10.patch"
        "$pkgname-$pkgver-fix-for-fmt-10.1.patch::https://nheko.im/nheko-reborn/nheko/-/commit/871e403f6799df48cfbbe08eba56d473a0c34216.patch")
sha512sums=('b305c1f9045469d8163ea9d851b74f524578cecfd4463e1c2f1a62206b7bf308e4cf537930e03f7f565edc1f72ef12ad9fc8d3950a73fdd11c35ae4fc62f8d2d'
            '67c630939ed11611038a12f13270bb43f8d52f4ffbac35b94f7ffee145ae4d2387ac462cc8b63857d661e4d8a92d77f32ff29222bd47fd61546ca6f214d0f7f9'
            '4c9b0e4f4521a398721c06eefb633c128bbadf5cf5e3480bfc0e1cdbf733f669c46ef7ebd372e66b3b45ddb9e66644af1bb3f81d7b616f3f7203e9c4bcc4628e')

prepare(){
  cd "$pkgname-v$pkgver"
  patch -Np1 < "../$pkgname-$pkgver-fix-for-fmt-10.patch"
  patch -Np1 < "../$pkgname-$pkgver-fix-for-fmt-10.1.patch"
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

