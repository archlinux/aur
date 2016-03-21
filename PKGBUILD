# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=emerillon
pkgver=0.1.90
pkgrel=6
pkgdesc="Map viewer for OpenStreetMap"
arch=('i686' 'x86_64')
url="https://wiki.gnome.org/Apps/Emerillon"
license=('GPL')
depends=('libchamplain' 'geoclue' 'libpeas' 'rest')
makedepends=('gobject-introspection' 'gnome-doc-utils' 'intltool' 'vala')
install=$pkgname.install
source=(https://download.gnome.org/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('0648c70bc19d3bd334a5403938aba3855eb644ee337c29aeecd5ce57ea0bf085')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
              --disable-static --disable-schemas-compile --disable-maintainer-mode

  # https://bugzilla.gnome.org/show_bug.cgi?id=655517
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
}
