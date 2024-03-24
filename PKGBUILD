# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=fbthrift
pkgver=2024.04.01.00
pkgrel=1
pkgdesc="Facebook's branch of Apache Thrift, including a new C++ server"
arch=(x86_64)
url="https://github.com/facebook/fbthrift"
license=(Apache-2.0)
depends=(
  boost-libs
  double-conversion
  fizz
  fmt
  folly
  gcc-libs
  gflags
  glibc
  google-glog
  openssl
  python
  python-six
  wangle
  zlib
)
makedepends=(
  boost
  cmake
  cython
  gtest
  mvfst
)
provides=(
  libasync.so
  libcompiler.so
  libcompiler_ast.so
  libconcurrency.so
  libmustache.so
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
options=(
  !emptydirs
  !lto
)
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
  "remove-python-six-dependency-from-cmake-files.patch"
)
sha256sums=(
  'e408a973a59a37def97a8e0ec368ee9fa39c8d49c925ecf7335f1c0463c1a819'
  'bedcf4d00d08263a943d0878b9a0fe68c0fafebd33b5445ae35f84a3e92540ec'
)

_archive="$pkgname-$pkgver"

prepare() {
  cd "$_archive"

  patch --forward --strip=1 --input="$srcdir/remove-python-six-dependency-from-cmake-files.patch"

  # Use system CMake config instead of bundled module, incompatible with glog
  # v0.7.0+
  sed -i 's/find_package(Glog REQUIRED)/find_package(Glog CONFIG REQUIRED)/' \
    CMakeLists.txt
}

build() {
  cd "$_archive"

  cmake -S . -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev \
    -Denable_tests=ON \
    -DBUILD_SHARED_LIBS=ON \
    -Dthriftpy3=OFF \
    -Dthriftpy=ON \
    -DCMAKE_CXX_STANDARD=20 \
    -DHAVE_STREAM_SUPPORT=ON \
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

  # Move Python extensions to site-packages
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -dm755 "$pkgdir/$site_packages/thrift"
  mv -t "$pkgdir/$site_packages/thrift" \
    "$pkgdir/usr/lib/fb-py-libs/thrift_py/thrift/"*
  mv -t "$pkgdir/$site_packages/thrift/util" \
    "$pkgdir/usr/lib/fb-py-libs/thrift_py_inspect/thrift/util/"*
  rm -r "$pkgdir/usr/lib/fb-py-libs"
}
