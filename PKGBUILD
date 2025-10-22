# Maintainer: envolution
# Contributor: Carl Smedstad <carsme@archlinux.org>
# Contributor: envolution
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=fbthrift
pkgver=2025.10.20.00
pkgrel=1
pkgdesc="Facebook's branch of Apache Thrift, including a new C++ server"
arch=(x86_64)
url="https://github.com/facebook/fbthrift"
license=(Apache-2.0)
depends=(
  boost-libs
  double-conversion
  fizz=$pkgver
  fmt
  folly=$pkgver
  gcc-libs
  gflags
  glibc
  google-glog
  openssl
  python
  wangle=$pkgver
  xxhash
  zlib
)
makedepends=(
  boost
  cmake
  cython
  gtest
  mvfst=$pkgver
  ninja
)
optdepends=(
  'python-snappy: Snappy compression support'
  'python-zstandard: ZStandard compression support'
)
provides=(
  libasync.so
  libcompiler.so
  libcompiler_ast.so
  libconcurrency.so
  librpcmetadata.so
  libserverdbginfo.so
  libthrift-core.so
  libthriftannotation.so
  libthriftanyrep.so
  libthriftcpp2.so
  libthriftfrozen2.so
  libthriftmetadata.so
  libthriftprotocol.so
  libthrifttype.so
  libthrifttyperep.so
  libtransport.so
)
conflicts=(python-thrift)
options=(
  !emptydirs
  !lto
)
source=(
 "$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
)
sha256sums=('9c7b82ca772821d7629940ff17e78141d7417689c1682996ddfb1e4cab29afdd')

prepare() {
  cd "$pkgname-$pkgver"
  # Use system CMake config instead of bundled module
  sed -i 's/find_package(Glog REQUIRED)/find_package(Glog CONFIG REQUIRED)/' \
    CMakeLists.txt
}

build() {
  cd "$pkgname-$pkgver"
  cmake -S . -B build \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev \
    -Denable_tests=ON \
    -DBUILD_SHARED_LIBS=ON \
    -Dthriftpy3=OFF \
    -Dthriftpy=ON \
    -DCMAKE_CXX_STANDARD=20 \
    -DPACKAGE_VERSION="$pkgver"

  cmake --build build
}

check() {
  cd "$pkgname-$pkgver"
  ctest --test-dir build --output-on-failure --exclude-regex "[Bb]ig|[Ii]ntegration"
}

package() {
  cd "$pkgname-$pkgver"
  DESTDIR="$pkgdir" cmake --install build

  # Move Python extensions to site-packages
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -vdm755 "$pkgdir/$site_packages/thrift"
  mv -vt "$pkgdir/$site_packages/thrift" \
    "$pkgdir/usr/lib/fb-py-libs/thrift_py/thrift/"*
  mv -vt "$pkgdir/$site_packages/thrift/util" \
    "$pkgdir/usr/lib/fb-py-libs/thrift_py_inspect/thrift/util/"*
  rm -vr "$pkgdir/usr/lib/fb-py-libs"
}
# vim:set ts=2 sw=2 et:
