# $Id: PKGBUILD 248647 2015-10-08 19:53:05Z heftig $
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Maintainer: Ian Hernández <ihernandezs@openmailbox.org>

_pkgbase=nautilus
pkgname=(nautilus-typeahead libnautilus-extension-typeahead)
pkgbase=$pkgname
pkgver=3.18.0
pkgrel=1
pkgdesc="GNOME file manager - Patched to bring back the 'typeahead find' feature"
arch=(i686 x86_64)
license=(GPL)
depends=(libexif gnome-desktop exempi gvfs desktop-file-utils dconf 
         libtracker-sparql nautilus-sendto)
makedepends=(intltool gobject-introspection python packagekit)
url="http://www.gnome.org"
options=('!emptydirs')
source=(http://download.gnome.org/sources/$_pkgbase/${pkgver:0:4}/$_pkgbase-$pkgver.tar.xz nautilus-restore-typeahead.patch)
sha256sums=('6914e5698c5ce865870086e4db9395d56a78eddf8002020458ce05db16a95a33' '39c6b7169df479ab5049499a7b26953b68e8870dac0919b454c6b441d74fa4f0')

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
  groups=(gnome)

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
