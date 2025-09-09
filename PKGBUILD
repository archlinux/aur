# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: envolution
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=edencommon
pkgver=2025.09.08.00
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
sha256sums=('8bd6a7e9cfc0043c9ca3ec4039414616474b522cff97c0c3d516da0708944c7e'
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
