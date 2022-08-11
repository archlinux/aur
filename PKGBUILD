# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=iotas-git
pkgver=r47.5c9fe89
pkgrel=1
pkgdesc="Simple note taking"
arch=('x86_64')
url="https://gitlab.gnome.org/cheywood/iotas"
license=('GPL3')
depends=('libadwaita' 'sqlite' 'org.freedesktop.secrets' 'gtksourceview5')
makedepends=('git' 'meson' 'gobject-introspection')
checkdepends=('appstream-glib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+$url.git)
b2sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  arch-meson "${pkgname%-git}" build
  meson compile -C build
}

check() {
  meson test -C build || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
