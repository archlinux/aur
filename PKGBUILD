pkgname=mingw-w64-gmp-ecm
pkgver=7.0.7
pkgrel=1
pkgdesc="Elliptic Curve Method for Integer Factorization (mingw-w64)"
arch=(any)
url='https://gitlab.inria.fr/zimmerma/ecm'
license=(GPL-3.0-or-later)
depends=(mingw-w64-gmp mingw-w64-primesieve)
makedepends=(mingw-w64-configure)
options=('!buildflags' '!strip' 'staticlibs')
source=(git+https://gitlab.inria.fr/zimmerma/ecm#tag=git-$pkgver)
sha256sums=('681d8c5d5922d33da39a510de11494b247dace926fe4bac8f75cda37e7e7bae8')

_architectures=${MINGW_W64_ARCHS:-x86_64-w64-mingw32}

prepare() {
  cd ecm
  autoreconf -vi
}

build() {
  cd ecm
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure --enable-openmp ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir"/ecm/build-${_arch}
    make DESTDIR="$pkgdir" install
    rm -r "$pkgdir"/usr/${_arch}/share
    rm "$pkgdir"/usr/${_arch}/bin/*.exe
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
  done
}
