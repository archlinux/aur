# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Maintainer: László Várady <laszlo.varady93@gmail.com>
# Contributor: Aleksandar Trifunović <akstrfn at gmail dot com>

pkgname=fizz
pkgver=2024.10.28.00
pkgrel=1
pkgdesc="C++14 implementation of the TLS-1.3 standard"
arch=(x86_64)
url="https://github.com/facebookincubator/fizz"
license=(BSD-3-Clause)
depends=(
  double-conversion
  fmt
  folly
  gcc-libs
  gflags
  glibc
  google-glog
  libsodium
  openssl
  zlib
  zstd
)
makedepends=(
  boost
  cmake
  gtest
)
checkdepends=(expat)
provides=(
  libfizz.so
  libfizz_test_support.so
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('b78fc01145beb72188cefb4ab82b87d04e0ab7f712f99d49e80c8a14264ae6b9')

prepare() {
  cd $pkgname-$pkgver
  # Use system CMake config instead of bundled module
  sed -i 's/find_package(Glog REQUIRED)/find_package(Glog CONFIG REQUIRED)/' \
    fizz/CMakeLists.txt
}

build() {
  cd $pkgname-$pkgver
  cmake -S fizz -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev \
    -DBUILD_TESTS=ON \
    -DBUILD_SHARED_LIBS=ON \
    -DPACKAGE_VERSION="$pkgver"
  cmake --build build
}

check() {
  cd $pkgname-$pkgver
  ctest --test-dir build --output-on-failure
}

package() {
  cd $pkgname-$pkgver
  DESTDIR="$pkgdir" cmake --install build

  # Remove empty directories to avoid namcap warnings
  rm -vr "$pkgdir/usr/include/fizz/tool/test"
  rm -vr "$pkgdir/usr/include/fizz/util/test"

  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
