# $Id: PKGBUILD 272104 2017-12-04 09:50:19Z arojas $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Franco Iacomella <yaco@gnu.org>

pkgname=synfigstudio
pkgver=1.2.1
pkgrel=3
pkgdesc="Professional vector animation program (GUI)"
arch=(x86_64)
url="http://synfig.org"
license=('GPL2')
depends=('gtkmm3' 'synfig' 'sdl_image')
makedepends=('openexr' 'libmagick6' 'xorg-fonts-100dpi' 'xorg-fonts-75dpi'
	     'xorg-fonts-misc' 'xorg-fonts-type1' 'intltool' 'etl' 'imagemagick')
source=(http://downloads.sourceforge.net/project/synfig/releases/$pkgver/source/synfigstudio-$pkgver.tar.gz)
sha256sums=('1a97875e0039895604085649bcd30cf0d6165f4c865299ca13d45d2dfbfab05d')

build() {
  cd "$srcdir"/synfigstudio-$pkgver
  export PKG_CONFIG_PATH=/usr/lib/ffmpeg0.10/pkgconfig:/usr/lib/imagemagick6/pkgconfig:$PKG_CONFIG_PATH
  [ -f configure ] || { libtoolize --ltdl --copy --force && autoreconf --install --force; }
  [ -f Makefile ] || ./configure --prefix=/usr --sysconfdir=/etc --with-libavcodec --with-libdv
  make
}

package() {
  cd "$srcdir"/synfigstudio-$pkgver
  make DESTDIR="$pkgdir" install
  rm -f "$pkgdir"/usr/share/pixmaps/$pkgname/*.mng
  install -m644 images/*.png -t "$pkgdir"/usr/share/pixmaps/$pkgname/

  rm -f "$pkgdir"/usr/share/mime/XMLnamespaces
  rm -f "$pkgdir"/usr/share/mime/aliases
  rm -f "$pkgdir"/usr/share/mime/generic-icons
  rm -f "$pkgdir"/usr/share/mime/globs
  rm -f "$pkgdir"/usr/share/mime/globs2
  rm -f "$pkgdir"/usr/share/mime/icons
  rm -f "$pkgdir"/usr/share/mime/magic
  rm -f "$pkgdir"/usr/share/mime/mime.cache
  rm -f "$pkgdir"/usr/share/mime/subclasses
  rm -f "$pkgdir"/usr/share/mime/treemagic
  rm -f "$pkgdir"/usr/share/mime/types
  rm -f "$pkgdir"/usr/share/mime/version
}
