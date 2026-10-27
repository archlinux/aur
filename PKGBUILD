# Maintainer: Beej <beej@beej.us>
# Contributor: libele <libele@disroot.org>
# Contributor: Kyle Keen <keenerd@gmail.com>

pkgname=rogue
pkgver=5.4.4
pkgrel=3
epoch=1
pkgdesc="The original dungeon crawl game."
arch=('aarch64' 'arm' 'armv6h' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="http://rogue.rogueforge.net/rogue-5-4/"
license=('LicenseRef-custom')
depends=('ncurses')

# The main site seems to be down. I mirrored the source from the
# Internet Archive onto my Moria site for now.

#source=("http://rogue.rogueforge.net/files/rogue5.4/rogue${pkgver}-src.tar.gz" "config.guess::https://git.savannah.gnu.org/cgit/config.git/plain/config.guess?id=428664896cf9e92d264976a960c76660938dffce")
source=("https://beej.us/moria/files/rogue/rogue${pkgver}-src.tar.gz" "config.guess")
sha256sums=('7d37a61fc098bda0e6fac30799da347294067e8e079e4b40d6c781468e08e8a1'
            'ac18bbd7dc3769e1646af49ebba331a391829f4a73579b735dc8d439bd1c7f07')

prepare() {
  cd $pkgname$pkgver
  # ncurses fix, FS#57731
  sed -i '262i TERMTYPE *tp = (TERMTYPE *) (cur_term);' mdport.c
  sed -i 's/cur_term->type.Strings/tp->Strings/' mdport.c

  # Use wmove instead of trying to accesses fields of an opaque struct
  sed -i '/curscr->_curx = ox;/d' main.c
  sed -i 's/curscr->_cury = oy;/wmove(curscr, oy, ox);/' main.c
}

build() {
  cd $pkgname$pkgver
  cp ../config.guess config.guess
  CFLAGS="-g -O2 -std=gnu18" ./configure
  make
}

package() {
  cd $pkgname$pkgver
  install -Dm755 rogue "$pkgdir/usr/bin/rogue"
  install -Dm644 rogue.6 "$pkgdir/usr/share/man/man6/rogue.6"
  install -Dm644 LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE.TXT"
}
