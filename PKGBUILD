# Maintainer: pingplug < aur at pingplug dot me >
# Contributor: Jens Staal < staal1978 at gmail dot com >
# adopted from mingw-w64-pdcurses package:
# Contributor: Filip Brcic < brcha at gna dot org >

_commit=96f9dc577e6b30242b1a2e8f5489cdd77a6182a9  # tags/4.1.0^1
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgname=mingw-w64-pdcurses-win32a
pkgver=4.1.0
pkgrel=1
pkgdesc="Curses library on the Win32 API for MinGW-w64"
arch=('any')
url="https://www.projectpluto.com/win32a.htm"
license=('Public Domain')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-gcc'
             'git')
provides=('mingw-w64-pdcurses')
conflicts=('mingw-w64-pdcurses')
options=('!strip' 'staticlibs' '!buildflags')
source=("git+https://github.com/Bill-Gray/PDCurses.git#commit=${_commit}"
        "pdcurses.diff")
sha256sums=('SKIP'
            '246f93facdd2703f8b9d0bcd57e89688fd861d34a30facc60a48892b330b08bc')

prepare() {
  cd "${srcdir}"
  # export functions in terms.h
  patch -Np0 -i pdcurses.diff
}

build() {
  cd "${srcdir}/PDCurses"
  for _arch in ${_architectures}; do
    cp -a wingui build-${_arch}-static && pushd build-${_arch}-static
    make -f Makefile.mng \
      PREFIX="${_arch}-" \
      WIDE=Y UTF8=Y
    popd
    cp -a wingui build-${_arch}-shared && pushd build-${_arch}-shared
    make -f Makefile.mng \
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
    find "${pkgdir}/usr/${_arch}" -name '*.exe' -exec rm {} \;
    find "${pkgdir}/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "${pkgdir}/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
  done
}

# vim:set ts=2 sw=2 et:
