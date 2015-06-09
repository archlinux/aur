# Contributor: Filip Brcic <brcha@gna.org>
pkgname=mingw-w64-pdcurses
pkgver=3.4
pkgrel=4
pkgdesc="Curses library for MinGW-w64"
arch=(any)
depends=(mingw-w64-crt)
makedepends=(mingw-w64-gcc)
options=(staticlibs !buildflags !strip)
license=("public domain")
url="http://pdcurses.sourceforge.net"
source=("http://downloads.sourceforge.net/pdcurses/PDCurses-${pkgver}.tar.gz"
        "mingw-pdcurses-3.4-build.patch")
md5sums=('4e04e4412d1b1392a7f9a489b95b331a'
         'd1a36327155f51a1073b930e3647e4aa')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/PDCurses-${pkgver}"
  patch -Np1 -i ${srcdir}/mingw-pdcurses-3.4-build.patch
  sed -i "s|CFLAGS  = \-O2 \-Wall|CFLAGS = \-O2 \-g -pipe \-Wall \-Wp,\-D_FORTIFY_SOURCE=2 \-fexceptions \-\-param=ssp\-buffer\-size=4|g" win32/mingwin32.mak
}

build() {
  cd "${srcdir}/PDCurses-${pkgver}"
  export CFLAGS="-O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions --param=ssp-buffer-size=4"
  for _arch in ${_architectures}; do
    cp -a win32 build-${_arch} && pushd build-${_arch}
    make -f mingwin32.mak \
      CC=${_arch}-gcc \
      LINK=${_arch}-gcc \
      STRIP=${_arch}-strip \
      WIDE=Y UTF8=Y DLL=Y
    popd
  done
}

package() {
  cd "${srcdir}/PDCurses-${pkgver}"
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
