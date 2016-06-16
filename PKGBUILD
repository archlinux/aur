#Contributor: M0Rf30
#Maintainer: chron <chron at posteo dot de>

pkgname=gnome-multi-writer
_pkgname=GNOME_MULTI_WRITER
pkgver=3.20.0
_pkgver=3_20_0
pkgrel=2
pkgdesc="Write an ISO file to multiple USB devices at once"
arch=('i686' 'x86_64')
url="http://blogs.gnome.org/hughsie/2015/01/02/introducing-gnome-multiwriter/"
license=('GPL2')
depends=('gtk3' 'udisks2' 'libcanberra')
#TODO: Add docbook2x to makedepends, and fix resulting build errors
makedepends=('intltool' 'gnome-common' 'gobject-introspection' 'docbook2x')
source=(https://git.gnome.org/browse/gnome-multi-writer/snapshot/${_pkgname}_${_pkgver}.tar.xz)
sha256sums=('ed1906decb1ff19d5c35bcc9e233d9b23e4f34d8b35c55bb6c7c908155f3859f')
install=$pkgname.install

build() {
  cd $srcdir/${_pkgname}_${_pkgver}
  ./autogen.sh --prefix=/usr
  sed -i "s/docbook2man \$?/docbook2man --sgml \$?/g" man/Makefile
  make
}

check() {
  cd $srcdir/${_pkgname}_${_pkgver}
  make check
}

package(){
  cd $srcdir/${_pkgname}_${_pkgver}
  # Remove 'NoDisplay=false' from the .desktop file, otherwise it won't show up in dmenu
  sed -i "s/NoDisplay=false//g" data/org.gnome.MultiWriter.desktop

  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  make DESTDIR=$pkgdir install install-data
}
