# $Id: PKGBUILD 266459 2016-04-28 13:20:07Z jgc $
# Contributor: Jan de Groot <jgc@archlinux.org>
# Maintainer: Ian Hernández <ihernandezs@openmailbox.org>

_pkgbase=nautilus
pkgname=(nautilus-typeahead libnautilus-extension-typeahead)
pkgbase=$pkgname
pkgver=3.20.1
pkgrel=1
pkgdesc="GNOME file manager - Patched to bring back the 'typeahead find' feature"
arch=(i686 x86_64)
license=(GPL)
depends=(libexif gnome-desktop exempi gvfs desktop-file-utils dconf 
         libtracker-sparql nautilus-sendto)
makedepends=(intltool gobject-introspection python packagekit python2)
url="http://www.gnome.org"
options=('!emptydirs')
source=(http://download.gnome.org/sources/$_pkgbase/${pkgver:0:4}/$_pkgbase-$pkgver.tar.xz
        translation-de.patch
        nautilus-restore-typeahead.patch)
sha256sums=('f2a907b994026412a7ed7c8145d4ab4f886ac87e780353b967473305a35e81e8'
            '564799623f8910208cef1e0ed583cfd049e98f9c71e15c56924f6c8452ab192b'
            '034d2b5e97ec920120d88fa4d28efca047d326e069c39e2e1757f363c765eb87')

prepare() {
  cd $_pkgbase-$pkgver
  patch -p1 -i ../nautilus-restore-typeahead.patch
  patch -Np0 -i ../translation-de.patch
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
