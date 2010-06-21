# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Eduardo Romero <eduardo@archlinux.org>
# Contributor: Tor Krill <tor@krill.nu>

pkgname=nautilus-sendto
pkgver=2.28.4
pkgrel=2
pkgdesc="Nautilus context menu for sending files."
arch=('i686' 'x86_64')
url="http://download.gnome.org/sources/nautilus-sendto/"
license=('GPL')
groups=('gnome-extra')
depends=('evolution-data-server>=2.30.2.1' 'nautilus>=2.30.1')
makedepends=('pidgin' 'gajim' 'gettext' 'intltool')
options=('!libtool' '!emptydirs')
install=nautilus-sendto.install
source=(http://ftp.gnome.org/pub/GNOME/sources/nautilus-sendto/2.28/${pkgname}-${pkgver}.tar.bz2)
sha256sums=('ff6b1a73f7e662fb49c3a1aee59a5c17fc96c23fcf63c3b10b6142eaef344f06')

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
