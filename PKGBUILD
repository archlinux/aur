# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=symbolic-preview-git
pkgver=0.0.3.r9.gb705b6b
pkgrel=1
pkgdesc="Symbolics made easy"
arch=('x86_64')
url="https://gitlab.gnome.org/World/design/symbolic-preview"
license=('GPL3')
depends=('gtk4' 'gdk-pixbuf2' 'glib2' 'libadwaita')
makedepends=('git' 'meson' 'rust')
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
