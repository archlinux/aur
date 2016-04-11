# $Id: PKGBUILD 248647 2015-10-08 19:53:05Z heftig $
# Contributor: Jan de Groot <jgc@archlinux.org>
# Maintainer: Ian Hernández <ihernandezs@openmailbox.org>

_pkgbase=nautilus
pkgname=(nautilus-typeahead libnautilus-extension-typeahead)
pkgbase=$pkgname
pkgver=3.20.0
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
sha256sums=('7ca7995a4d6a77871503dc092ae816584b8d1891730e1b9eed1a1e4a16194293' 'db89234d8b6d25cc9f82e9518b8010651d076e5d8e6d75b2eb45ff3b81e56c28')

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
      --disable-schemas-compile \
      --disable-selinux
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package_nautilus-typeahead() {
  depends+=(libnautilus-extension)
  install=nautilus.install
  conflicts=(nautilus)
  provides=(nautilus)
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
  conflicts=(libnautilus-extension)
  provides=(libnautilus-extension)
  depends=(gtk3)

  mv n-e/* "$pkgdir"
}
