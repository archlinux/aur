# Maintainer: Alexander F. Rødseth <xyprot@archlinux.org>
# Contributor: Matthew Stewart <stewartmatthew6@gmail.com>

pkgname=sasteroids
pkgver=3.0.1
pkgrel=11
pkgdesc='Sasteroid game from 1994, ported to SDL'
arch=(x86_64)
url='https://sdlsas.sourceforge.net/'
license=(GPL)
depends=(mesa sdl_image sdl_mixer sdl_ttf)
makedepends=(gendesk glu setconf)
source=("sasteroids-$pkgver.tar.gz::https://sourceforge.net/projects/sdlsas/files/SDL%20Sasteroids%20Source%20Releases/$pkgver/SDLSasteroids-$pkgver.tar.gz"
        sbitmap.patch
        makefile.patch)
sha256sums=('f447a85d75913ee9d1be0bba68813e0627a4c163ab5d12c7fd5a8ea5f455502c'
            'eb2139434aae832b395b1d1f6a4ef188f69ebd7c5ed5128df9129027ff9a4ac6'
            '6b35ad008d29cd1433cdbc6094231b5c399e5fc10a65670a67177e44c0f259c6')

prepare() {
  gendesk -f -n \
    --pkgname $pkgname \
    --pkgdesc "$pkgdesc" \
    --categories 'Game;ArcadeGame'
  patch -p1 -i makefile.patch
  patch -p1 -i sbitmap.patch
  setconf "SDLSasteroids-$pkgver/src/Makefile" OPTS '-pipe -O3 -Wl,-z,now -Wl,--as-needed -w'
  setconf "SDLSasteroids-$pkgver/Makefile" MANDIR '$(DESTDIR)/usr/share/man/man6/'
  sed 's:$(MANDIR)/man6:$(MANDIR):' -i "SDLSasteroids-$pkgver/Makefile"
  sed 's:share:bin:g' -i "SDLSasteroids-$pkgver/src/gameconf.h"
}

build() {
  make -C SDLSasteroids-$pkgver
}

package() {
  make -C SDLSasteroids-$pkgver DESTDIR="$pkgdir" install
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}

# getver: packages.gentoo.org/packages/games-arcade/sdlsasteroids
