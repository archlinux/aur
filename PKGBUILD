# Maintainer: envolution
# Contributor: Carl Smedstad <carsme@archlinux.org>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=fbthrift-git
_pkgname=fbthrift
pkgver=2025.06.02.00+r29551+g4241e985d
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
  wangle
  xxhash
  zlib
)
makedepends=(
  git
  boost
  cmake
  cython
  gtest
  mvfst
)
optdepends=(
  'python-snappy: Snappy compression support'
  'python-zstandard: ZStandard compression support'
)
provides=(
  "fbthrift=${pkgver%%+*}"
  python-thrift
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
conflicts=(python-thrift fbthrift)
options=(
  !emptydirs
  !lto
)
source=(git+https://github.com/facebook/fbthrift.git)
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  _version=$(git describe --tags --abbrev=0 | tr - .)
  _commits=$(git rev-list --count HEAD)
  _short_commit_hash=$(git rev-parse --short=9 HEAD)
  echo "${_version#'v'}+r${_commits}+g${_short_commit_hash}"
}
prepare() {
  cd $_pkgname
  # Use system CMake config instead of bundled module
  sed -i 's/find_package(Glog REQUIRED)/find_package(Glog CONFIG REQUIRED)/' \
    CMakeLists.txt
}

build() {
  cd $_pkgname
  cmake -S . -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev \
    -Denable_tests=OFF \
    -DBUILD_SHARED_LIBS=ON \
    -Dthriftpy3=OFF \
    -Dthriftpy=ON \
    -DCMAKE_CXX_STANDARD=20 \
    -DPACKAGE_VERSION="${pkgver%%+*}"

  #fixing a missing path issue in the current release
  mkdir -p build/thrift/conformance/if

  cmake --build build
}

package() {
  cd $_pkgname
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
