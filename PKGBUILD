# $Id$
# Maintainer: Sébastien Luttringer
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: tobias <tobias@archlinux.org>
# Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org

_pkgbase=rxvt-unicode
pkgbase=${_pkgbase}-nobuiltins
pkgname=('rxvt-unicode-nobuiltins')
provides=('rxvt-unicode')
pkgver=9.22
pkgrel=2
arch=('i686' 'x86_64')
url='http://software.schmorp.de/pkg/rxvt-unicode.html'
license=('GPL')
conflicts=(rxvt-unicode rxvt-unicode-terminfo)
makedepends=('libxft' 'perl' 'startup-notification')
source=(
  "http://dist.schmorp.de/rxvt-unicode/$_pkgbase-$pkgver.tar.bz2"
)
md5sums=('93782dec27494eb079467dacf6e48185')

build() {
  cd $_pkgbase-$pkgver
  # we disable smart-resize (FS#34807)
  # do not specify --with-terminfo (FS#46424)
  ./configure \
    --prefix=/usr \
    --enable-256-color \
    --enable-combining \
    --enable-fading \
    --enable-font-styles \
    --enable-iso14755 \
    --enable-keepscrolling \
    --enable-lastlog \
    --enable-mousewheel \
    --enable-next-scroll \
    --enable-perl \
    --enable-pointer-blank \
    --enable-rxvt-scroll \
    --enable-selectionscrolling \
    --enable-slipwheeling \
    --disable-smart-resize \
    --enable-startup-notification \
    --enable-transparency \
    --enable-unicode3 \
    --enable-utmp \
    --enable-wtmp \
    --enable-xft \
    --enable-xim \
    --enable-xterm-scroll \
    --disable-pixbuf \
    --enable-frills
  sed '/BUILTIN_GLYPHS/d' -i src/rxvt.h
  make
}

package_rxvt-unicode-nobuiltins() {
  pkgdesc='A unicode enabled rxvt-clone terminal emulator (urxvt)'
  depends=('libxft' 'perl' 'startup-notification')
  optdepends=('gtk2-perl: to use the urxvt-tabbed')

  cd $_pkgbase-$pkgver
  # workaround terminfo installation
  export TERMINFO="$srcdir/terminfo"
  install -d "$TERMINFO"

  make DESTDIR="$pkgdir" install
  # install the tabbing wrapper ( requires gtk2-perl! )
  sed -i 's/\"rxvt\"/"urxvt"/' doc/rxvt-tabbed
  install -Dm 755 doc/rxvt-tabbed "$pkgdir/usr/bin/urxvt-tabbed"

  install -dm 755 "$pkgdir/usr/share/"
  mv ../terminfo "$pkgdir/usr/share/"
}

# vim:set ts=2 sw=2 et:
