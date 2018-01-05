# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Federico Cinelli <cinelli@aur.archlinux.org>

pkgname=gmerlin
pkgver=1.2.0
pkgrel=8
pkgdesc="Multimedia architecture for Linux"
arch=('x86_64')
url="http://openmovieeditor.sourceforge.net/HomePage"
license=('GPL')
depends=('gavl' 'gtk2' 'libxv' 'libvisual' 'libcdio-paranoia' 'mjpegtools' 'libquicktime' 'jack')
makedepends=('alsa-lib' 'pulseaudio' 'v4l-utils' 'mesa-libgl')
optdepends=('alsa-lib: for ALSA support'
	    'jack: for JACK support'
	    'libquicktime: for movie encoding'
	    'pulseaudio: for PulseAudio support'
	    'v4l-utils: for video conversion')
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz
        cdio-api-fixes.patch
	gmerlin-texi.patch)
md5sums=('2f2a0880e738e71486f04c929ba067f4'
         'd0e407f01435394a0cfe04acb3c1a4cc'
	 '33a4dce06b7560fc839055c5a872435f')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  patch -Np1 -i "$srcdir/cdio-api-fixes.patch"
  patch -Np1 -i "$srcdir/gmerlin-texi.patch"

  rm -rf cpuinfo.sh

  ./configure --prefix=/usr --without-doxygen
  sed -i 's|LIBS = -lgavl|LIBS = -lgavl -ldl -lpthread -lgtk-x11-2.0 -lgobject-2.0 -lglib-2.0 -lxml2 -lgdk-x11-2.0 -lgdk_pixbuf-2.0 -lX11|' {lib,tests,apps/*}/Makefile
  sed -i 's|ln -sf $(DESTDIR)$(pkgdatadir)|ln -sf $(pkgdatadir)|' icons/Makefile
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make -j1 DESTDIR="$pkgdir" install
}
