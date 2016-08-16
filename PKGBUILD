# Contributor: Nagy Gabor <Gabor.V.Nagy@@gmail.com>
pkgname=enigma_sdl
pkgver=1.21
pkgrel=2
pkgdesc="Puzzle game inspired by Oxyd on the Atari ST and Rock'n'Roll on the Amiga."
url="http://www.nongnu.org/enigma/"
depends=('libpng' 'sdl_image' 'sdl_mixer' 'sdl_ttf' 'xerces-c' 'xdg-utils' 'curl')
makedepends=('imagemagick')
source=(http://downloads.sourceforge.net/enigma-game/enigma-$pkgver.tar.gz
        std-gnu03.patch)
sha256sums=('d872cf067d8eb560d3bb1cb17245814bc56ac3953ae1f12e2229c8eb6f82ce01'
            'a606faf8f2f55c08a9a49a6ec8bce764422b749bb458733a27aba8cb2cf6b78e')
license=('GPL')
arch=('i686' 'x86_64')

build() {
  cd $srcdir/enigma-$pkgver
  patch -Np1 -i $srcdir/std-gnu03.patch
  autoconf
  ./configure --prefix=/usr --program-suffix=_sdl --sysconfdir=/etc --disable-sdltest --enable-optimize
  make
}

package(){
  cd $srcdir/enigma-$pkgver
  make DESTDIR=$pkgdir install
  # removing enet files to avoid file conflicts
  rm -R $pkgdir/usr/include/
  rm -R $pkgdir/usr/lib/
  sed -i s/Exec=enigma/Exec=enigma_sdl/ $pkgdir/usr/share/applications/enigma.desktop
}
