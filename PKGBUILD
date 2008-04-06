# $Id: PKGBUILD,v 1.3 2008/03/23 17:36:22 jgc Exp $
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=cheese
pkgver=2.22.0
pkgrel=2
pkgdesc="Cheese uses your webcam to take photos and videos, applies fancy special effects and lets you share the fun with others"
arch=(i686 x86_64)
license=('GPL')
depends=('libgnomeui>=2.22.01' 'gstreamer0.10-base>=0.10.18' 'evolution-data-server>=2.22.0' 'librsvg>=2.22.2' 'libxxf86vm')
makedepends=('perlxml' 'gnome-doc-utils>=0.12.2')
groups=('gnome-extra')
options=('!libtool' '!emptydirs')
url="http://www.gnome.org"
install=cheese.install
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/2.22/${pkgname}-${pkgver}.tar.bz2
	cheese-2.22-svn-r606.patch)
md5sums=('94aa1c9837d011c94e4c44d922cd4ea7' '098495a852dfcb6befe1f116985bd4be')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  patch -Np0 -i ${startdir}/src/cheese-2.22-svn-r606.patch || return 1
  libtoolize --force --copy || return 1
  aclocal || return 1
  autoconf || return 1
  automake || return 1
  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var --disable-scrollkeeper || return 1
  make || return 1
  make -j1 GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR=${startdir}/pkg install || return 1
 
  install -m755 -d ${startdir}/pkg/usr/share/gconf/schemas
  gconf-merge-schema ${startdir}/pkg/usr/share/gconf/schemas/${pkgname}.schemas ${startdir}/pkg/etc/gconf/schemas/*.schemas || return 1
  rm -f ${startdir}/pkg/etc/gconf/schemas/*.schemas
}
