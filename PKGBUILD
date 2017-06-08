# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=mup
pkgver=6.5
pkgrel=4
pkgdesc="Music publisher, creates PostScript printed music or MIDI"
arch=('i686' 'x86_64')
url="http://arkkra.com"
license=('custom:BSD-like')
depends=('fltk' 'libxpm')
makedepends=('gendesk')
source=('ftp://ftp.arkkra.com/pub/unix/mup65src.tar.gz' 'makefile.patch' 'gcc7.patch')
sha256sums=('b6999b271b6a9ad3bdeabb757e83d5340482b93a7b00513b9ecc5253a62ec7fe'
            'd0e2d9d57e4131335678e65c4db94ba182e0fd55c84482acfda630cfceaf5253'
            '0fa766c5907dbe1a026df8cc45c8b8cb75c8238c538d907288d1353e51d0f62b')
options=('!makeflags')

prepare() {
  cd $pkgname-$pkgver
  sed -n '1,40p' mup/mainlist.c > LICENSE
  gendesk -f -n --pkgname=mupmate --pkgdesc="Music publisher"
  patch -p1 < "$srcdir"/makefile.patch || true
  patch -p1 < "$srcdir"/gcc7.patch || true
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
