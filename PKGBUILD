# Maintainer: Martchus <martchus@gmx.net>
# Contributor: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Filip Brcic <brcha at gna dot org>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

pkgname=mingw-w64-pdcurses
provides=(mingw-w64-curses)
pkgver=4.5.1
pkgrel=1
pkgdesc="Public Domain Curses wincon port (mingw-w64)"
arch=('any')
url="https://www.projectpluto.com/win32a.htm"
depends=('mingw-w64-crt')
makedepends=('mingw-w64-gcc' 'mingw-w64-environment')
[[ $pkgname =~ .*-clang-.* ]] && makedepends+=('mingw-w64-configure')  # for the sake of pulling in toolchain
options=(staticlibs !buildflags !strip)
license=("Public Domain")
source=(pdcurses-${pkgver}.tar.gz::"https://github.com/Bill-Gray/PDCursesMod/archive/v${pkgver}.tar.gz"
        001-mingw-pdcurses-4.1.0-build.patch)
sha256sums=('21f896f553972de5647a39ac5793ddeaece9a126e60bd14111973801f9006201'
            '7f2e9066dfa70a57249b4c4c898e6bdc22ed686f8bb92b05852dc04b3c4bef90')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/PDCursesMod-${pkgver}"
  patch -p1 -i ${srcdir}/001-mingw-pdcurses-4.1.0-build.patch
}

build() {
  cd "${srcdir}/PDCursesMod-${pkgver}"
  for _arch in ${_architectures}; do
    # set -std=c17, see https://github.com/Bill-Gray/PDCursesMod/issues/333
    # note: We other flags are from the upstream Makefile to retain them despite setting CFLAGS.
    flags=(WIDE=Y UTF8=Y CFLAGS="$CFLAGS -std=c17 -Wall -Wextra -pedantic -O3 -I.. -DPDC_FORCE_UTF8 -DPDC_WIDE")
    flags_shared=(DLL=Y LIBNAME=libpdcurses.dll DLLNAME=libpdcurses)
    flags_static=(LIBNAME=libpdcurses)
    if [[ $pkgname =~ .*-clang-.* ]]; then
        flags+=(CC="$CC" LIBEXE="$CC $CFLAGS" STRIP="$STRIP" AR="$AR")
        flags_static+=(LIBEXE="$AR")
    else
        flags+=(CC="$_arch-gcc" LINK="$_arch-gcc" STRIP="$_arch-strip" AR="$_arch-ar")
    fi

    cp -rf wingui wingui-shared-${_arch}
    pushd wingui-shared-${_arch}
    make "${flags[@]}" "${flags_shared[@]}"
    popd

    cp -rf wingui wingui-static-${_arch}
    pushd wingui-static-${_arch}
    make "${flags[@]}" "${flags_static[@]}"
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
