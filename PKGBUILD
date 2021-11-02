# Contributor: Andrew Sun <adsun701 at gmail dot com>

pkgname=mingw-w64-gf2x
pkgver=1.3.0
pkgrel=1
pkgdesc="A library for multiplying polynomials over the binary field (mingw-w64)"
arch=('any')
url="https://gitlab.inria.fr/gf2x/gf2x"
license=('GPL' 'LGPL')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-configure')
options=('staticlibs' '!buildflags' '!strip')
source=("https://gitlab.inria.fr/gf2x/gf2x/uploads/f568ff2426e59940960607f31d6453e8/gf2x-${pkgver}-LGPL.tar.gz")
sha256sums=('53f52c59c870cdac1d18803618a5d8d50fde9b806dd4abc37c7c0ab724f7f7fd')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "$srcdir/gf2x-$pkgver-LGPL"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure gf2x_cv_prog_exeext_for_build=".exe" --disable-hardware-specific-code
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/gf2x-$pkgver-LGPL/build-${_arch}"
    make install DESTDIR="$pkgdir"
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

