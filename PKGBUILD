# $Id: PKGBUILD 266459 2016-04-28 13:20:07Z jgc $
# Contributor: Jan de Groot <jgc@archlinux.org>
# Maintainer: Ian Hernández <ihernandezs@openmailbox.org>

_pkgbase=nautilus
pkgbase=nautilus-typeahead
pkgname=(nautilus-typeahead libnautilus-extension-typeahead)
pkgver=3.22.0.1+22+gd72934b
pkgrel=1
pkgdesc="Default file manager for GNOME - Patched to bring back the 'typeahead find' feature"
url="https://wiki.gnome.org/Apps/Nautilus"
arch=(i686 x86_64)
license=(GPL)
depends=(libexif gnome-desktop exempi gvfs dconf libtracker-sparql nautilus-sendto gnome-autoar)
makedepends=(intltool gobject-introspection python packagekit python2 gnome-common git gtk-doc)
options=(!emptydirs)
_commit=d72934b3f94dfd7eb109a60bd0b262c4f9cd7ed4
_libgd=752f65e91ea0d9a2ee8a2d21343bbd97bd0d038a
source=("git://git.gnome.org/nautilus#commit=$_commit"
        "git://git.gnome.org/libgd#commit=$_libgd"
        nautilus-restore-typeahead.patch)
sha256sums=('SKIP'
            'SKIP'
            '78a2df9012f2c448a07365e7adb3c1f6058427e8453b4b003e0f68f69a563379')

prepare() {
  cd $_pkgbase

  git submodule init
  git config --local submodule.libgd.url "$srcdir/libgd"
  git submodule update

  patch -p1 -i ../nautilus-restore-typeahead.patch
  NOCONFIGURE=1 ./autogen.sh
}

pkgver() {
  cd $_pkgbase
  git describe --tags | sed 's/-/+/g'
}

build() {
  cd $_pkgbase
  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-static \
      --libexecdir=/usr/lib/nautilus \
      --disable-update-mimedb \
      --disable-schemas-compile \
      --disable-selinux --enable-gtk-doc
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package_nautilus-typeahead() {
  depends+=(libnautilus-extension)
  install=nautilus.install
  conflicts=(nautilus)
  provides=(nautilus)
  groups=(gnome)

  cd $_pkgbase
  make DESTDIR="$pkgdir" install

### Split libnautilus-extension
  make DESTDIR="$pkgdir" -C libnautilus-extension uninstall
  make DESTDIR="$pkgdir" -C docs/reference/libnautilus-extension uninstall
}

package_libnautilus-extension-typeahead() {
  pkgdesc="Library for extending the $pkgdesc"
  conflicts=(libnautilus-extension)
  provides=(libnautilus-extension)
  depends=(gtk3)

  cd $_pkgbase
  make DESTDIR="$pkgdir" -C libnautilus-extension install
  make DESTDIR="$pkgdir" -C docs/reference/libnautilus-extension install
}
