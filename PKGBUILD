# Contributor: Eduardo Romero <eduardo@archlinux.org>
# Maintainer: Valère Monseur <valere dot monseur at ymail dot com>

pkgname=gtkam
pkgver=0.2.0
pkgrel=2
pkgdesc="A graphical GTK front-end to gphoto2"
url="http://gphoto.sourceforge.net/proj/gtkam/"
arch=('i686' 'x86_64')
depends=('libgphoto2>=2.5.0' 'libexif-gtk' 'gdk-pixbuf2' 'libpng')
makedepends=('gimp' 'intltool')
license=('GPL')
source=(http://downloads.sourceforge.net/sourceforge/gphoto/${pkgname}-${pkgver}.tar.gz
        gtkam1.patch
        gtkam2.patch
        gtkam3.patch
        gtkam4.patch)
md5sums=('cbec9eb6ac36b9bedaa5762392ee54bc'
         'eef28ce7fceb27f92c08d5c59a75331d'
         '7c28b263ec83e70b2a96c3b110483727'
         'd703b0fabdd4d7d81a4fcd294d937c34'
         '1bd50bdaa806ff74435781745b55962d')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  patch -p1 -i "${srcdir}/gtkam1.patch"
  patch -p1 -i "${srcdir}/gtkam2.patch"
  patch -p1 -i "${srcdir}/gtkam3.patch"
  patch -p1 -i "${srcdir}/gtkam4.patch"

  # needed as patches modify the autotools files 
  autoreconf

  ./configure --prefix=/usr --sysconfdir=/etc \
    --without-bonobo --without-gnome \
    --disable-scrollkeeper

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
  sed -i -e 's/^_//' "${pkgdir}/usr/share/applications/gtkam.desktop"
}
