# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname='apache-orc'
pkgver=1.6.3
pkgrel=1
pkgdesc="A columnar storage for Hadoop workloads."
arch=('x86_64')
url="https://orc.apache.org"
license=('Apache')
depends=('gcc-libs')
options=('staticlibs')
optdepends=()
makedepends=('cmake' 'lz4-static' 'protobuf-static' 'snappy-static' 'zlib-static' 'zstd-static')
source=("orc-$pkgver.tar.gz::https://github.com/apache/orc/archive/rel/release-$pkgver.tar.gz"
  "cmake.patch")
sha256sums=('d1bf8342c5c6481e9ffecea843d1d96f6b4f57feb93de0f03d03485989457515'
            '401ca18b23669d0f3240234a8c035505cf73da89c7d803b547f312e66e16e5da')

prepare() {
  cd "$srcdir"
  patch -p0 < cmake.patch
  mkdir -p build
}

build(){
  cd "$srcdir/build"
  cmake -DCMAKE_CXX_FLAGS="-fPIC -Wno-parentheses" \
  -DCMAKE_BUILD_TYPE=Release \
  -DBUILD_CPP_TESTS=OFF \
  -DCMAKE_INSTALL_PREFIX="/usr" \
  -DLZ4_HOME="/usr" \
  -DPROTOBUF_HOME="/usr" \
  -DZLIB_HOME="/usr" \
  -DSNAPPY_HOME="/usr" \
  -DBUILD_LIBHDFSPP=OFF \
  -DBUILD_JAVA=OFF \
  -DZSTD_HOME="/usr" \
  -DINSTALL_VENDORED_LIBS=OFF \
  ../orc-rel-release-$pkgver
  make
}

package(){
  cd "$srcdir/build"
  make DESTDIR="${pkgdir}" install
}

# vim:ts=2:sw=2:et:
