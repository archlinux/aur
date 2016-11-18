# Maintainer: chron <chron at posteo dot de>
# Contributor: M0Rf30

pkgname=gnome-multi-writer
pkgver=3.22.1
pkgrel=1
pkgdesc="Write an ISO file to multiple USB devices at once"
arch=('i686' 'x86_64')
url="http://blogs.gnome.org/hughsie/2015/01/02/introducing-gnome-multiwriter/"
license=('GPL2')
depends=('gtk3' 'udisks2' 'libcanberra' 'libgusb')
makedepends=('intltool' 'gnome-common' 'gobject-introspection' 'docbook-utils' 'docbook-sgml')
source=(https://download.gnome.org/sources/gnome-multi-writer/3.22/${pkgname}-${pkgver}.tar.xz)
sha256sums=('02fe592b9c6c3b1b76dc7436f10a60673b8e89fb0f81f8e99ae943f6ba139fb6')

prepare() {
  cd $srcdir/${pkgname}-${pkgver}
  ./configure --prefix=/usr --libexecdir=/usr/lib/${pkgname}
  sed -i "s/docbook2man \$?/jw -c \/usr\/share\/sgml\/docbook-sgml-4.5\/catalog -b man \$?/g" man/Makefile
}

build() {
  cd $srcdir/${pkgname}-${pkgver}
  make
}

check() {
  cd $srcdir/${pkgname}-${pkgver}
  make check
}

package(){
  cd $srcdir/${pkgname}-${pkgver}
  # Remove 'NoDisplay=false' from the .desktop file, otherwise it won't show up in dmenu
  sed -i "s/NoDisplay=false//g" data/org.gnome.MultiWriter.desktop

  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  make DESTDIR=$pkgdir install install-data
}
