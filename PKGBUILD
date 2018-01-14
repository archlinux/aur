# Maintainer:

pkgname=madbomber
pkgver=0.2.5
pkgrel=3
pkgdesc="Clone of Activision's Atari 2600 game Kaboom!"
arch=('i686' 'x86_64')
url='http://www.newbreedsoftware.com/madbomber/'
license=('GPL')
depends=('sdl_image' 'sdl_mixer')
makedepends=('gendesk')
source=("ftp://ftp.tuxpaint.org/unix/x/madbomber/src/madbomber-$pkgver.tar.gz")
sha256sums=('951ec8cfde3965255ceafa92fdbbbb50a1981b71afcf359c58c7d22dbf122f48')

prepare() {
  cd $pkgname-$pkgver
  sed -i 's|BIN_PREFIX=.*|BIN_PREFIX=/usr/bin/|' Makefile
  sed -i 's|CFLAGS=|CFLAGS+=|' Makefile
  sed -i 's|$(TARGET) $(SDL_LIB)|$(TARGET) $(LDFLAGS) $(SDL_LIB)|' Makefile
  gendesk -f -n --pkgname=$pkgname --pkgdesc="$pkgdesc" --name="Mad Bomber"
}

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 madbomber "$pkgdir"/usr/bin/madbomber

  install -d "$pkgdir"/usr/share/madbomber
  cp -r data/* README.txt "$pkgdir"/usr/share/madbomber/

  find "$pkgdir"/usr/share/madbomber -type f -exec chmod 644 {} \;
  rm "$pkgdir"/usr/share/madbomber/{images,embedded/images}/make-offs.sh

  install -Dm644 madbomber.desktop "$pkgdir"/usr/share/applications/madbomber.desktop
  install -Dm644 data/images/icon.png "$pkgdir"/usr/share/pixmaps/madbomber.png
}
