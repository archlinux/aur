# $Id: PKGBUILD 239312 2015-05-13 21:24:40Z heftig $
# Contributor: Jan de Groot <jgc@archlinux.org>
# Maintainer: Ian Hernández <ihernandezs@openmailbox.org>

_pkgbase=nautilus
pkgname=(nautilus-typeahead libnautilus-extension-typeahead)
pkgbase=$pkgname
pkgver=3.16.2
pkgrel=1
pkgdesc="GNOME file manager - Patched to bring back the 'typeahead find' feature"
arch=(i686 x86_64)
license=(GPL)
depends=(libexif gnome-desktop exempi gvfs desktop-file-utils dconf 
         libtracker-sparql libnotify nautilus-sendto)
makedepends=(intltool gobject-introspection python python2 packagekit)
url="http://www.gnome.org"
options=('!emptydirs')
source=(http://download.gnome.org/sources/$_pkgbase/${pkgver:0:4}/$_pkgbase-$pkgver.tar.xz nautilus-restore-typeahead.patch)
sha256sums=('3e7ecdda3a47b6ad03098270940aa506782866fa3602d91e711d99f96741478f' '7c7d82908baf28d2d57471b9fbb2131d987869eb5f8f3d5890c48ab244102154')

prepare() {
  cd $_pkgbase-$pkgver
  patch -p1 -i ../nautilus-restore-typeahead.patch
  autoreconf -f -i
}

build() {
  cd $_pkgbase-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-static \
      --libexecdir=/usr/lib/nautilus \
      --disable-update-mimedb \
      --disable-schemas-compile
  make
}

package_nautilus-typeahead() {
  depends+=(libnautilus-extension)
  install=nautilus.install
  conflicts=$_pkgbase
  provides=$_pkgbase

  cd $_pkgbase-$pkgver
  make DESTDIR="$pkgdir" install

### Split libnautilus-extension
  cd ..
  mkdir -p n-e/usr/{lib,share}
  mv "$pkgdir"/usr/include n-e/usr
  mv "$pkgdir"/usr/lib/{girepository-1.0,pkgconfig} n-e/usr/lib
  mv "$pkgdir"/usr/lib/libnautilus-extension.so* n-e/usr/lib
  mv "$pkgdir"/usr/share/{gir-1.0,gtk-doc} n-e/usr/share
}

package_libnautilus-extension-typeahead() {
  pkgdesc="Library for extending the $pkgdesc"
  conflicts=libnautilus-extension
  provides=libnautilus-extension
  depends=(gtk3)

  mv n-e/* "$pkgdir"
}
