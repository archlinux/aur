pkgname=mingw-w64-minizip
pkgver=1.2.8
pkgrel=2
epoch=1
pkgdesc='ZIP file extraction library (mingw-w64)'
url='https://github.com/nmoinvaz/minizip'
license=('ZLIB' 'custom')
arch=('any')
makedepends=('git' 'mingw-w64-configure')
options=('!buildflags' 'staticlibs' '!strip')
depends=('mingw-w64-zlib')
source=("git://github.com/nmoinvaz/minizip.git#commit=dc41b3b")
md5sums=('SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"


prepare() {
  cd minizip
  sed -i "s|\-version\-info|\-no\-undefined \-version\-info|g" Makefile.am

  autoreconf -vfi
}

build() {
  cd minizip
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/minizip/build-${_arch}"
    make install DESTDIR="$pkgdir"
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
