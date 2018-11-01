pkgname=mingw-w64-minizip
pkgver=1.2.11
pkgrel=1
epoch=1
pkgdesc='ZIP file extraction library (mingw-w64)'
url='https://www.zlib.net/'
license=('custom')
arch=('any')
makedepends=('mingw-w64-configure')
options=('!buildflags' 'staticlibs' '!strip')
depends=('mingw-w64-zlib')
source=("https://zlib.net/zlib-${pkgver}.tar.gz"{,.asc})
validpgpkeys=('5ED46A6721D365587791E2AA783FCD8E58BCAFBA') # Mark Adler <madler@alumni.caltech.edu>
md5sums=('1c9f62f0778697a09d36121ead88e08e'
         'SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"


prepare() {
  cd "$srcdir"/zlib-${pkgver}
  # https://github.com/madler/zlib/pull/229: don't install crypt.h
  curl -L https://github.com/madler/zlib/pull/229.patch | patch -p1

  cd contrib/minizip
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
