# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=eartag-git
pkgver=r79.29bda84
pkgrel=1
pkgdesc="Simple music tag editor"
arch=('any')
url="https://github.com/knuxify/eartag"
license=('GPL3')
depends=('libadwaita' 'taglib' 'python-gobject' 'python-eyed3' 'python-pytaglib' 'python-magic')
makedepends=('git' 'meson')
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
