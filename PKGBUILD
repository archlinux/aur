# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=master-key-git
pkgver=1.2.0.r1.g345c41b
pkgrel=1
pkgdesc="Master Key is a password manager application built with Python 3 and GTK that generates and manages passwords without the need to store them"
arch=('any')
url="https://gitlab.com/guillermop/master-key"
license=('GPL3')
depends=('gtk4' 'glib2' 'libadwaita' 'sassc' 'libsass' 'python' 'python-gobject' 'libpwquality' 'sqlcipher' 'tcl')
makedepends=('git' 'meson' 'gobject-introspection')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+$url.git)
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  arch-meson "${pkgname%-git}" _build
  meson compile -C _build
}

package() {
  cd "$srcdir"
  DESTDIR="$pkgdir" ninja install -C _build
}





