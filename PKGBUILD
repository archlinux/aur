# Maintainer: ian_eo <ian.eric.ong@gmail.com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Harley Laue <losinggeneration@yahoo.com>

pkgbase=anjuta
pkgname=('libanjuta' 'anjuta')
pkgver=3.34.0
pkgrel=9
pkgdesc="GNOME Integrated Development Environment (IDE)"
arch=(x86_64)
license=(GPL)
makedepends=(gdl vte3 autogen devhelp glade libgda subversion neon dconf gtk-doc
             yelp-tools gnome-common intltool gobject-introspection itstool gjs
             git python)
optdepends=('perl: required for plugin tools')
url="http://www.anjuta.org/"
options=('!emptydirs')
_commit=aaadfafe19450d8524400af9ae09d5187b2d627a  # master
source=(https://download.gnome.org/sources/$pkgbase/${pkgver:0:4}/$pkgbase-$pkgver.tar.xz)
sha256sums=('42a93130ed3ee02d064a7094e94e1ffae2032b3f35a87bf441e37fc3bb3a148f')

prepare() {
  cd $pkgbase-$pkgver
  AUTOPOINT="intltoolize" autoreconf -fvi
}


build() {
  cd $pkgbase-$pkgver

  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var \
      --disable-compile-warnings \
      --disable-schemas-compile \
      --disable-silent-rules \
      --disable-static \
      --disable-vala \
      --disable-plugin-devhelp \
      --enable-introspection \
      --enable-plugin-glade \
      --enable-plugin-subversion \
      --enable-glade-catalog \
      --enable-gtk-doc
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package_libanjuta(){
  pkgdesc="Anjuta runtime library"
  depends=(gdl)
  conflicts=('anjuta<3.4.4')

  cd $pkgbase-$pkgver/libanjuta

  # j1: Race during linking
  make -j1 DESTDIR="$pkgdir" install
}

package_anjuta(){
  pkgdesc="GNOME Integrated Development Environment (IDE)"
  depends=(libanjuta vte3 autogen devhelp glade libgda subversion neon dconf
           libgladeui-2.so)

  cd $pkgbase-$pkgver
  make -j1 DESTDIR="$pkgdir" install

  cd libanjuta
  make -j1 DESTDIR="$pkgdir" uninstall
}
