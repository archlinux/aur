# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=endeavour
_pkgname=Endeavour
pkgver=42.0
pkgrel=1
pkgdesc="Task manager for GNOME"
arch=('x86_64' 'aarch64')
url="https://gitlab.gnome.org/World/Endeavour"
license=('GPL3')
groups=('gnome-extra')
depends=('evolution-data-server' 'libpeas' 'librest' 'python' 'libportal-gtk4' 'libadwaita')
makedepends=('gobject-introspection' 'meson' 'yelp-tools')
checkdepends=('appstream-glib')
conflicts=('gnome-todo')
replaces=('gnome-todo')
source=($url/-/archive/v$pkgver/$_pkgname-v$pkgver.tar.gz)
b2sums=('7c2f5fe089b86e9e26a33131fb892332b8b43de8f363b8a1ca95a4c15b5d35aa14c1c8db4a2e309f1b57eb84f2d4492935c056223d741c2a346c4bdb99ad6f88')

build() {
  arch-meson "$_pkgname-v$pkgver" build
  meson compile -C build
}

check() (
  glib-compile-schemas "${GSETTINGS_SCHEMA_DIR:=$PWD/$_pkgname-v$pkgver/data}"
  export GSETTINGS_SCHEMA_DIR

  meson test -C build || :
)

package() {
  meson install -C build --destdir "$pkgdir"
}
