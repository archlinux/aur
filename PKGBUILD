pkgname=mingw-w64-minizip
pkgver=1.3.1
pkgrel=1
pkgdesc='Mini zip and unzip based on zlib (mingw-w64)'
url='https://www.zlib.net/'
license=('custom')
arch=('any')
makedepends=('mingw-w64-configure')
options=('!buildflags' 'staticlibs' '!strip')
depends=('mingw-w64-zlib')
source=("https://zlib.net/zlib-${pkgver}.tar.gz"{,.asc})
validpgpkeys=('5ED46A6721D365587791E2AA783FCD8E58BCAFBA') # Mark Adler <madler@alumni.caltech.edu>
sha256sums=('9a93b2b7dfdac77ceba5a558a580e74667dd6fede4585b91eefb60f03b72df23'
            'SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"


prepare() {
  cd "$srcdir"/zlib-${pkgver}/contrib/minizip
  sed -i "s|\-version\-info|\-no\-undefined \-version\-info|g" Makefile.am
  autoreconf -vfi
}

build() {
  cd "$srcdir"/zlib-${pkgver}/contrib/minizip
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir"/zlib-${pkgver}/contrib/minizip/build-${_arch}
    make install DESTDIR="$pkgdir"
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
