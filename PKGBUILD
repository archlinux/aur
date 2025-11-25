# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Maintainer: László Várady <laszlo.varady93@gmail.com>
# Contributor: envolution
# Contributor: Aleksandar Trifunović <akstrfn at gmail dot com>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=fizz
pkgver=2025.11.24.00
pkgrel=1
pkgdesc="C++14 implementation of the TLS-1.3 standard"
arch=(x86_64)
url="https://github.com/facebookincubator/fizz"
license=(BSD-3-Clause)
depends=(
  double-conversion
  fmt
  folly=$pkgver
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
sha256sums=('7c742c7944ea75f4f1bd12a4609fc898c8027f12f59774fb928d62a9a9e224d6')

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
  rm -vfr "$pkgdir/usr/include/fizz/tool/test"
  rm -vfr "$pkgdir/usr/include/fizz/util/test"

  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
# vim:set ts=2 sw=2 et:
