# $Id$
# Maintainer: asyncial <asyncial [at] posteo [de]
# Contributor: Sébastien Luttringer
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: tobias <tobias@archlinux.org>
# Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org

_pkgbase=rxvt-unicode
pkgname=$_pkgbase-no-pearl
pkgbase=$pkgname
pkgver=9.22
pkgrel=5
arch=('i686' 'x86_64')
url='http://software.schmorp.de/pkg/rxvt-unicode.html'
license=('GPL')
makedepends=('libxft' 'startup-notification')
provides=(rxvt-unicode)
conflicts=(rxvt-unicode)
source=(
  "http://dist.schmorp.de/rxvt-unicode/$_pkgbase-$pkgver.tar.bz2"
  'urxvt.desktop'
  'urxvtc.desktop'
)
md5sums=( 'SKIP'
          'SKIP'
          'SKIP')

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
    --disable-perl \
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
    --disable-frills
  make
}

package() {
  pkgdesc='A unicode enabled rxvt-clone terminal emulator (urxvt). Perl disabled.'
  depends=('rxvt-unicode-terminfo' 'libxft' 'startup-notification')

  # install freedesktop menu
  for _f in urxvt urxvtc; do
    install -Dm644 $_f.desktop "$pkgdir/usr/share/applications/$_f.desktop"
  done
  cd $_pkgbase-$pkgver
  # workaround terminfo installation
  export TERMINFO="$srcdir/terminfo"
  install -d "$TERMINFO"
  make DESTDIR="$pkgdir" install
}
# vim:set ts=2 sw=2 et:
