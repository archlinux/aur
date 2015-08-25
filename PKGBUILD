# Maintainer: Jens Staal <staal1978@gmail.com>
# adopted from mingw-w64-pdcurses package:
# Contributor: Filip Brcic <brcha@gna.org>
pkgname=mingw-w64-pdcurses-win32a
pkgver=3.4
pkgrel=1505 #yymm
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
source=("http://www.projectpluto.com/win32a.zip")
md5sums=('835356e2ffa311c5bb908063cfda7dfa')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}"
  sed 's|SRCDIR)\\exp|SRCDIR)\/exp|g' -i win32a/mingwin32.mak
  sed 's|CAT = type|CAT = cat|g' -i win32a/mingwin32.mak
  sed 's|CP  = -copy|CP  = -cp|g' -i win32a/mingwin32.mak
  sed 's|DELETE = -del|DELETE = -rm|g' -i win32a/mingwin32.mak
}

build() {
  cd "${srcdir}"
  export PDCURSES_SRCDIR="${srcdir}"
  export CFLAGS="-O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions --param=ssp-buffer-size=4"
  for _arch in ${_architectures}; do
    cp -a win32a build-${_arch} && pushd build-${_arch}
    make -f mingwin32.mak \
      PREFIX=${_arch} \
      LIBEXE=${_arch}-gcc \
      CC=${_arch}-gcc \
      LINK=${_arch}-gcc \
      LD=${_arch}-ld \
      STRIP=${_arch}-strip \
      WIDE=Y UTF8=Y DLL=Y
    popd
  done
}

package() {
  cd "${srcdir}"
  for _arch in ${_architectures} ; do
    install -d "${pkgdir}"/usr/${_arch}/{bin,lib,include}
    install build-${_arch}/pdcurses.dll "${pkgdir}"/usr/${_arch}/bin/
    install build-${_arch}/pdcurses.a "${pkgdir}"/usr/${_arch}/lib/libpdcurses.dll.a
    install -m 0644 curses.h panel.h term.h "${pkgdir}"/usr/${_arch}/include/
    find "$pkgdir/usr/${_arch}" -name '*.exe' -exec rm {} \;
    find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
  done
}
