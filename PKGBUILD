# Maintainer: Morteza NourelahiAlamdari <m@0t1.me>

pkgname=google-cloud-cpp
pkgver=2.8.0
pkgrel=2
pkgdesc="C++ Client Libraries for Google Cloud Services"
arch=('i686' 'x86_64')
url="https://github.com/googleapis/google-cloud-cpp/"
license=('Apache-2.0')
makedepends=('base-devel' 'cmake')
depends=('protobuf' 'grpc' 'nlohmann-json' 'c-ares' 'zlib' 'openssl' 'curl' 'abseil-cpp' 'google-crc32c')
source=("$pkgname-$pkgver.tar.gz::https://github.com/googleapis/google-cloud-cpp/archive/v$pkgver.tar.gz")
sha256sums=('21fb441b5a670a18bb16b6826be8e0530888d0b94320847c538d46f5a54dddbc')

prepare() {
    sed -i '1s/^/include("\/usr\/lib\/cmake\/Crc32c\/Crc32cTargets.cmake")\n/' "$pkgname-$pkgver/google/cloud/storage/CMakeLists.txt"
}

build() {
  cd "$pkgname-$pkgver"
  cmake \
      -DBUILD_TESTING=OFF \
      -DGOOGLE_CLOUD_CPP_ENABLE_EXAMPLES=OFF \
      -DCMAKE_INSTALL_PREFIX="$pkgdir/usr/local" \
      -DINCLUDE_DIRECTORIES="/usr/include/" \
      -DCMAKE_INSTALL_MESSAGE=NEVER \
      -H. -Bcmake-out
  cmake --build cmake-out -- -j "$(nproc)"
}

package() {
  cd "$pkgname-$pkgver"
  cmake --build cmake-out --target install
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
