# Maintainer: Eduardo Romero <eduardo@archlinux.org>
# Contributor: Tor Krill <tor@krill.nu>

pkgname=nautilus-sendto
pkgver=1.1.3
pkgrel=1
pkgdesc="Nautilus context menu for sending files."
arch=(i686 x86_64)
url="http://download.gnome.org/sources/nautilus-sendto/"
license=('GPL')
depends=('evolution-data-server>=2.26.0' 'nautilus>=2.26')
makedepends=('pidgin' 'gajim' 'gettext' 'intltool')
options=('!libtool' '!emptydirs')
install=nautilus-sendto.install
source=(http://ftp.gnome.org/pub/GNOME/sources/nautilus-sendto/${pkgver%.*}/${pkgname}-${pkgver}.tar.bz2)
md5sums=('1a3a983b72cbb63170ccb989440a40c0')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var || return 1
  make || return 1
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="${pkgdir}" install || return 1
 
  install -m755 -d "${pkgdir}/usr/share/gconf/schemas"
  gconf-merge-schema "${pkgdir}/usr/share/gconf/schemas/${pkgname}.schemas" --domain nautilus-sendto ${pkgdir}/etc/gconf/schemas/*.schemas || return 1
  rm -f ${pkgdir}/etc/gconf/schemas/*.schemas
}
