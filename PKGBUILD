# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=swatch-git
pkgver=1.0.r1.gfedb54b
pkgrel=1
pkgdesc="Color palette manager"
arch=('any')
url="https://gitlab.gnome.org/GabMus/swatch"
license=('GPL3')
depends=('glib2' 'libadwaita')
makedepends=('git' 'meson' 'gobject-introspection' 'blueprint-compiler')
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

#check() {
#  meson test -C build
#}

package() {
  meson install -C build --destdir "$pkgdir"
}
