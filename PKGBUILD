# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=cheese
pkgver=2.24.2
pkgrel=1
pkgdesc="Cheese uses your webcam to take photos and videos, applies fancy special effects and lets you share the fun with others"
arch=(i686 x86_64)
license=('GPL')
depends=('libgnomeui>=2.24.0' 'gstreamer0.10-base-plugins>=0.10.21' 'gstreamer0.10-good-plugins>=0.10.11' 'evolution-data-server>=2.24.2' 'librsvg>=2.22.3' 'gnome-icon-theme>=2.24.0')
makedepends=('perlxml' 'gnome-doc-utils>=0.14.0' 'intltool')
groups=('gnome-extra')
options=('!libtool' '!emptydirs')
url="http://www.gnome.org/projects/cheese/"
install=cheese.install
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/2.24/${pkgname}-${pkgver}.tar.bz2)
md5sums=('82de87c881c45e6ef965b71fdad21bda')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var --libexecdir=/usr/lib \
	      --disable-scrollkeeper || return 1
  make || return 1
  make -j1 GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="${pkgdir}" install || return 1
 
  install -m755 -d "${pkgdir}/usr/share/gconf/schemas"
  gconf-merge-schema "${pkgdir}/usr/share/gconf/schemas/${pkgname}.schemas" ${pkgdir}/etc/gconf/schemas/*.schemas || return 1
  rm -f ${pkgdir}/etc/gconf/schemas/*.schemas
}
