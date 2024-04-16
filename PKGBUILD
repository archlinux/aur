# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Dwight Schauer <dschauer@gmail.com>
# Contributor: GdelaRey <arch at delarey dot org>
# Contributor: aksr <aksr at t-com dot me>
# Maintainer: David Hummel <david dot hummel at gmail point com>

pkgbase='hessling-editor-das'
pkgname=('hessling-editor-das-con' 'hessling-editor-das-sdl2' 'hessling-editor-das-x11')
pkgver=4.0
pkgrel=2
pkgdesc="A powerful text editor modelled on the VM/CMS text editor XEDIT with the best features of Mansfield Software's Kedit."
arch=('i686' 'x86_64')
url="http://hessling-editor.sourceforge.net/"
license=('GPL-2.0-or-later')
makedepends=(
    'libx11'
    'libxaw'
    'libxmu'
    'libxpm'
    'libxt'
    'ncurses'
    'oorexx'
    'sdl2'
)
provides=('hessling-editor')
source=("http://downloads.sourceforge.net/$provides/the-$pkgver.tar.gz")
sha512sums=('9d8a9d864caa729a83f41932186eb6929e69207231a0d241b9574cf6af02aeeb28b53492af54e4c1ced3afa868060e8031aadf33b1168a8d9aeae14a8e9c1c86')

prepare() {
  cd "the-$pkgver"

  if [ -d ncurses ]; then
    rm -rf ncurses
  fi
  mkdir --parents ncurses

  if [ -d sdlcurses ]; then
    rm -rf sdlcurses
  fi
  mkdir --parents sdlcurses

  if [ -d xcurses ]; then
    rm -rf xcurses
  fi
  mkdir --parents xcurses
}

build() {
  cd "$srcdir/the-$pkgver/ncurses"
  ../configure --with-rexx=oorexx --with-curses=ncurses --prefix=/usr

  cd "$srcdir/the-$pkgver/sdlcurses"
  ../configure --with-rexx=oorexx --with-curses=pdcurses-sdl2 --prefix=/usr

  cd "$srcdir/the-$pkgver/xcurses"
  ../configure --with-rexx=oorexx --with-curses=pdcurses-x11 --prefix=/usr
}

package_hessling-editor-das-con(){
  conflicts=('hessling-editor-das-sdl2' 'hessling-editor-das-x11')
  depends=(
    'ncurses'
    'oorexx'
  )

  cd "$srcdir/the-$pkgver/ncurses"
  make DESTDIR="$pkgdir" install
}

package_hessling-editor-das-sdl2(){
  conflicts=('hessling-editor-das-con' 'hessling-editor-das-x11')
  depends=(
    'oorexx'
    'sdl2'
  )

  cd "$srcdir/the-$pkgver/sdlcurses"
  make DESTDIR="$pkgdir" install
}

package_hessling-editor-das-x11(){
  conflicts=('hessling-editor-das-con' 'hessling-editor-das-sdl2')
  depends=(
    'libx11'
    'libxaw'
    'libxmu'
    'libxpm'
    'libxt'
    'oorexx'
  )

  cd "$srcdir/the-$pkgver/xcurses"
  make DESTDIR="$pkgdir" install
}
