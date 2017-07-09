# $Id: PKGBUILD 278826 2016-10-15 00:15:40Z heftig $
# Contributor: Jan de Groot <jgc@archlinux.org>
# Maintainer: Ian Hernández <badwolfie@archlinux.info>
# Maintainer: Albert Vaca Cintora <albertvaka@gmail.com>

_pkgbase=nautilus
pkgbase=nautilus-typeahead
pkgname=(nautilus-typeahead libnautilus-extension-typeahead)
pkgver=3.24.1
pkgrel=1
pkgdesc="Default file manager for GNOME - Patched to bring back the 'typeahead find' feature"
url="https://wiki.gnome.org/Apps/Nautilus"
arch=(i686 x86_64)
license=(GPL)
depends=(libexif gnome-desktop exempi gvfs dconf libtracker-sparql nautilus-sendto gnome-autoar)
makedepends=(intltool gobject-introspection python packagekit python2 gnome-common git gtk-doc meson ninja)
options=(!emptydirs)
_commit=1bab05578caf4c6eab15d385b95358efd3354c8b  # tags/3.24.1
source=("git://git.gnome.org/nautilus#commit=$_commit"
        "git://git.gnome.org/libgd"
        nautilus-restore-typeahead.patch)
sha256sums=('SKIP'
            'SKIP'
            '0610a7e3eea32028b3660309be761489b45dcc49da79a4a7d2f4ab275ee5bfc3')

prepare() {
  mkdir -p build libne/usr/{lib,share}
  cd $_pkgbase

  git submodule init
  git config --local submodule.libgd.url "$srcdir/libgd"
  git submodule update

  patch -p1 -i ../nautilus-restore-typeahead.patch
}

pkgver() {
  cd $_pkgbase
  git describe --tags | sed 's/-/+/g'
}

build() {
  cd build
  export LANG=en_US.UTF-8
  meson --prefix=/usr --buildtype=release ../nautilus \
    --sysconfdir=/etc \
    -Denable-exif=true \
    -Denable-xmp=true \
    -Denable-gtk-doc=true \
    -Denable-selinux=false
  ninja
}

package_nautilus-typeahead() {
  depends+=(libnautilus-extension)
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
