# Maintainer: Andrew Sun <adsun701@gmail.com>

pkgname=mingw-w64-mpfi
pkgver=1.5.4
pkgrel=1
pkgdesc="C library for interval arithmetic (mingw-w64)"
arch=('any')
url="http://perso.ens-lyon.fr/nathalie.revol/software.html"
license=('GPL')
makedepends=('mingw-w64-configure')
depends=('mingw-w64-mpfr')
options=('!strip' '!buildflags' 'staticlibs')
source=("https://gforge.inria.fr/frs/download.php/latestfile/181/mpfi-${pkgver}.tar.gz" div_ext.c)
sha256sums=('76b01b9eed7150a44b3f6aea24ad4ac78b0f2078253be87ff6d1903d02dfa434'
            'aa280208c1168fbdfdac5cbb3fd8421904bc80d6a323de89a4b6b48a66446b01')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/mpfi-${pkgver}/mpfi"
  ./autogen.sh
  cp "${srcdir}"/div_ext.c src # Missing source file
}

build() {
  cd "${srcdir}/mpfi-${pkgver}/mpfi"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/mpfi-${pkgver}/mpfi/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    rm -rf "${pkgdir}/usr/${_arch}/share"
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
