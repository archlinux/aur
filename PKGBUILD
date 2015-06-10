# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Matthew Stewart <stewartmatthew6@gmail.com>

pkgname=sasteroids
pkgver=3.0.1
pkgrel=3
pkgdesc='Fly around and shoot asteroids in this Sasteroids remake'
arch=('x86_64' 'i686')
url='http://sdlsas.sourceforge.net/'
license=('GPL')
depends=('sdl' 'sdl_image' 'sdl_ttf' 'sdl_mixer' 'mesa')
makedepends=('setconf' 'gendesk')
replaces=('sdlsasteroids')
conflicts=('sdlsasteroids')
source=("http://sourceforge.net/projects/sdlsas/files/SDL%20Sasteroids%20Source%20Releases/$pkgver/SDLSasteroids-$pkgver.tar.gz"
        "$pkgname.png::http://icons.iconarchive.com/icons/etherbrian/space-bits/32/Asteroids-icon.png"
        "$pkgname.sh"
        'sbitmap.patch'
        'makefile.patch')
sha256sums=('f447a85d75913ee9d1be0bba68813e0627a4c163ab5d12c7fd5a8ea5f455502c'
            'fc6ded2d7a309333eb4cad2e6e03305e43827690ecbd4ebb01012c8598db1f49'
            '6f2ca922eb0be29d6866933aece1cc38dd224adb5f04834cdd0cb12cd7739cbf'
            'eb2139434aae832b395b1d1f6a4ef188f69ebd7c5ed5128df9129027ff9a4ac6'
            '6b35ad008d29cd1433cdbc6094231b5c399e5fc10a65670a67177e44c0f259c6')

prepare() {
  gendesk -f --pkgname "$pkgname" --pkgdesc "$pkgdesc" \
    --categories 'Game;ArcadeGame'
  setconf "SDLSasteroids-$pkgver/src/Makefile" CFLAGS '$(INC) $(OPTS) -w'
  patch -p1 -i sbitmap.patch
  patch -p1 -i makefile.patch
}

build() {
  export CXXFLAGS="$CXXFLAGS -w"
  make -C "SDLSasteroids-$pkgver"
}

package() {
  make -C "SDLSasteroids-$pkgver" DESTDIR="$pkgdir" install
  mv "$pkgdir/usr/bin/sasteroids" "$pkgdir/usr/bin/sasteroids.elf"
  install -Dm755 "$pkgname.sh" "$pkgdir/usr/bin/sasteroids"
  install -Dm644 "$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}

# vim:set ts=2 sw=2 et:
