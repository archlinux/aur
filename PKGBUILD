# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Roman Kyrylych <roman@archlinux.org>
# Contributor: Johannes Sjolund <j.sjolund@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=gnome-commander
pkgver=1.6.2
pkgrel=2
pkgdesc='Graphical two-pane filemanager for Gnome'
arch=('i686' 'x86_64')
url='http://gcmd.github.io/'
license=('GPL')
depends=('libgnomeui' 'python2' 'libunique' 'libgsf' 'exiv2' 'taglib' 'poppler-glib')
makedepends=('perl-xml-parser' 'gnome-doc-utils' 'intltool')
changelog=$pkgname.changelog
source=(https://download.gnome.org/sources/gnome-commander/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('47840659c1308c363606c505f561fa101351b72a40567550715589e4cc963f78')

prepare() {
  cd "$pkgname-$pkgver"
  # Python 2 fix
  for f in doc/*/gnome-commander.xml; do
      sed -i 's:env python:env python2:' "$f"
  done
}

build() {
  cd "$pkgname-$pkgver"
  PYTHON=python2 ./configure \
	--prefix=/usr \
	--libdir=/usr/lib \
	--sysconfdir=/etc \
	--localstatedir=/var \
	--disable-scrollkeeper \
	--enable-python
  make
}

package() {
  cd "$pkgname-$pkgver"

  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="$pkgdir" install
  install -d "$pkgdir/usr/share/gconf/schemas"
  gconf-merge-schema "$pkgdir/usr/share/gconf/schemas/$pkgname.schemas" \
    --domain "$pkgname" "$pkgdir/etc/gconf/schemas/"*.schemas
  rm -rf "$pkgdir/etc/gconf/schemas/"
}
