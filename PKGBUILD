# $Id: PKGBUILD 278826 2016-10-15 00:15:40Z heftig $
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Ian Hernández <badwolfie@archlinux.info>
# Maintainer: Albert Vaca Cintora <albertvaka@gmail.com>

_pkgbase=nautilus
pkgbase=nautilus-typeahead
pkgname=(nautilus-typeahead libnautilus-extension-typeahead)
pkgver=3.28.0.1
pkgrel=1
pkgdesc="Default file manager for GNOME - Patched to bring back the 'typeahead find' feature"
url="https://wiki.gnome.org/Apps/Nautilus"
arch=(i686 x86_64)
license=(GPL)
depends=(libgexiv2 gnome-desktop gvfs dconf tracker gnome-autoar)
makedepends=(gobject-introspection packagekit git gtk-doc appstream-glib 'meson>=0.44.1' ninja)
optdepends=('nautilus-sendto: right click to send files')
options=(!emptydirs)
_commit=9f28215927d023b54d88a25e026163e9e193bcf3  # tags/3.28.0.1
source=("git+https://gitlab.gnome.org/GNOME/nautilus.git#commit=$_commit"
        nautilus-restore-typeahead.patch)
sha256sums=('SKIP'
            'd5eb01843d2758e74e25686f521f5fd72879e32595b494e9cabb8f8f1a2a87a5')

prepare() {
  cd $_pkgbase

  git submodule init
  git submodule update

  patch -p1 -i ../nautilus-restore-typeahead.patch
}

pkgver() {
  cd $_pkgbase
  git describe --tags | sed 's/-/+/g'
}

build() {
  arch-meson $_pkgbase build -D docs=true
  ninja -C build
}

package_nautilus-typeahead() {
  depends+=(libnautilus-extension-typeahead)
  conflicts=(nautilus)
  provides=(nautilus)
  groups=(gnome)

  DESTDIR="$pkgdir" ninja -C build install

### Split libnautilus-extension
  mkdir -p libne/{lib,share}
  mv "$pkgdir"/usr/include libne
  mv "$pkgdir"/usr/lib/{girepository-1.0,libnautilus-extension*,pkgconfig} libne/lib
  mv "$pkgdir"/usr/share/{gir-1.0,gtk-doc} libne/share
}

package_libnautilus-extension-typeahead() {
  pkgdesc="Library for extending the $pkgdesc"
  conflicts=(libnautilus-extension)
  provides=(libnautilus-extension)
  depends=(gtk3)

  mv libne "$pkgdir/usr"
}
