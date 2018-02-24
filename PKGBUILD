# $Id: PKGBUILD 278826 2016-10-15 00:15:40Z heftig $
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Ian Hernández <badwolfie@archlinux.info>
# Maintainer: Albert Vaca Cintora <albertvaka@gmail.com>

_pkgbase=nautilus
pkgbase=nautilus-typeahead
pkgname=(nautilus-typeahead libnautilus-extension-typeahead)
pkgver=3.26.2
pkgrel=3
pkgdesc="Default file manager for GNOME - Patched to bring back the 'typeahead find' feature"
url="https://wiki.gnome.org/Apps/Nautilus"
arch=(i686 x86_64)
license=(GPL)
depends=(libexif gnome-desktop exempi gvfs dconf tracker nautilus-sendto gnome-autoar)
makedepends=(intltool gobject-introspection python packagekit python2 gnome-common git gtk-doc 'meson>=0.44.1' ninja)
options=(!emptydirs)
_commit=51637bc0960002b811e1c0c7be8671cf9a1cc5be  # tags/3.26.2
source=("git+https://gitlab.gnome.org/GNOME/nautilus.git#commit=$_commit"
        nautilus-restore-typeahead.patch)
sha256sums=('SKIP'
            '17213656a016da2aaed14ca5c3cc9df30ad76ea59847b50dce4feb77619af274')

prepare() {
  mkdir -p build libne/usr/{lib,share}
  ls
  cd $_pkgbase

  git submodule init
  git submodule update

  git cherry-pick -n d74e1a3d 9238456b bf86a803

  patch -p1 -i ../nautilus-restore-typeahead.patch
}

pkgver() {
  cd $_pkgbase
  git describe --tags | sed 's/-/+/g'
}

build() {
  cd build
  arch-meson ../nautilus \
    -Denable-exif=true \
    -Denable-xmp=true \
    -Denable-gtk-doc=true \
    -Denable-selinux=false
  ninja
}

package_nautilus-typeahead() {
  depends+=(libnautilus-extension-typeahead)
  install=nautilus.install
  conflicts=(nautilus)
  provides=(nautilus)
  groups=(gnome)

  cd build
  DESTDIR="$pkgdir" ninja install

### Split libnautilus-extension
  cd ../libne
  mv "$pkgdir"/usr/include usr
  mv "$pkgdir"/usr/lib/{girepository-1.0,libnautilus-extension*,pkgconfig} usr/lib
  mv "$pkgdir"/usr/share/{gir-1.0,gtk-doc} usr/share
}

package_libnautilus-extension-typeahead() {
  pkgdesc="Library for extending the $pkgdesc"
  conflicts=(libnautilus-extension)
  provides=(libnautilus-extension)
  depends=(gtk3)

  mv libne/usr "$pkgdir"
}
