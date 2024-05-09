# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=fb303
pkgver=2024.05.06.00
pkgrel=1
pkgdesc="A core set of thrift functions that provide a common mechanism for querying stats and other information from a service"
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
  boost
  cmake
)
provides=(
  libfb303.so
  libfb303_thrift_cpp.so
)
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('bc5ee6bdd16a181c26c496a4b07604517bbf1453c992303e0bffdb2f5f6d02aa')

_archive="$pkgname-$pkgver"

prepare() {
  cd "$_archive"

  # Use system CMake config instead of bundled module, incompatible with glog
  # v0.7.0+
  sed -i 's/find_package(Glog MODULE REQUIRED)/find_package(Glog CONFIG REQUIRED)/' \
    CMakeLists.txt
}

build() {
  cd "$_archive"

  cmake -S . -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev \
    -DBUILD_SHARED_LIBS=ON \
    -DPYTHON_EXTENSIONS=ON \
    -DPACKAGE_VERSION="$pkgver"
  cmake --build build
}

check() {
  cd "$_archive"

  ctest --test-dir build --output-on-failure
}

package() {
  cd "$_archive"

  DESTDIR="$pkgdir" cmake --install build

  # Remove empty dirs to silence namcap warnings
  rm -r \
    "$pkgdir/usr/include/fb303/test" \
    "$pkgdir/usr/include/fb303/thrift/clients" \
    "$pkgdir/usr/include/fb303/thrift/services"
}
