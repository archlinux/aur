# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Maintainer: TingPing <tingping@tingping.se>

_basename=libpeas
pkgname=libpeas-luajit
pkgver=1.15.0
pkgrel=1
pkgdesc="A GObject-based plugins engine"
arch=(i686 x86_64)
url="http://www.gtk.org/"
provides=libpeas
conflicts=libpeas
license=(LGPL2)
depends=(gtk3 hicolor-icon-theme gobject-introspection-runtime)
makedepends=(gtk-doc intltool luajit-lgi python-gobject python2-gobject glade gobject-introspection)
install=libpeas.install
source=(http://download.gnome.org/sources/$_basename/${pkgver:0:4}/$_basename-${pkgver}.tar.xz)
sha256sums=('5690c99cce35fa972a93b20d061bf2384017072d939c95ab50bdf2b72be41e1c')


build() {
  cd $_basename-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --enable-luajit

  # https://bugzilla.gnome.org/show_bug.cgi?id=655517
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

check() {
  cd $_basename-$pkgver
  # Pygobject 3.15.x Throws deprecation message to stderr which causes failed test suite. Works fine with 3.14.x
  make check || return 0
}

package() {
  cd $_basename-$pkgver
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
