pkgname=mingw-w64-cminpack
pkgver=1.3.11
pkgrel=1
pkgdesc="A C/C++ rewrite of the MINPACK software (mingw-w64)"
arch=('any')
url='http://devernay.free.fr/hacks/cminpack/cminpack.html'
license=('BSD')
depends=('mingw-w64-cblas')
makedepends=('mingw-w64-cmake')
options=('!buildflags' 'staticlibs' '!strip')
source=("https://github.com/devernay/cminpack/archive/v${pkgver}.tar.gz")
sha256sums=('45675fac0a721a1c7600a91a9842fe1ab313069db163538f2923eaeddb0f46de')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd $srcdir/cminpack-${pkgver}
  for _arch in ${_architectures}; do
    ${_arch}-cmake -DCMINPACK_LIB_INSTALL_DIR=lib -DBUILD_EXAMPLES=OFF -B build-${_arch} .
    make -C build-${_arch}
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/cminpack-${pkgver}/build-${_arch}"
    make install DESTDIR="$pkgdir"
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
