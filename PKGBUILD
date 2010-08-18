# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=cheese
pkgver=2.30.1
pkgrel=2
pkgdesc="Use your webcam to take photos and videos, apply fancy special effects and share the fun with others"
arch=(i686 x86_64)
license=('GPL')
depends=('gnome-desktop>=2.30.2' 'gstreamer0.10-base-plugins>=0.10.30' 'gstreamer0.10-good-plugins>=0.10.24' 'librsvg>=2.26.3' 'gnome-icon-theme>=2.30.2' 'libcanberra')
makedepends=('pkgconfig' 'gnome-doc-utils>=0.20.1' 'intltool')
groups=('gnome-extra')
options=('!libtool' '!emptydirs')
url="http://www.gnome.org/projects/cheese/"
install=cheese.install
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/2.30/${pkgname}-${pkgver}.tar.bz2
        bug618203.patch)
sha256sums=('48f03470c6f527caa0e3b269d3afcff86ae0939a74f66ce030d4eed3bc3cbd9a'
            'a3db736018b4d8a6f3ec1236b0aed788f7bbfa074046db5eb74fa8b261c63e02')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np1 -i "${srcdir}/bug618203.patch"
  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --libexecdir=/usr/lib \
      --disable-scrollkeeper
  make
  make -j1 GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="${pkgdir}" install
 
  install -m755 -d "${pkgdir}/usr/share/gconf/schemas"
  gconf-merge-schema "${pkgdir}/usr/share/gconf/schemas/${pkgname}.schemas" --domain cheese ${pkgdir}/etc/gconf/schemas/*.schemas
  rm -f ${pkgdir}/etc/gconf/schemas/*.schemas
}
