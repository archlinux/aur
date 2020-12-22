# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname='apache-orc'
pkgver=1.6.6
pkgrel=1
pkgdesc="A columnar storage for Hadoop workloads."
arch=('x86_64')
url="https://orc.apache.org"
license=('Apache')
depends=('protobuf' 'snappy' 'zstd')
options=('staticlibs')
optdepends=()
makedepends=('cmake')
source=("orc-$pkgver.tar.gz::https://github.com/apache/orc/archive/rel/release-$pkgver.tar.gz"
  "541.patch")
sha256sums=('9a92b3eaad1d8b88a18cee41058feb34eb43d919df363e0b74a0b857724e4ba0'
            '372282c8853adfb7bf84f5c54eaaa58a0898417fb2e42948a08eba9d2aa0e872')

prepare() {
  cd orc-rel-release-$pkgver
  patch -p1 < ../541.patch
}

build(){
  cmake -B build -DCMAKE_CXX_FLAGS="-fPIC -Wno-parentheses" \
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
  orc-rel-release-$pkgver
  make -C build
}

package(){
  make DESTDIR="${pkgdir}" -C build install
}

# vim:ts=2:sw=2:et:
