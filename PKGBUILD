# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Eduardo Romero <eduardo@archlinux.org>
# Contributor: Tor Krill <tor@krill.nu>

pkgname=nautilus-sendto
pkgver=2.28.2
pkgrel=3
pkgdesc="Nautilus context menu for sending files."
arch=('i686' 'x86_64')
url="http://download.gnome.org/sources/nautilus-sendto/"
license=('GPL')
groups=('gnome-extra')
depends=('evolution-data-server>=2.29.90' 'nautilus>=2.29.90')
makedepends=('pidgin' 'gajim' 'gettext' 'intltool')
options=('!libtool' '!emptydirs')
install=nautilus-sendto.install
source=(http://ftp.gnome.org/pub/GNOME/sources/nautilus-sendto/2.28/${pkgname}-${pkgver}.tar.bz2)
sha256sums=('0fa992b9a4489b712465e82eb182db3eaea9280397871f9d95849c25d1c33893')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var || return 1
  make || return 1
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="${pkgdir}" install || return 1

  rm -f "${pkgdir}//usr/lib/nautilus-sendto/plugins/libnstbluetooth.so"

  install -m755 -d "${pkgdir}/usr/share/gconf/schemas"
  gconf-merge-schema "${pkgdir}/usr/share/gconf/schemas/${pkgname}.schemas" --domain nautilus-sendto ${pkgdir}/etc/gconf/schemas/*.schemas || return 1
  rm -f ${pkgdir}/etc/gconf/schemas/*.schemas
}
