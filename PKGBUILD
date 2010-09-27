# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=cheese
pkgver=2.31.92
pkgrel=1
pkgdesc="Use your webcam to take photos and videos, apply fancy special effects and share the fun with others"
arch=(i686 x86_64)
license=('GPL')
depends=('gnome-desktop>=2.31.92' 'gstreamer0.10-base-plugins>=0.10.30' 'gstreamer0.10-good-plugins>=0.10.24' 'librsvg>=2.31.0' 'gnome-icon-theme>=2.31.0' 'libcanberra>=0.25')
makedepends=('pkgconfig' 'gnome-doc-utils>=0.20.1' 'intltool')
groups=('gnome-extra')
options=('!libtool' '!emptydirs')
url="http://www.gnome.org/projects/cheese/"
install=cheese.install
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/2.31/${pkgname}-${pkgver}.tar.bz2)
sha256sums=('e23f75a68dc9fe814eaf747b7905eb5c137188f309cc8c960e7e59d03a8c2fc6')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --libexecdir=/usr/lib \
      --disable-scrollkeeper --disable-static
  make
  make -j1 GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="${pkgdir}" install

  install -m755 -d "${pkgdir}/usr/share/gconf/schemas"
  gconf-merge-schema "${pkgdir}/usr/share/gconf/schemas/${pkgname}.schemas" --domain cheese ${pkgdir}/etc/gconf/schemas/*.schemas
  rm -f ${pkgdir}/etc/gconf/schemas/*.schemas
}
