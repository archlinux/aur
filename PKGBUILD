# Contributor: Ewoud Nuyts <ewoud.nuyts@gmail.com>
# Contributor: Connor Behan <connor.behan@gmail.com>

pkgname=xdvdshrink
pkgver=2.6.1.10
pkgrel=8
conflicts=('dvdshrink')
pkgdesc="Create fair-use archival copies of DVD content on single-layer writable DVDs"
url="http://dvdshrink.sourceforge.net/"
license=('GPL')
arch=('i686' 'x86_64')
depends=('gtk2-perl' 'transcode' 'mjpegtools' 'cdrkit' 'dvd+rw-tools' 'dvdauthor')
makedepends=('imagemagick')
source=(http://downloads.sourceforge.net/sourceforge/dvdshrink/dvdshrink-2.6.1-10mdk.tar.gz $pkgname.desktop fixes.diff)

package() {
  # Fixes a few bugs
  cd "$srcdir"/dvdshrink/usr/bin
  patch -Np1 -i "$srcdir"/fixes.diff

  # Installs the program
  cd ../..
  mkdir -p "$pkgdir"/usr/bin
  mkdir -p "$pkgdir"/usr/share/{pixmaps,dvdshrink/doc}
  mv usr/share/icons/* "$pkgdir"/usr/share/pixmaps
  mv usr/share/doc/dvdshrink/{README.txt,batchrip.txt,example.xml} \
	  "$pkgdir"/usr/share/dvdshrink/doc
  mv usr/share/applications/dvdshrink/* "$pkgdir"/usr/share/dvdshrink
  mv usr/bin/* "$pkgdir"/usr/bin
  chmod a+rx "$pkgdir"/usr/bin/*

  # Corrects a typo in the program
  mv "$pkgdir"/usr/share/dvdshrink/32x32/dvdsrhink.xpm \
	  "$pkgdir"/usr/share/dvdshrink/32x32/dvdshrink.xpm

  # Makes a bunch of icons
  for size in 16 22 24 32 36 48 64; do
	  mkdir -p "$pkgdir"/usr/share/icons/hicolor/${size}x${size}/apps
	  convert -scale ${size}x${size} \
		  "$pkgdir"/usr/share/dvdshrink/64x64/dvdshrink.xpm \
		  "$pkgdir"/usr/share/icons/hicolor/${size}x${size}/apps/dvdshrink.png
  done

  # Installs the desktop file referring to one of those icons
  mkdir -p "$pkgdir"/usr/share/applications
  install -m644 "$srcdir"/$pkgname.desktop "$pkgdir"/usr/share/applications/
}

md5sums=('97af304a32d9eb49420a8eb7dffce671' '5729d34edfdcfacea1bc2398e578afa6' '231b3789b337acebbce19b1a0e0ac7a1')
