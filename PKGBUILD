# $Id: PKGBUILD 278826 2016-10-15 00:15:40Z heftig $
# Contributor: Jan de Groot <jgc@archlinux.org>
# Maintainer: Ian Hernández <badwolfie@archlinux.info>

_pkgbase=nautilus
pkgbase=nautilus-typeahead
pkgname=(nautilus-typeahead libnautilus-extension-typeahead)
pkgver=3.22.1
pkgrel=1
pkgdesc="Default file manager for GNOME - Patched to bring back the 'typeahead find' feature"
url="https://wiki.gnome.org/Apps/Nautilus"
arch=(i686 x86_64)
license=(GPL)
depends=(libexif gnome-desktop exempi gvfs dconf libtracker-sparql nautilus-sendto gnome-autoar)
makedepends=(intltool gobject-introspection python packagekit python2 gnome-common git gtk-doc)
options=(!emptydirs)
_commit=ce0c0bb5510577c9285512d2be52cba119903b96  # tags/3.22.1^0
source=("git://git.gnome.org/nautilus#commit=$_commit"
        "git://git.gnome.org/libgd"
        nautilus-restore-typeahead.patch)
sha256sums=('SKIP'
            'SKIP'
            '660ff8f7f5cec80c4f08862a89b63bc9fb21656fdcdc7cde057414bc269fbc54')

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
