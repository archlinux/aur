# $Id$
# Maintainer: Brian Bidulock <bidulock@openss7.org.
# COntributor: Hugo Osvaldo Barrera <hugo@osvaldobarrera.com.ar>

pkgname=gedit2
_pkgname=gedit
pkgver=2.30.4
pkgrel=9
pkgdesc="A text editor for GNOME"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gconf-gtk2' 'pygtksourceview2' 'enchant1.6' 'desktop-file-utils' 'iso-codes' 'libsm' 'python2')
makedepends=('gnome-doc-utils>=0.20.2' 'intltool' 'python')
provides=($_pkgname)
conflicts=($_pkgname)
groups=('gnome-extra')
options=('!libtool' '!emptydirs')
url="http://www.gnome.org"
source=(http://ftp.gnome.org/pub/gnome/sources/$_pkgname/2.30/$_pkgname-${pkgver}.tar.bz2)
sha256sums=('a561fe3dd1d199baede1bd07c4ee65f06fc7c494dd4d3327117f04149a608e3c')

build() {
  cd $_pkgname-${pkgver}
  ./configure PYTHON=python2 --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
      --libexecdir=/usr/lib --disable-scrollkeeper --enable-python
  make PYTHON=python2 LDFLAGS="$LDFLAGS -lgmodule-2.0 -lICE"
}

package() {
  cd $_pkgname-${pkgver}
  make PYTHON=python2 GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="${pkgdir}" install

  install -m755 -d "${pkgdir}/usr/share/gconf/schemas"
  gconf-merge-schema "${pkgdir}/usr/share/gconf/schemas/gedit.schemas" --domain $_pkgname ${pkgdir}/etc/gconf/schemas/*.schemas
  rm -f ${pkgdir}/etc/gconf/schemas/*.schemas
}
