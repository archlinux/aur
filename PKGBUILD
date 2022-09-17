# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=endeavour
_pkgname=Endeavour
pkgver=42.0
pkgrel=4
pkgdesc="Task manager for GNOME"
arch=('x86_64' 'aarch64')
url="https://gitlab.gnome.org/World/Endeavour"
license=('GPL3')
groups=('gnome-extra')
depends=('evolution-data-server' 'libpeas' 'librest' 'python' 'libportal-gtk4' 'libadwaita>=1.2')
makedepends=('gobject-introspection' 'meson' 'yelp-tools')
checkdepends=('appstream-glib')
provides=('gnome-todo')
conflicts=('gnome-todo')
replaces=('gnome-todo')
source=($url/-/archive/v$pkgver/$_pkgname-v$pkgver.tar.gz
  132.patch)
b2sums=('7c2f5fe089b86e9e26a33131fb892332b8b43de8f363b8a1ca95a4c15b5d35aa14c1c8db4a2e309f1b57eb84f2d4492935c056223d741c2a346c4bdb99ad6f88'
        'd4792e076150cf8e57401908f1528d5ac54e3fdc8b5e96aa4c6ce38d01db5e00e4b390fae98dc3697500b8127c78e5f2fba35ac9ab198c2e50fb94a5b67e22ac')

prepare() {
  cd "$_pkgname-v$pkgver"
  patch -Np1 -i "$srcdir/132.patch"
}

build() {
  arch-meson "$_pkgname-v$pkgver" build
  meson compile -C build
}

check() (
  glib-compile-schemas "${GSETTINGS_SCHEMA_DIR:=$PWD/$_pkgname-v$pkgver/data}"
  export GSETTINGS_SCHEMA_DIR

  meson test -C build --print-errorlogs || :
)

package() {
  meson install -C build --destdir "$pkgdir"
}
