pkgname=mingw-w64-spatialindex
pkgver=1.9.3
pkgrel=1
pkgdesc='Extensible framework that supports robust spatial indexing methods and sophisticated spatial queries (mingw-w64)'
arch=('any')
url="https://libspatialindex.github.io/"
license=(MIT)
depends=(mingw-w64-crt)
makedepends=(mingw-w64-cmake)
options=('!buildflags' 'staticlibs' '!strip')
source=("https://github.com/libspatialindex/libspatialindex/releases/download/${pkgver}/spatialindex-src-${pkgver}.tar.gz")
sha256sums=('47d8779e32477b330e46b62fb7e62cb812caee5d8e684c35cb635a42a749f3fc')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd spatialindex-src-${pkgver}
  curl -L https://github.com/libspatialindex/libspatialindex/pull/185.patch | patch -p1
}

build() {
  cd spatialindex-src-${pkgver}
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake -DSIDX_BIN_SUBDIR=bin ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/spatialindex-src-${pkgver}/build-${_arch}"
    make install DESTDIR="$pkgdir"
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

