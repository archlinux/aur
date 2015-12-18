# Maintainer: 0strodamus <0strodamus at cox dot net>
# Contributor: Jan De Groot <jgc@archlinux.org>

pkgname=gucharmap-gtk2
_pkgname=gucharmap
pkgver=3.0.1
pkgrel=1
pkgdesc="Gnome Unicode Charmap (GTK2 version)"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.gnome.org"
depends=('gconf' 'hicolor-icon-theme')
makedepends=('gtk-doc' 'intltool' 'gobject-introspection')
provides=($_pkgname)
conflicts=($_pkgname)
replaces=($_pkgname)
options=('!libtool' '!emptydirs')
install=gucharmap.install
source=(http://ftp.gnome.org/pub/gnome/sources/${_pkgname}/${pkgver%.*}/${_pkgname}-${pkgver}.tar.bz2)
sha256sums=('948a376f13af98ffe6be29c73f1d89d2dbc201abd697bb6e85c717d8242dcf75')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-static \
      --disable-scrollkeeper --with-gtk=2.0 \
      --enable-introspection
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make -j1 GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="${pkgdir}" install

  install -m755 -d "${pkgdir}/usr/share/gconf/schemas"
  gconf-merge-schema "${pkgdir}/usr/share/gconf/schemas/${_pkgname}.schemas" --domain gucharmap ${pkgdir}/etc/gconf/schemas/*.schemas
  rm -f ${pkgdir}/etc/gconf/schemas/*.schemas
}
