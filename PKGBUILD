# Maintainer: Jan de Groot <jgc@archlinux.org>
# Maintainer: Allan McRae <mcrae_allan@hotmail.com>
# Contributor: lp76 <l.peduto@gmail.com>

pkgname=vinagre
pkgver=2.28.1
pkgrel=2
pkgdesc="A VNC Client for the GNOME Desktop"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.gnome.org/projects/vinagre/"
install=vinagre.install
depends=('gnome-keyring>=2.28.1' 'gtk-vnc>=0.3.9' 'avahi>=0.6.25' 'desktop-file-utils' 'hicolor-icon-theme' 'telepathy-glib>=0.9.1')
makedepends=('gnome-doc-utils>=0.18.0' 'intltool' 'gnome-panel>=2.28.0')
optdepends=('gnome-panel')
groups=('gnome-extra')
options=('!emptydirs')
source=(http://ftp.gnome.org/pub/GNOME/sources/vinagre/2.28/${pkgname}-${pkgver}.tar.bz2)
sha256sums=('774276784b3f097faf165dff37d1e9372098db5570421f4e213fa3c8e9808ad4')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc --disable-scrollkeeper \
      --libexecdir=/usr/lib/vinagre || return 1
  make || return 1
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="${pkgdir}" install || return 1

  install -d -m755 "${pkgdir}/usr/share/gconf/schemas"
  gconf-merge-schema "${pkgdir}/usr/share/gconf/schemas/${pkgname}.schemas" --domain vinagre ${pkgdir}/etc/gconf/schemas/*.schemas || return 1
  rm -f ${pkgdir}/etc/gconf/schemas/*.schemas
}
