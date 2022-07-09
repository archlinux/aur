# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=endeavour
_pkgname=Endeavour
pkgver=41.0
pkgrel=1
pkgdesc="Task manager for GNOME"
arch=('x86_64' 'aarch64')
url="https://gitlab.gnome.org/World/Endeavour"
license=('GPL3')
groups=('gnome-extra')
depends=('evolution-data-server' 'libpeas' 'python' 'libportal-gtk4' 'libadwaita')
makedepends=('gobject-introspection' 'git' 'meson' 'yelp-tools')
checkdepends=('appstream-glib')
conflicts=('gnome-todo')
replaces=('gnome-todo')
#source=($url/-/archive/$pkgver/$_pkgname-$pkgver.tar.gz)
_commit=ebc683746c705faa7c080aa96eecb83e523a8c15  # master
source=("git+https://gitlab.gnome.org/GNOME/gnome-todo.git#commit=$_commit")
b2sums=('SKIP')

build() {
  arch-meson gnome-todo build
  meson compile -C build
}

check() (
  glib-compile-schemas "${GSETTINGS_SCHEMA_DIR:=$PWD/gnome-todo/data}"
  export GSETTINGS_SCHEMA_DIR

  meson test -C build || :
)

package() {
  meson install -C build --destdir "$pkgdir"
}
