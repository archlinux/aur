# Maintainer: Jan de Groot <jgc@archlinux.org>
# Maintainer: Allan McRae <mcrae_allan@hotmail.com>
# Contributor: lp76 <l.peduto@gmail.com>

pkgname=vinagre
pkgver=2.30.0
pkgrel=1
pkgdesc="A VNC Client for the GNOME Desktop"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.gnome.org/projects/vinagre/"
install=vinagre.install
depends=('libgnome-keyring>=2.29.4' 'gtk-vnc>=0.3.10' 'avahi>=0.6.25' 'desktop-file-utils' 'hicolor-icon-theme' 'telepathy-glib>=0.10.0')
makedepends=('gnome-doc-utils>=0.19.5' 'intltool' 'gnome-panel>=2.29.92')
optdepends=('gnome-panel')
groups=('gnome-extra')
options=('!emptydirs' '!libtool')
source=(http://ftp.gnome.org/pub/GNOME/sources/vinagre/2.30/${pkgname}-${pkgver}.tar.bz2)
sha256sums=('776de79919d7a4420e5fa3575111f9be86f4503d05eab9217e258985fad34825')

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
