# Maintainer: Andrew Sun <adsun701@gmail.com>
# Contributor: Filip Brcic <brcha@gna.org>

pkgname=mingw-w64-pdcurses
pkgver=3.6
pkgrel=1
pkgdesc="Public Domain Curses wincon port (mingw-w64)"
arch=('any')
url="https://github.com/wmcbrine/PDCurses"
depends=('mingw-w64-crt')
makedepends=('mingw-w64-gcc')
options=(staticlibs !buildflags !strip)
license=("public domain")
source=("https://github.com/wmcbrine/PDCurses/archive/${pkgver}.tar.gz"
        "001-mingw-pdcurses-3.6-build.patch")
sha256sums=('1760cbf3c3f254798e3614efa40206f95fe5bb2ca68eb2be434265d995f078eb'
            '98867a357e172cf18f9bd59fc8208f44ebba6e887f6b87522e32cda333cf416d')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/PDCurses-${pkgver}/wincon"
  patch -Np1 -i ${srcdir}/001-mingw-pdcurses-3.6-build.patch
}

build() {
  cd "${srcdir}/PDCurses-${pkgver}"
  export CFLAGS="-O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions --param=ssp-buffer-size=4"
  for _arch in ${_architectures}; do
    cp -a wincon build-${_arch} && pushd build-${_arch}
    make \
      CC=${_arch}-gcc \
      LINK=${_arch}-gcc \
      STRIP=${_arch}-strip \
      AR=${_arch}-ar \
      WIDE=Y \
      UTF8=Y \
      DLL=Y
    popd
  done
}

package() {
  cd "${srcdir}/PDCurses-${pkgver}"
  for _arch in ${_architectures} ; do
    mkdir -p ${pkgdir}/usr/${_arch}/{bin,include,lib}
    mkdir ${pkgdir}/usr/${_arch}/include/pdcurses
    
    install build-${_arch}/*.exe ${pkgdir}/usr/${_arch}/bin/
    install build-${_arch}/pdcurses.dll ${pkgdir}/usr/${_arch}/bin/
    install build-${_arch}/pdcurses.a ${pkgdir}/usr/${_arch}/lib/libpdcurses.dll.a

    echo '#include "pdcurses/curses.h"' > pdcurses.h
    install -m 0644 pdcurses.h ${pkgdir}/usr/${_arch}/include/pdcurses.h
    install -m 0644 curses.h panel.h term.h ${pkgdir}/usr/${_arch}/include/pdcurses/
    find "$pkgdir/usr/${_arch}" -name '*.exe' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
  done
}
