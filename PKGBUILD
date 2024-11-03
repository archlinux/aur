# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=fb303
pkgver=2024.10.28.00
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
  mvfst
)
provides=(
  libfb303.so
  libfb303_thrift_cpp.so
)
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('522f4ba3eb8781c72eeb62896606be72d85753321bbe495903f3b8eed9c19253')

prepare() {
  cd $pkgname-$pkgver
  # Use system CMake config instead of bundled module
  sed -i 's/find_package(Glog MODULE REQUIRED)/find_package(Glog CONFIG REQUIRED)/' \
    CMakeLists.txt
}

build() {
  cd $pkgname-$pkgver
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
  cd $pkgname-$pkgver
  ctest --test-dir build --output-on-failure
}

package() {
  cd $pkgname-$pkgver
  DESTDIR="$pkgdir" cmake --install build

  # Remove empty dirs to silence namcap warnings
  rm -vr "$pkgdir/usr/include/fb303/test"
  rm -vr "$pkgdir/usr/include/fb303/thrift/clients"
  rm -vr "$pkgdir/usr/include/fb303/thrift/services"
}
