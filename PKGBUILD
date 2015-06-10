# Maintainer: timcowchip <timcowchip@gmail>
pkgname=vice-gtk
_pkgname=vice
pkgver=2.4
pkgrel=6
pkgdesc="A Versatile Commodore Emulator , ethernet enabled"
arch=('i686' 'x86_64')
url="http://vice-emu.sourceforge.net"
license=('GPL')
depends=('giflib' 'lame' 'libjpeg' 'libpng' 'libxrandr' 'libnet' 'libpcap' 'vte' 'mate-dialogs')
makedepends=('xorg-font-utils' 'pkg-config')
optdepends=('pulseaudio' 'pulseaudio-alsa' 'alsa-lib')
provides=("vice=$pkgver")
conflicts=('vice' 'vice-gnome' 'vice-gtkglext' 'vice-sdl' 'vice-2.2gnomeui')
replaces=('vice')
source=(http://downloads.sourceforge.net/project/vice-emu/releases/${_pkgname}-${pkgver}.tar.gz no-fc-cache.patch
giflib.patch no-lib64.patch vice.desktop vice icons.tar.gz)

md5sums=('b017647a0c159bbe43cdb81762d1c577' 'c7ba8ff930bee0e41565f4a1d9594922' 'da055d4e65b74a62bfb28e2d1dcd94a5' '1aced7ac8b2f33bad2b39e5582e76135' '23fa249a212e3f6c0d6791d2bd96c425' '67b09c727f231d21bdb1e9a69db7307d' '768377ae66a4bb3f15f93c18c592b689')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
 
  patch -Np1 -i ../no-fc-cache.patch
  
  patch -Np1 -i ../giflib.patch

  patch -Np1 -i ../no-lib64.patch
  
   
  ./configure  --prefix=/usr --enable-ethernet --enable-fullscreen --enable-gnomeui --disable-ffmpeg 
  
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  mkdir -p $pkgdir/usr/bin
	cp $srcdir/vice $pkgdir/usr/bin
	chmod a+x $pkgdir/usr/bin/vice
  mkdir -p $pkgdir/usr/share/applications
	cp $srcdir/vice.desktop $pkgdir/usr/share/applications/
  ICONSIZES="48 32 24 22 16"
	for i in $ICONSIZES; do
	mkdir -p $pkgdir/usr/share/icons/hicolor/$i\x$i/apps;
	cp $srcdir/$_pkgname-$i.png $pkgdir/usr/share/icons/hicolor/$i\x$i/apps;
   	done;
    cp $srcdir/$_pkgname.png $pkgdir/usr/share/applications/
  make DESTDIR="$pkgdir/" install
}




