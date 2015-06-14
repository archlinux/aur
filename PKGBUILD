# Maintainer: Perttu Luukko <"perttu.luukko" followed by "@iki.fi">
# Contributor: Jussi Timperi <jussi.timperi at gmail dot com>

pkgname=tmispell-voikko
pkgver=0.7.1
pkgrel=2
pkgdesc="An Ispell compatible front-end for spell-checking modules"
arch=('i686' 'x86_64')
url="http://voikko.sourceforge.net"
license=('GPL2')
depends=('libvoikko' 'glibmm' 'ncurses')
install=tmispell-voikko.install
source=(http://downloads.sourceforge.net/voikko/$pkgname-$pkgver.tar.gz)
md5sums=('0bf0e9a650367e10430a47fcc9c4f3fe')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  sed -i 's:ncursesw/curses.h:curses.h:g' configure src/ui/cursesui.cc src/ui/cursesui_pimpl.hh
  sed -i 's:#include <glib/gerror.h>:#include <glib.h>:g' src/charset.cc
  ./configure --prefix=/usr --sysconfdir=/etc --disable-enchant
  make || return 1
  make DESTDIR="$pkgdir/" install

	# For the ispell
	mkdir -p $pkgdir/usr/lib/ispell
	touch $pkgdir/usr/lib/ispell/suomi.{hash,aff}

	mkdir -p $pkgdir/etc
	cp tmispell.conf.example $pkgdir/etc/tmispell.conf
}

# vim:set ts=2 sw=2 et:
