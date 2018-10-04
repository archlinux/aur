
pkgname=mingw-w64-muparser
pkgver=2.2.6.1
pkgrel=1
pkgdesc="A fast math parser library (mingw-w64)"
arch=('any')
url="http://muparser.sourceforge.net/"
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
license=('MIT')
options=('!buildflags' 'staticlibs' '!strip')
source=("https://github.com/beltoforion/muparser/archive/v${pkgver}.tar.gz")
sha256sums=('d2562853d972b6ddb07af47ce8a1cdeeb8bb3fa9e8da308746de391db67897b3')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"


build() {
  cd "$srcdir"/muparser-${pkgver}
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch}-static && pushd build-${_arch}-static
    ${_arch}-cmake -DBUILD_SHARED_LIBS=OFF -DENABLE_SAMPLES=OFF ..
    make
    popd
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake -DENABLE_SAMPLES=OFF ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do  
    cd "$srcdir/muparser-${pkgver}/build-${_arch}-static"
    make DESTDIR="$pkgdir" install
    cd "$srcdir/muparser-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    install -d "$pkgdir"/usr/${_arch}/bin/
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

