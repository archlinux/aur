# Maintainer: Jan de Groot <jgc@archlinux.org>
# Maintainer: Allan McRae <mcrae_allan@hotmail.com>
# Contributor: lp76 <l.peduto@gmail.com>

pkgname=vinagre
pkgver=2.28.0.1
pkgrel=1
pkgdesc="A VNC Client for the GNOME Desktop"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.gnome.org/projects/vinagre/"
install=vinagre.install
depends=('gnome-keyring>=2.27.92' 'gtk-vnc>=0.3.9' 'avahi>=0.6.25' 'desktop-file-utils' 'hicolor-icon-theme')
makedepends=('gnome-doc-utils>=0.17.5' 'intltool' 'gnome-panel>=2.27.92')
optdepends=('gnome-panel')
groups=('gnome-extra')
options=('!emptydirs')
source=(http://ftp.gnome.org/pub/GNOME/sources/vinagre/2.28/${pkgname}-${pkgver}.tar.bz2)
sha256sums=('2187d45fac3122cee746d12b4db45f9bf1d06c2b525cb685f3e21636f410c089')

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
