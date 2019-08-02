# Maintainer: Andrew Sun <adsun701@gmail.com>

pkgname=mingw-w64-mpfi
pkgver=1.5.4
pkgrel=2
pkgdesc="C library for interval arithmetic (mingw-w64)"
arch=('any')
url="http://perso.ens-lyon.fr/nathalie.revol/software.html"
license=('GPL')
makedepends=('mingw-w64-configure')
depends=('mingw-w64-mpfr')
options=('!strip' '!buildflags' 'staticlibs')
source=("https://gforge.inria.fr/frs/download.php/file/38111/mpfi-$pkgver.tgz")
sha256sums=('3b3938595d720af17973deaf727cfc0dd41c8b16c20adc103a970f4a43ae3a56')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/mpfi-${pkgver}"
  ./autogen.sh
}

build() {
  cd "${srcdir}/mpfi-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/mpfi-${pkgver}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    rm -rf "${pkgdir}/usr/${_arch}/share"
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
