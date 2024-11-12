# Maintainer: Leonidas Spyropoulos <artafinde@archlinux.org>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Konstantinos Sideris <siderisk at auth dot gr>

pkgname=nheko
pkgver=0.12.0
pkgrel=8
pkgdesc="Desktop client for the Matrix protocol"
arch=('x86_64')
url="https://nheko.im/nheko-reborn/nheko"
license=(GPL-3.0-or-later)
depends=(qt6-base qt6-svg qt6-multimedia qtkeychain-qt6 \
         qt6-declarative qt6-imageformats coeurl mtxclient lmdb cmark libolm hicolor-icon-theme \
         kdsingleapplication gst-plugins-bad-libs 'org.freedesktop.secrets')
makedepends=("git" "cmake" "gcc" "fontconfig" "qt6-tools" "nlohmann-json" "asciidoc")
optdepends=('qt6-jdenticon: Auto-generated profile pictures (identicons)'
            'kimageformats: Extends the formats nheko supports for image attachments'
            'gst-plugins-base-libs: VoIP/Video calls' 
            'gst-plugins-good: VoIP/Video calls'
            'gst-plugins-bad: VoIP/Video calls'
            'libnice: VoIP/Video calls'
            'gst-libav: Video messages'
            'gst-plugin-qml6: Video calls support')
makedepends=(cmake ninja qt6-tools fontconfig nlohmann-json asciidoc lmdbxx spdlog)
source=("$pkgname-$pkgver.tar.gz::https://nheko.im/nheko-reborn/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz"
        nheko-0_12_0-fix-fmt11-build-error1.patch::https://nheko.im/nheko-reborn/nheko/-/commit/8ff28245275eeb0cfe4ed40bd62b97cebbce4861.patch
        nheko-0_12_0-fix-fmt11-build-error2.patch::https://nheko.im/nheko-reborn/nheko/-/commit/2d9142d491fed4feed00342193adfc7a268ce71d.patch)
sha512sums=('2b69fa093168c9af9c43b7791f4186d0409caed1f272ca72e0e932da03ffb9ceb5609a495d4d7978f8b5666340aa97f358f904c7c61c67b6bd7221093c3cb66c'
            '54d028096c65a68bce883ad9ccc7e0b9da850bfa1c40b4029e9c79b2dd0052cc3dec2a9cd4b103c0d04e59256633f0370c67cff5efb24a6eb370c0c76b89380b'
            'a801cd3f3a61d8370b1f8a49a7368b681ee43256d98c2b726ba62d7ea63827d8da5ec1c7fb92b0e5e6c2c6bf1018a154c1988d4b88dec3b92d3397a039526197')

prepare() {
  patch -Np1 -d "$pkgname-v$pkgver" -i "${srcdir}/nheko-0_12_0-fix-fmt11-build-error1.patch"
  patch -Np1 -d "$pkgname-v$pkgver" -i "${srcdir}/nheko-0_12_0-fix-fmt11-build-error2.patch"
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

