# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Roman Kyrylych <roman@archlinux.org>
# Contributor: Johannes Sjolund <j.sjolund@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=gnome-commander
pkgver=1.8.0
pkgrel=4
pkgdesc='Graphical two-pane filemanager for Gnome'
arch=('i686' 'x86_64')
url='http://gcmd.github.io/'
license=('GPL')
depends=('python2' 'libgsf' 'exiv2' 'taglib' 'poppler-glib' 'libgnomeui' 'libunique')
makedepends=('perl-xml-parser' 'itstool' 'yelp-tools')
source=(https://download.gnome.org/sources/gnome-commander/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('d0e73077fe22ae1e00d93f0112e0e019cf40b15419dfa82e51c9d5f30849946b')

build() {
  cd "$pkgname-$pkgver"
  export PYTHON=python2
  ./configure --prefix=/usr --libdir=/usr/lib --sysconfdir=/etc --localstatedir=/var --enable-python
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
