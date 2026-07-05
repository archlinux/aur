# Maintainer: libele <libele@disroot.org>
# Contributor: Kyle Keen <keenerd@gmail.com>

pkgname=rogue
pkgver=5.4.4
pkgrel=2
epoch=1
pkgdesc="The original dungeon crawl game."
arch=('aarch64' 'arm' 'armv6h' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="http://rogue.rogueforge.net/rogue-5-4/"
license=('custom')
depends=('ncurses')
source=("http://rogue.rogueforge.net/files/rogue5.4/rogue${pkgver}-src.tar.gz" "config.guess::https://git.savannah.gnu.org/cgit/config.git/plain/config.guess?id=428664896cf9e92d264976a960c76660938dffce")
md5sums=('033288f46444b06814c81ea69d96e075' '31425d9ff4907ea0de54624aab92336c')

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
  mv ../config.guess config.guess
  CFLAGS="-g -O2 -std=gnu18" ./configure
  make
}

package() {
  cd $pkgname$pkgver
  install -Dm755 rogue "$pkgdir/usr/bin/rogue"
  install -Dm644 rogue.6 "$pkgdir/usr/share/man/man6/rogue.6"
  install -Dm644 LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE.TXT"
}
