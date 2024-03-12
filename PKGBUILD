# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Maintainer: László Várady <laszlo.varady93@gmail.com>
# Contributor: Aleksandar Trifunović <akstrfn at gmail dot com>
# Contributor: Daichi Shinozaki <dsdseg at gmail dot com>

pkgname=wangle
pkgver=2024.03.11.00
pkgrel=1
pkgdesc="C++ networking library providing client/server abstractions for building services"
arch=(x86_64)
url="https://github.com/facebook/wangle"
license=(Apache-2.0)
depends=(
  double-conversion
  fizz
  fmt
  folly
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
provides=(libwangle.so)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('43095b3ef7abcadc3681f33aec36d5c3a2e3cf3b661949842719c61cd6afe8dd')

_archive="$pkgname-$pkgver"

prepare() {
  cd "$_archive/wangle"

  # Use system CMake config instead of bundled module, incompatible with glog
  # v0.7.0+
  sed -i 's/find_package(Glog REQUIRED)/find_package(Glog CONFIG REQUIRED)/' \
    CMakeLists.txt
}

build() {
  cd "$_archive/wangle"

  cmake -S . -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev \
    -DBUILD_TESTS=ON \
    -DBUILD_SHARED_LIBS=ON \
    -DPACKAGE_VERSION="$pkgver"
  cmake --build build
}

check() {
  cd "$_archive/wangle"

  ctest --test-dir build --output-on-failure \
    -E SSLContextManagerTest
}

package() {
  cd "$_archive/wangle"

  DESTDIR="$pkgdir" cmake --install build

  # Remove empty directories to avoid namcap warnings
  rm -r "$pkgdir/usr/include/wangle/service/test"
  rm -r "$pkgdir/usr/include/wangle/ssl/test/certs"
  rm -r "$pkgdir/usr/include/wangle/util/test"
}
