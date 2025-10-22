# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: envolution
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=edencommon
pkgver=2025.10.20.00
pkgrel=1
pkgdesc="Shared library for Watchman and Eden projects"
arch=(x86_64)
url="https://github.com/facebookexperimental/edencommon"
license=(MIT)
depends=(
  boost-libs
  boost
  fb303=$pkgver
  fmt
  folly=$pkgver
  gcc-libs
  glibc
  google-glog
)
makedepends=(
  boost
  cmake
  gtest
  mvfst=$pkgver
)
provides=(
  libedencommon_os.so
  libedencommon_telemetry.so
  libedencommon_testharness.so
  libedencommon_utils.so
)
options=(!lto)
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
  "build-shared-libraries.patch"
)
sha256sums=('124b3ef1c28b5ad356c0ce13e8b2b52b84b85d46acb86e6e99b8345000c24015'
            '1f351de94a786c8be397c07454a48d28a0dd0b758924792e6e3f1f49405c492a')

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 -i ../build-shared-libraries.patch
  # Use system CMake config instead of bundled module
  sed -i 's/find_package(Glog MODULE REQUIRED)/find_package(Glog CONFIG REQUIRED)/' \
    CMakeLists.txt
}

build() {
  cd $pkgname-$pkgver
  cmake -S . -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev
  cmake --build build
}

check() {
  cd $pkgname-$pkgver
  ctest --test-dir build --output-on-failure -E UnixSocket.sendDataAndFiles
}

package() {
  cd $pkgname-$pkgver
  DESTDIR="$pkgdir" cmake --install build
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
# vim:set ts=2 sw=2 et:
