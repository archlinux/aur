# Maintainer: Jan de Groot <jgc@archlinux.org>
# Maintainer: Allan McRae <mcrae_allan@hotmail.com>
# Contributor: lp76 <l.peduto@gmail.com>

pkgname=vinagre
pkgver=2.24.0
pkgrel=1
pkgdesc="A VNC Client for the GNOME Desktop"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.gnome.org/projects/vinagre/"
install=vinagre.install
depends=('gnome-keyring>=2.24.0' 'gtk-vnc>=0.3.5' 'avahi>=0.6.23')
makedepends=('gnome-doc-utils>=0.14.0' 'intltool' 'gnome-panel>=2.24.0')
options=('!emptydirs')
source=(http://ftp.gnome.org/pub/GNOME/sources/vinagre/2.24/${pkgname}-${pkgver}.tar.bz2)
md5sums=('db396e9f4e008771468c34824196c8fc')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc --disable-scrollkeeper \
  	      --libexecdir=/usr/lib/vinagre || return 1
  make || return 1
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="${pkgdir}" install || return 1

  install -d -m755 "${pkgdir}/usr/share/gconf/schemas"
  gconf-merge-schema "${pkgdir}/usr/share/gconf/schemas/${pkgname}.schemas" \
  		     ${pkgdir}/etc/gconf/schemas/*.schemas || return 1
  rm -f ${pkgdir}/etc/gconf/schemas/*.schemas
}
