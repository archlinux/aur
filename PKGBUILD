# Maintainer: Matej Groma <sbovdvvnir68a8hftegth9whs+arch-aur@matejgroma.com>
# Contributor: Nagy Gabor <Gabor.V.Nagy@@gmail.com>
pkgname=enigma_sdl
pkgver=1.30
pkgrel=1
pkgdesc="Puzzle game inspired by Oxyd on the Atari ST and Rock'n'Roll on the Amiga."
url="http://www.nongnu.org/enigma/"
depends=('libpng' 'sdl_image' 'sdl_mixer' 'sdl_ttf' 'xerces-c' 'xdg-utils' 'curl' 'hicolor-icon-theme'
         'sdl2_ttf' 'sdl2_mixer' 'sdl2_image')
makedepends=('imagemagick' 'pkgconf')
source=(https://github.com/Enigma-Game/Enigma/releases/download/$pkgver/Enigma-$pkgver-src.tar.gz
        fix_invalid_access.patch)
sha256sums=('ae64b91fbc2b10970071d0d78ed5b4ede9ee3868de2e6e9569546fc58437f8af'
            '61709cbf9fe420d062fb8b24e56a6165242626f4f211bf798ee90155a0208bb2')
license=('GPL')
arch=('i686' 'x86_64')

build() {
  CXXFLAGS+=" -std=gnu++14 -Wno-deprecated-declarations -Wno-format-security"
  cd $srcdir/enigma-$pkgver
  patch -Np1 -i $srcdir/fix_invalid_access.patch
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
