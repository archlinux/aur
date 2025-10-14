# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: envolution
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=fb303
pkgver=2025.10.13.00
pkgrel=1
pkgdesc="thrift functions that provide a mechanism for querying information from a service"
arch=(x86_64)
url="https://github.com/facebook/fb303"
license=(Apache-2.0)
depends=(
  fbthrift=$pkgver
  fmt
  folly=$pkgver
  gcc-libs
  gflags
  glibc
  google-glog
  python
)
makedepends=(
  boost
  cmake
  mvfst=$pkgver
)
provides=(
  libfb303.so
  libfb303_thrift_cpp.so
)
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
  pass-thrift-include-to-python.patch::https://patch-diff.githubusercontent.com/raw/facebook/fb303/pull/68.patch)
sha256sums=('3355d537043ba826a26e8bb8820f9f02257b5ad1d1ebc3e657fc1f7993bb0e04'
            '89ccb751f778b43d1eb4804eee1c041a5f9d8626d82034564300ee2bd4e731d9')

prepare() {
  cd $pkgname-$pkgver
  # Use system CMake config instead of bundled module
  sed -i 's/find_package(Glog MODULE REQUIRED)/find_package(Glog CONFIG REQUIRED)/' \
    CMakeLists.txt
  patch -Np1 -i ../pass-thrift-include-to-python.patch
}

build() {
  cd $pkgname-$pkgver
  cmake -S . -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_CXX_STANDARD=20 \
    -Wno-dev \
    -DBUILD_SHARED_LIBS=ON \
    -DPYTHON_EXTENSIONS=ON \
    -DThrift_INCLUDE_DIR=/usr/include \
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

  # Remove empty dirs to silence namcap warnings
  rm -vfr "$pkgdir/usr/include/fb303/test"
  rm -vfr "$pkgdir/usr/include/fb303/thrift/clients"
  rm -vfr "$pkgdir/usr/include/fb303/thrift/services"
}
# vim:set ts=2 sw=2 et:
