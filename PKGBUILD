
pkgname=mingw-w64-muparser
pkgver=2.3.0
pkgrel=1
pkgdesc="A fast math parser library (mingw-w64)"
arch=('any')
url="http://muparser.sourceforge.net/"
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
license=('custom')
options=('!buildflags' 'staticlibs' '!strip')
source=("https://github.com/beltoforion/muparser/archive/v${pkgver}.tar.gz")
sha256sums=('b324c738a6bd5d4c7651e4d0e2a7e6d601b7cb1b8b17d11c097ce2128b772da0')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"


build() {
  cd "$srcdir"/muparser-${pkgver}
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake -DENABLE_SAMPLES=OFF ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do  
    cd "$srcdir/muparser-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    install -d "$pkgdir"/usr/${_arch}/bin/
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

