pkgname=mingw-w64-minizip
pkgver=1.2.13
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
sha256sums=('b3a24de97a8fdbc835b9833169501030b8977031bcb54b3b3ac13740f846ab30'
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
