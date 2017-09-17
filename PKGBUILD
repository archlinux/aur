# Maintainer: pingplug <pingplug@foxmail.com>
# Contributor: Jens Staal <staal1978@gmail.com>
# adopted from mingw-w64-pdcurses package:
# Contributor: Filip Brcic <brcha@gna.org>
pkgname=mingw-w64-pdcurses-win32a
pkgver=4.0.2
pkgrel=1
_commit=10ee49e4fb96a808aed0882374dcc22b668db722
pkgdesc="Curses library on the Win32 API for MinGW-w64"
arch=(any)
depends=(mingw-w64-crt)
makedepends=(mingw-w64-gcc)
options=(staticlibs !buildflags !strip)
provides=('mingw-w64-pdcurses')
replaces=('mingw-w64-pdcurses')
conflicts=('mingw-w64-pdcurses')
license=("public domain")
url="http://www.projectpluto.com/win32a.htm"
source=(#"http://www.projectpluto.com/win32a.zip"
        "git+https://github.com/Bill-Gray/PDCurses.git#commit=$_commit")
md5sums=('SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/PDCurses"
}

build() {
  cd "${srcdir}/PDCurses"
  for _arch in ${_architectures}; do
    cp -a win32a build-${_arch}-static && pushd build-${_arch}-static
    make -f mingwin32.mak \
      PREFIX="${_arch}-" \
      WIDE=Y UTF8=Y
    popd
    cp -a win32a build-${_arch}-shared && pushd build-${_arch}-shared
    make -f mingwin32.mak \
      PREFIX="${_arch}-" \
      WIDE=Y UTF8=Y DLL=Y
    popd
  done
}

package() {
  cd "${srcdir}/PDCurses"
  for _arch in ${_architectures} ; do
    install -d "${pkgdir}"/usr/${_arch}/{bin,lib,include}
    install build-${_arch}-shared/pdcurses.dll "${pkgdir}"/usr/${_arch}/bin/
    install build-${_arch}-shared/pdcurses.a "${pkgdir}"/usr/${_arch}/lib/libpdcurses.dll.a
    install build-${_arch}-static/pdcurses.a "${pkgdir}"/usr/${_arch}/lib/libpdcurses.a
    install -m 0644 curses.h panel.h term.h acs_defs.h "${pkgdir}"/usr/${_arch}/include/
    find "$pkgdir/usr/${_arch}" -name '*.exe' -exec rm {} \;
    find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
  done
}
