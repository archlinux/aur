# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Filip Brcic <brcha at gna dot org>

pkgname=mingw-w64-pdcurses
provides=(mingw-w64-curses)
pkgver=4.2.0
pkgrel=1
pkgdesc="Public Domain Curses wincon port (mingw-w64)"
arch=('any')
url="https://www.projectpluto.com/win32a.htm"
depends=('mingw-w64-crt')
makedepends=('mingw-w64-gcc')
options=(staticlibs !buildflags !strip)
license=("public domain")
source=(pdcurses-${pkgver}.tar.gz::"https://github.com/Bill-Gray/PDCursesMod/archive/v${pkgver}.tar.gz"
        001-mingw-pdcurses-4.1.0-build.patch)
sha256sums=('bb6e6f6fe3e2fe1e6a5013b980a3b7a547fae9ac00eae9eb8b432ab5003cc7ab'
            '029b3755eacc8b3bebc09767b2090e18c160acc80be0b07742d8aaa098b6be89')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/PDCursesMod-${pkgver}"
  patch -p1 -i ${srcdir}/001-mingw-pdcurses-4.1.0-build.patch
}

build() {
  cd "${srcdir}/PDCursesMod-${pkgver}"
  for _arch in ${_architectures}; do
    cp -rf wingui wingui-shared-${_arch}
    pushd wingui-shared-${_arch}
      make \
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
      make \
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
  cd "${srcdir}/PDCursesMod-${pkgver}"
  for _arch in ${_architectures} ; do
    mkdir -p ${pkgdir}/usr/${_arch}/{bin,include,lib}
    mkdir ${pkgdir}/usr/${_arch}/include/pdcurses
    
    install wingui-shared-${_arch}/libpdcurses.dll ${pkgdir}/usr/${_arch}/bin/
    install wingui-shared-${_arch}/libpdcurses.dll.a ${pkgdir}/usr/${_arch}/lib/libpdcurses.dll.a
    install wingui-shared-${_arch}/libpdcurses.dll.a ${pkgdir}/usr/${_arch}/lib/libcurses.dll.a
    install wingui-shared-${_arch}/libpdcurses.dll.a ${pkgdir}/usr/${_arch}/lib/libpanel.dll.a

    install wingui-static-${_arch}/libpdcurses.a ${pkgdir}/usr/${_arch}/lib/libpdcurses.a
    install wingui-static-${_arch}/libpdcurses.a ${pkgdir}/usr/${_arch}/lib/libcurses.a
    install wingui-static-${_arch}/libpdcurses.a ${pkgdir}/usr/${_arch}/lib/libpanel.a

    echo '#include "pdcurses/curses.h"' > pdcurses.h
    install -m 0644 curses.h curspriv.h panel.h ${pkgdir}/usr/${_arch}/include/pdcurses/
    install -m 0644 pdcurses.h ${pkgdir}/usr/${_arch}/include/pdcurses.h

    find "$pkgdir/usr/${_arch}" -name '*.exe' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
  done
}
