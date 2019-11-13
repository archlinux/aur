# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname='apache-orc'
pkgver=1.6.1
pkgrel=1
pkgdesc="A columnar storage for Hadoop workloads."
arch=('x86_64')
url="https://orc.apache.org"
license=('Apache')
depends=()
options=('staticlibs')
optdepends=()
makedepends=('cmake' 'lz4-static' 'protobuf-static' 'snappy-static' 'zlib-static' 'zstd-static')
source=("orc-$pkgver.tar.gz::https://github.com/apache/orc/archive/rel/release-$pkgver.tar.gz"
  "cmake.patch")
sha256sums=('92948388c7b188e2e1f3b880cae2c87571a9f8f312c32f58f64f5ab59bcdadfe'
            'e670220ab16b05c7d847d3631d459a165ae07c2714725603ce30f5060ca98ea6')

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
