# Contributor: Nagy Gabor <Gabor.V.Nagy@@gmail.com>
pkgname=enigma_sdl
pkgver=1.21
pkgrel=4
pkgdesc="Puzzle game inspired by Oxyd on the Atari ST and Rock'n'Roll on the Amiga."
url="http://www.nongnu.org/enigma/"
depends=('libpng' 'sdl_image' 'sdl_mixer' 'sdl_ttf' 'xerces-c' 'xdg-utils' 'curl' 'hicolor-icon-theme')
makedepends=('imagemagick' 'pkgconf')
source=(http://downloads.sourceforge.net/enigma-game/enigma-$pkgver.tar.gz
        src_client.cc.patch src_lev_Proxy.cc.patch src_Value.cc.patch)
sha256sums=('d872cf067d8eb560d3bb1cb17245814bc56ac3953ae1f12e2229c8eb6f82ce01'
            '0d4ec33182e481b6856ceb029b1f144b8c31b0902e8f49ceb08093a66fe67304'
            'b27c2f114bbf76a3a0f7032380db885bdb3983e2a2a4648aed520c1b066e5aad'
            '4899aa6f7f965deb441840400b42d6fda65ea6e44c7fb131521db9a4e6fb4f2f')
license=('GPL')
arch=('i686' 'x86_64')

build() {
  CXXFLAGS+=" -std=gnu++11 -Wno-deprecated-declarations"
  cd $srcdir/enigma-$pkgver
  patch -Np1 -i $srcdir/src_client.cc.patch
  patch -Np0 -i $srcdir/src_lev_Proxy.cc.patch
  patch -Np0 -i $srcdir/src_Value.cc.patch
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
