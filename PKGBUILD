# Maintainer: Morteza NourelahiAlamdari <m@0t1.me>

pkgname=google-crc32c
pkgver=1.1.2
pkgrel=3
pkgdesc="CRC32C implementation with support for CPU-specific acceleration instructions"
arch=('i686' 'x86_64')
url="https://github.com/google/crc32c/"
license=('BSD 3-Clause')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/google/crc32c/archive/$pkgver.tar.gz")
sha256sums=('ac07840513072b7fcebda6e821068aa04889018f24e10e46181068fb214d7e56')

prepare() {
  mv "crc32c-$pkgver" "$pkgname-$pkgver"
}

build() {
  cd "$pkgname-$pkgver"
  cmake \
      -DCMAKE_BUILD_TYPE=Release \
      -DBUILD_SHARED_LIBS=yes \
      -DCRC32C_BUILD_TESTS=OFF \
      -DCRC32C_BUILD_BENCHMARKS=OFF \
      -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" \
      -DCRC32C_USE_GLOG=OFF \
      -S . -B cmake-out
  cmake --build cmake-out -- -j ${NCPU:-4}
}

package() {
  cd "$pkgname-$pkgver"
  cmake --build cmake-out --target install -- -j ${NCPU:-4}
}
