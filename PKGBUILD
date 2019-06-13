# Maintainer: Andrew Sun <adsun701@gmail.com>
# Contributor: Filip Brcic <brcha@gna.org>

pkgname=mingw-w64-pdcurses
provides=(mingw-w64-curses)
pkgver=4.1.0
pkgrel=1
pkgdesc="Public Domain Curses wincon port (mingw-w64)"
arch=('any')
url="https://www.projectpluto.com/win32a.htm"
depends=('mingw-w64-crt')
makedepends=('mingw-w64-gcc')
options=(staticlibs !buildflags !strip)
license=("public domain")
source=(pdcurses-${pkgver}.tar.gz::"https://github.com/Bill-Gray/PDCurses/archive/v${pkgver}.tar.gz"
        001-mingw-pdcurses-4.1.0-build.patch
        002-fix-exports.patch)
sha256sums=('3421e2e84bdc8220dc6740b70aa9b0e30542064189efc8609e00de78ced75656'
            '913b5aff09d0ab1a2197f66a98657927d85a0dc3577c2b5e69179148fb2b0242'
            '246f93facdd2703f8b9d0bcd57e89688fd861d34a30facc60a48892b330b08bc')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/PDCurses-${pkgver}"
  patch -p1 -i ${srcdir}/001-mingw-pdcurses-4.1.0-build.patch
  patch -p1 -i ${srcdir}/002-fix-exports.patch
}

build() {
  cd "${srcdir}/PDCurses-${pkgver}"
  for _arch in ${_architectures}; do
# NOte that you should use something like -${_arch}
# to prevent building i686 compiled binaries from
# being compiled with x86_64 compiled binaries and
# vice-versa.  That causes build failures - no surpise.
    cp -rf wingui wingui-shared-${_arch}
    pushd wingui-shared-${_arch}
      make -f Makefile.mng \
        CC=${_arch}-gcc \
        LINK=${_arch}-gcc \
        STRIP=${_arch}-strip \
        AR=${_arch}-ar \
        WIDE=Y \
        UTF8=Y \
        DLL=Y
    popd

    cp -rf wingui wingui-static-${_arch}
    pushd wingui-static-${_arch}
      make -f Makefile.mng \
        CC=${_arch}-gcc \
        LINK=${_arch}-gcc \
        STRIP=${_arch}-strip \
        AR=${_arch}-ar \
        WIDE=Y \
        UTF8=Y
    popd 
  done
}

package() {
  cd "${srcdir}/PDCurses-${pkgver}"
  for _arch in ${_architectures} ; do
    mkdir -p ${pkgdir}/usr/${_arch}/{bin,include,lib}
    mkdir ${pkgdir}/usr/${_arch}/include/pdcurses
    
    install wingui-shared-${_arch}/*.exe ${pkgdir}/usr/${_arch}/bin/
    install wingui-shared-${_arch}/libpdcurses.dll ${pkgdir}/usr/${_arch}/bin/
    install wingui-shared-${_arch}/libpdcurses.dll.a ${pkgdir}/usr/${_arch}/lib/libpdcurses.dll.a
    install wingui-shared-${_arch}/libpdcurses.dll.a ${pkgdir}/usr/${_arch}/lib/libcurses.dll.a
    install wingui-shared-${_arch}/libpdcurses.dll.a ${pkgdir}/usr/${_arch}/lib/libpanel.dll.a

    install wingui-static-${_arch}/libpdcurses.a ${pkgdir}/usr/${_arch}/lib/libpdcurses.a
    install wingui-static-${_arch}/libpdcurses.a ${pkgdir}/usr/${_arch}/lib/libcurses.a
    install wingui-static-${_arch}/libpdcurses.a ${pkgdir}/usr/${_arch}/lib/libpanel.a

    echo '#include "pdcurses/curses.h"' > pdcurses.h
    install -m 0644 curses.h panel.h term.h acs_defs.h ${pkgdir}/usr/${_arch}/include/pdcurses/
    install -m 0644 pdcurses.h ${pkgdir}/usr/${_arch}/include/pdcurses.h

    find "$pkgdir/usr/${_arch}" -name '*.exe' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
  done
}
