# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=cheese
pkgver=2.29.91
pkgrel=1
pkgdesc="Use your webcam to take photos and videos, apply fancy special effects and share the fun with others"
arch=(i686 x86_64)
license=('GPL')
depends=('gnome-desktop>=2.29.91' 'gstreamer0.10-base-plugins>=0.10.26' 'gstreamer0.10-good-plugins>=0.10.18' 'librsvg>=2.26.0' 'gnome-icon-theme>=2.28.0' 'libcanberra')
makedepends=('pkgconfig' 'gnome-doc-utils>=0.19.5' 'intltool')
groups=('gnome-extra')
options=('!libtool' '!emptydirs')
url="http://www.gnome.org/projects/cheese/"
install=cheese.install
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/2.29/${pkgname}-${pkgver}.tar.bz2)
sha256sums=('94f827fc9fdd7cb362fd087b946041726c7aba1d9f783badbf20b9f7958b6da0')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --libexecdir=/usr/lib \
      --disable-scrollkeeper || return 1
  make || return 1
  make -j1 GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="${pkgdir}" install || return 1
 
  install -m755 -d "${pkgdir}/usr/share/gconf/schemas"
  gconf-merge-schema "${pkgdir}/usr/share/gconf/schemas/${pkgname}.schemas" --domain cheese ${pkgdir}/etc/gconf/schemas/*.schemas || return 1
  rm -f ${pkgdir}/etc/gconf/schemas/*.schemas
}
