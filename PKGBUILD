# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Dwight Schauer <dschauer@gmail.com>
# Contributor: GdelaRey <arch at delarey dot org>
# Contributor: aksr <aksr at t-com dot me>
# Maintainer: David Hummel <hummeltech@sherpaguru.com>

pkgbase='hessling-editor-das'
pkgname=(
  'hessling-editor-das-con'
  'hessling-editor-das-sdl2'
  'hessling-editor-das-x11'
)
pkgver=4.0
pkgrel=3
pkgdesc="Text editor modelled on VM/CMS XEDIT with features of Mansfield Software's Kedit"
arch=('i686' 'x86_64')
url='https://hessling-editor.sourceforge.net/'
license=('GPL-2.0-or-later')
makedepends=(
  'libx11'
  'libxaw'
  'libxmu'
  'libxpm'
  'libxt'
  'ncurses'
  'oorexx'
  'sdl2-compat'
)
source=("https://downloads.sourceforge.net/hessling-editor/the-${pkgver}.tar.gz")
sha512sums=('9d8a9d864caa729a83f41932186eb6929e69207231a0d241b9574cf6af02aeeb28b53492af54e4c1ced3afa868060e8031aadf33b1168a8d9aeae14a8e9c1c86')
options=('!lto')

prepare() {
  cd "${srcdir}/the-${pkgver}"
  rm --recursive --force ncurses sdlcurses xcurses
  mkdir --parents ncurses sdlcurses xcurses
}

build() {
  CFLAGS+=" -std=gnu17 -Wno-incompatible-pointer-types"
  export CFLAGS

  local _common_configure_args=(
    --prefix=/usr
    --with-rexx=oorexx
  )

  cd "${srcdir}/the-${pkgver}/ncurses"
  ../configure "${_common_configure_args[@]}" --with-curses=ncurses
  make

  cd "${srcdir}/the-${pkgver}/sdlcurses"
  ../configure "${_common_configure_args[@]}" --with-curses=pdcurses-sdl2
  make

  cd "${srcdir}/the-${pkgver}/xcurses"
  ../configure "${_common_configure_args[@]}" --with-curses=pdcurses-x11
  make
}

check() {
  "${srcdir}/the-${pkgver}/ncurses/the-con" -h >/dev/null 2>&1 || true
  "${srcdir}/the-${pkgver}/sdlcurses/the-sdl2" -h >/dev/null 2>&1 || true
  "${srcdir}/the-${pkgver}/xcurses/the-x11" -h >/dev/null 2>&1 || true
}

package_hessling-editor-das-con() {
  pkgdesc+=" (ncurses console)"
  provides=('hessling-editor')
  conflicts=('hessling-editor')
  depends=(
    'ncurses'
    'oorexx'
  )

  cd "${srcdir}/the-${pkgver}/ncurses"
  make --jobs 1 DESTDIR="${pkgdir}" install
}

package_hessling-editor-das-sdl2() {
  pkgdesc+=" (SDL2)"
  provides=('hessling-editor')
  conflicts=('hessling-editor')
  depends=(
    'oorexx'
    'sdl2-compat'
  )

  cd "${srcdir}/the-${pkgver}/sdlcurses"
  make --jobs 1 DESTDIR="${pkgdir}" install
}

package_hessling-editor-das-x11() {
  pkgdesc+=" (X11)"
  provides=('hessling-editor')
  conflicts=('hessling-editor')
  depends=(
    'libx11'
    'libxaw'
    'libxmu'
    'libxpm'
    'libxt'
    'oorexx'
  )

  cd "${srcdir}/the-${pkgver}/xcurses"
  make --jobs 1 DESTDIR="${pkgdir}" install
}
