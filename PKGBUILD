
pkgname=mingw-w64-arpack
pkgver=3.1.5
pkgrel=1
arch=('any')
pkgdesc='Fortran77 subroutines designed to solve large scale eigenvalue problems (mingw-w64)'
url='http://forge.scilab.org/index.php/p/arpack-ng/'
license=('BSD')
depends=('mingw-w64-lapack')
makedepends=('mingw-w64-gcc')
options=('!buildflags' '!strip' 'staticlibs')
source=("http://forge.scilab.org/upload/arpack-ng/files/arpack-ng_$pkgver.tar.gz")
sha256sums=('a269ce7806bc77ced31ef794d23c3e3aff8543b65550fd7e3e24660f2a79d515')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "$srcdir/arpack-ng-$pkgver"
  for _arch in ${_architectures}; do
    mkdir -p "build-${_arch}" && pushd "build-${_arch}"
    ${_arch}-configure
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/arpack-ng-$pkgver/build-${_arch}"
    make DESTDIR="$pkgdir/" install
    chmod a-x "$pkgdir"/usr/${_arch}/lib/*.dll.a
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
  install -Dm644 ../COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

