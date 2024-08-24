# Maintainer: libele <libele@disroot.org>
# Contributor: Kyle Keen <keenerd@gmail.com>

pkgname=rogue
pkgver=5.4.4
pkgrel=1
epoch=1
pkgdesc="The original dungeon crawl game."
arch=('aarch64' 'arm' 'armv6h' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="http://rogue.rogueforge.net/rogue-5-4/"
license=('custom')
depends=('ncurses')
source=("http://rogue.rogueforge.net/files/rogue5.4/rogue${pkgver}-src.tar.gz" "http://savannah.gnu.org/cgi-bin/viewcvs/*checkout*/config/config/config.guess")
md5sums=('033288f46444b06814c81ea69d96e075' '7656db1151b730dc6c51cbfa83136071')

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
  ./configure
  make
}

package() {
  cd $pkgname$pkgver
  install -Dm755 rogue "$pkgdir/usr/bin/rogue"
  install -Dm644 rogue.6 "$pkgdir/usr/share/man/man6/rogue.6"
  install -Dm644 LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE.TXT"
}
