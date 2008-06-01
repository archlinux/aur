# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=cheese
pkgver=2.22.2
pkgrel=1
pkgdesc="Cheese uses your webcam to take photos and videos, applies fancy special effects and lets you share the fun with others"
arch=(i686 x86_64)
license=('GPL')
depends=('libgnomeui>=2.22.1' 'gstreamer0.10-base-plugins>=0.10.19' 'evolution-data-server>=2.22.2' 'librsvg>=2.22.2' 'libxxf86vm')
makedepends=('perlxml' 'gnome-doc-utils>=0.12.2')
groups=('gnome-extra')
options=('!libtool' '!emptydirs')
url="http://www.gnome.org"
install=cheese.install
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/2.22/${pkgname}-${pkgver}.tar.bz2)
md5sums=('39a7808868dd79c05a88a874b2026233')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var --disable-scrollkeeper || return 1
  make || return 1
  make -j1 GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR=${startdir}/pkg install || return 1
 
  install -m755 -d ${startdir}/pkg/usr/share/gconf/schemas
  gconf-merge-schema ${startdir}/pkg/usr/share/gconf/schemas/${pkgname}.schemas ${startdir}/pkg/etc/gconf/schemas/*.schemas || return 1
  rm -f ${startdir}/pkg/etc/gconf/schemas/*.schemas
}
