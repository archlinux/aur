# Maintainer: Giovanni 'ItachiSan' Santini <giovannisantini93@yahoo.it>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=epiphany-mse
_pkgname=epiphany
pkgver=3.28.3.1
pkgrel=1
pkgdesc="A GNOME web browser based on the WebKit rendering engine"
url="https://wiki.gnome.org/Apps/Web"
arch=(i686 x86_64)
license=(GPL)
depends=(webkit2gtk gcr icu)
makedepends=(itstool docbook-xml startup-notification lsb-release
             gobject-introspection yelp-tools appstream-glib git meson)
groups=(gnome)
_commit=a5a9a7e2904e2206b3cc863ab13748255247e3eb  # tags/3.28.3.1^0
source=("$pkgname::git+https://gitlab.gnome.org/GNOME/epiphany.git#commit=$_commit"
        "pluginsdir.diff::https://git.archlinux.org/svntogit/packages.git/plain/repos/extra-x86_64/pluginsdir.diff?h=packages/epiphany&id=83efda"
        enable_mse.patch)
provides=($_pkgname)
conflicts=($_pkgname)
sha256sums=('SKIP'
            'b6c8ee6ace934c053f2fd89758e0b587cb8953c6b0246c1359aecaae4de70289'
            'e7eb909859f4fa5ac56fe57a927dbb213a05af8fee271ab2f735a90456d65924')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $pkgname
  patch -Np1 -i ../pluginsdir.diff
  patch -Np1 -i ../enable_mse.patch
}

build() {
  arch-meson $pkgname build \
    -D distributor_name="Arch Linux®"
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}
