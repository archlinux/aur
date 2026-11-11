pkgname=mingw-w64-cminpack
pkgver=1.3.15
pkgrel=1
pkgdesc="A C/C++ rewrite of the MINPACK software (mingw-w64)"
arch=('any')
url='http://devernay.free.fr/hacks/cminpack/cminpack.html'
license=('LicenseRef-MINPACK')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=('!buildflags' 'staticlibs' '!strip')
source=("https://github.com/devernay/cminpack/archive/v${pkgver}.tar.gz")
sha256sums=('4bcc2fb514809eaa7bfecf2f2f663f3f0988a425ff64615316f5c4ed68757b97')

_architectures=${MINGW_W64_ARCHS:-x86_64-w64-mingw32}

build() {
  cd $srcdir/cminpack-${pkgver}
  for _arch in ${_architectures}; do
    ${_arch}-cmake -DBUILD_EXAMPLES=OFF -B build-${_arch} .
    cmake --build build-${_arch}
  done
}

package() {
  cd $srcdir/cminpack-${pkgver}
  for _arch in ${_architectures}; do
    DESTDIR="$pkgdir" cmake --build build-${_arch} --target install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
