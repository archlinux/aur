pkgname=mingw-w64-prima
pkgver=0.7.1
pkgrel=1
pkgdesc="package for solving general nonlinear optimization problems without using derivatives (mingw-w64)"
license=('BSD')
arch=('any')
url="https://github.com/libprima/prima"
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=('!buildflags' 'staticlibs' '!strip')
source=("https://github.com/libprima/prima/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('52bc192444b4ebd07c82ef940a01cfe072e8ae2813a84523ec0df55353de7774')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "$srcdir/prima-${pkgver}"
  for _arch in ${_architectures}; do
    ${_arch}-cmake -B build-${_arch}
    make -C build-${_arch}
  done
}

package() {
  cd "$srcdir/prima-${pkgver}"
  for _arch in ${_architectures}; do  
    make -C build-${_arch} DESTDIR="$pkgdir" install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
