# Maintainer: envolution
# Contributor: Carl Smedstad <carsme@archlinux.org>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=fb303-git
_pkgname=fb303
pkgver=2025.06.02.00
pkgrel=1
pkgdesc="thrift functions for querying stats and other information from a service"
arch=(x86_64)
url="https://github.com/facebook/fb303"
license=(Apache-2.0)
depends=(
  fbthrift
  fmt
  folly
  gcc-libs
  gflags
  glibc
  google-glog
  python
)
makedepends=(
  git
  boost
  cmake
  mvfst
)
conflicts=(fb303)
provides=(
  "fb303=${pkgver%%+*}"
  libfb303.so
  libfb303_thrift_cpp.so
)
options=(!lto)
source=(git+https://github.com/facebook/fb303.git fix-py-thrift-include.patch)
sha256sums=('SKIP'
            'ea5a29bbc5db28cf694a3734090d561c7b60278d5148a5a70b238d3a6e75a4a4')

prepare() {
  cd $_pkgname
  # Use system CMake config instead of bundled module
  sed -i 's/find_package(Glog MODULE REQUIRED)/find_package(Glog CONFIG REQUIRED)/' \
    CMakeLists.txt
  patch -Np1 -i ../fix-py-thrift-include.patch
}

build() {
  cd $_pkgname
  cmake -S . -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev \
    -DBUILD_SHARED_LIBS=ON \
    -DPYTHON_EXTENSIONS=ON \
    -DFBTHRIFT_INCLUDE_DIR=/usr/include/thrift \
    -DPACKAGE_VERSION="${pkgver%%+*}"
  cmake --build build
}

package() {
  cd $_pkgname
  DESTDIR="$pkgdir" cmake --install build

  # Remove empty dirs to silence namcap warnings
  rm -vr "$pkgdir/usr/include/fb303/test" || true
  rm -vr "$pkgdir/usr/include/fb303/thrift/clients" || true
  rm -vr "$pkgdir/usr/include/fb303/thrift/services" || true
}
# vim:set ts=2 sw=2 et:
