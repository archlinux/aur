pkgname=mingw-w64-libmixmod
pkgver=2.1.9
pkgrel=1
pkgdesc="Classification with Mixture Modelling"
arch=('any')
url="https://github.com/mixmod"
license=('GPL')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=('!buildflags' '!strip' 'staticlibs')
source=("https://github.com/mixmod/mixmod/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2a4bf19e642386d1c8a36365b537a12636f883bcdeb3a72b698947430f676541')

_architecture="i686-w64-mingw32 x86_64-w64-mingw32"

build () {
  cd "$srcdir"/mixmod-${pkgver}
  for _arch in $_architecture; do
    ${_arch}-cmake -B build-${_arch} .
    make -C build-${_arch}
  done
}

package () {
  cd "$srcdir"/mixmod-${pkgver}
  for _arch in $_architecture; do
    make install -C build-${_arch} DESTDIR="$pkgdir"
    rm -r "$pkgdir"/usr/${_arch}/share 
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

