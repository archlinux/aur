pkgname=mup
pkgver=6.5
pkgrel=3
pkgdesc="Music publisher, creates PostScript printed music or MIDI"
arch=('i686' 'x86_64')
url="http://arkkra.com"
license=('custom:BSD-like')
depends=('fltk' 'libxpm')
makedepends=('gendesk')
source=('ftp://ftp.arkkra.com/pub/unix/mup65src.tar.gz')
sha256sums=('b6999b271b6a9ad3bdeabb757e83d5340482b93a7b00513b9ecc5253a62ec7fe')

prepare() {
  cd $pkgname-$pkgver
  sed -i 's|doc/packages|doc|' makefile
  sed -i 's|pixmaps/mup|pixmaps|' makefile
  sed -n '1,40p' mup/mainlist.c > LICENSE
  gendesk -f -n --pkgname=mupmate --pkgdesc="Music publisher"
}

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  mv "$pkgdir"/usr/share/pixmaps/{mup32.xpm,mupmate.xpm}
  install -Dm644 mupmate.desktop "$pkgdir"/usr/share/applications/mupmate.desktop
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
