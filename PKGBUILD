# Maintainer: Andrew Sun <adsun701@gmail.com>

pkgname=mingw-w64-gf2x
pkgver=1.2
pkgrel=2
pkgdesc="A library for multiplying polynomials over the binary field (mingw-w64)"
arch=('any')
url="https://gforge.inria.fr/projects/gf2x/"
license=('GPL' 'LGPL')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-configure')
options=('staticlibs' '!buildflags' '!strip')
source=("https://gforge.inria.fr/frs/download.php/file/36935/gf2x-1.2-LGPL.tar.gz")
sha256sums=('80d7abf1f788820e16a7c827df35ea96b40dbffad565e48fcecc228b557fa6a0')

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

