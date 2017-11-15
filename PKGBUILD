# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=imlib
pkgver=1.9.15
pkgrel=15
pkgdesc="General image handling library for X11 and Gtk"
arch=('x86_64')
url="http://freshmeat.net/projects/imlib/"
license=('GPL')
depends=('giflib' 'libpng' 'libtiff' 'libxext')
makedepends=('libxt')
source=(http://ftp.gnome.org/pub/GNOME/sources/imlib/1.9/${pkgname}-${pkgver}.tar.bz2
        debian-bug448360.patch CAN-2004-1026.patch aclocal-fixes.patch 
        imlib-1.9.15-libpng15.patch imlib-giflib51.patch imlib-gtk.patch)
sha1sums=('c9a732a354fbb3c7e1a426e5d19fc92d73f8f720'
          'fe2fd9ce4d7bc62271e724153de39012de8ec5ee'
          'ec1b47281c1a7fb21abe841f948ecc56ed13f310'
          'af54cb1ee0c8c6122b277284ebdd1022e31df3b5'
          '33c3aaa43eb624f2a6ab0406285a8515903333e3'
          '3c33b3d7f7125a6fbfcf48ca585739b71b1d8ebf'
          '7cf962f8d7488200910ba4bdee00473f035b054a')

prepare() {
  cd ${pkgname}-${pkgver}
  patch -p1 -i "${srcdir}/debian-bug448360.patch"
  patch -p1 -i "${srcdir}/CAN-2004-1026.patch"
  patch -p0 -i "${srcdir}/aclocal-fixes.patch"
  patch -p0 -i "${srcdir}/imlib-1.9.15-libpng15.patch"
  patch -p1 -i "${srcdir}/imlib-giflib51.patch"
  patch -p1 -i "${srcdir}/imlib-gtk.patch"
  sed '/AC_PATH_XTRA/d' -i configure.in
  mv configure.in configure.ac
  libtoolize --force
  cp /usr/bin/libtool .
}

build() {
  cd ${pkgname}-${pkgver}
  autoreconf --force --install
  ./configure --prefix=/usr --sysconfdir=/etc --mandir=/usr/share/man --enable-shm --disable-static
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
