
pkgname=mingw-w64-arpack
pkgver=3.6.3
pkgrel=1
arch=('any')
pkgdesc='Fortran77 subroutines designed to solve large scale eigenvalue problems (mingw-w64)'
url='http://forge.scilab.org/index.php/p/arpack-ng/'
license=('BSD')
depends=('mingw-w64-lapack')
makedepends=('mingw-w64-configure')
options=('!buildflags' '!strip' 'staticlibs')
source=("https://github.com/opencollab/arpack-ng/archive/${pkgver}.tar.gz")
sha256sums=('64f3551e5a2f8497399d82af3076b6a33bf1bc95fc46bbcabe66442db366f453')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "$srcdir/arpack-ng-${pkgver}"
  ./bootstrap
  for _arch in ${_architectures}; do
    mkdir -p "build-${_arch}" && pushd "build-${_arch}"
    ${_arch}-configure
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/arpack-ng-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir/" install
    chmod a-x "$pkgdir"/usr/${_arch}/lib/*.dll.a
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

