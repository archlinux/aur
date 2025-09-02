# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Maintainer: László Várady <laszlo.varady93@gmail.com>
# Contributor: envolution
# Contributor: Aleksandar Trifunović <akstrfn at gmail dot com>
# Contributor: Daichi Shinozaki <dsdseg at gmail dot com>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=wangle
pkgver=2025.09.01.00
pkgrel=1
pkgdesc="C++ networking library providing client/server abstractions for building services"
arch=(x86_64)
url="https://github.com/facebook/wangle"
license=(Apache-2.0)
depends=(
  double-conversion
  fizz=$pkgver
  fmt
  folly=$pkgver
  gcc-libs
  gflags
  glibc
  google-glog
  openssl
)
makedepends=(
  boost
  cmake
  gtest
)
checkdepends=(expat)
provides=(libwangle.so)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('0e8f19d5b0c96e112b7cbe5f9544d7f4088d4d5c53a71d26b525d079c5550e4e')

prepare() {
  cd $pkgname-$pkgver
  # Use system CMake config instead of bundled module, incompatible with glog
  # v0.7.0+
  sed -i 's/find_package(Glog REQUIRED)/find_package(Glog CONFIG REQUIRED)/' \
    wangle/CMakeLists.txt
}

build() {
  cd $pkgname-$pkgver
  cmake -S wangle -B build \
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
  skip_tests=(
    SSLContextManagerTest
    BootstrapTest
  )
  ctest --test-dir build --output-on-failure -E "$(IFS='|'; echo "${skip_tests[*]}")"
  ctest "$skipped_tests_pattern"
}

package() {
  cd $pkgname-$pkgver
  DESTDIR="$pkgdir" cmake --install build

  # Remove empty directories to avoid namcap warnings
  rm -vr "$pkgdir/usr/include/wangle/service/test"
  rm -vr "$pkgdir/usr/include/wangle/ssl/test/certs"
  rm -vr "$pkgdir/usr/include/wangle/util/test"
}
# vim:set ts=2 sw=2 et:
