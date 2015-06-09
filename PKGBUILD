# Maintainer: Yosef Or Boczko <yoseforb@gnome.org>

_pkgname=libpeas
pkgname=$_pkgname-git
pkgver=1.14.0.r17.ga919b8c
pkgrel=1
_realver=1.14.1
pkgdesc="A GObject-based plugins engine"
arch=(i686 x86_64)
url="https://wiki.gnome.org/Projects/Libpeas"
license=(GPL2)
depends=(gtk3 hicolor-icon-theme gobject-introspection)
makedepends=(gtk-doc intltool python-gobject python2-gobject gjs seed glade)
optdepends=('gjs: gobject-based plugin engine - gjs runtime loader'
            'seed: gobject-based plugin engine - seed runtime loader')
options=('!libtool')
install=$_pkgname.install
provides=("${_pkgname}=${_realver}")
conflicts=("${_pkgname}")
replace=("${_pkgname}")
source=('git://git.gnome.org/libpeas')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --always | sed -E 's/^libpeas.//;s/_/./g;s/([^-]*-g)/r\1/;s|-|.|g'
}

prepare() {
  cd "$srcdir/$_pkgname"
}

build() {
  cd "$srcdir/$_pkgname"

  ./autogen.sh --prefix=/usr --sysconfdir=/etc \
    --localstatedir=/var --enable-gtk-doc

  # https://bugzilla.gnome.org/show_bug.cgi?id=655517
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="${pkgdir}" install
}
