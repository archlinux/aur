# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=dspy-git
_pkgname=d-spy
pkgver=1.0.0.r0.g85e405d
pkgrel=1
pkgdesc="It's like d-feet, but written in C and blisteringly fast. Also comes with a library for IDE integration"
arch=('x86_64')
url="https://gitlab.gnome.org/GNOME/d-spy"
license=('GPL3')
depends=('gtk4' 'libadwaita')
makedepends=('meson')
checkdepends=('appstream-glib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+$url.git)
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname%-git}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  arch-meson "${_pkgname%-git}" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
