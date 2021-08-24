# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=symbolic-preview-git
pkgver=r108.d6570c5
pkgrel=1
pkgdesc="Symbolics made easy"
arch=('any')
url="https://gitlab.gnome.org/World/design/symbolic-preview"
license=('GPL3')
depends=('gtk3' 'gdk-pixbuf2' 'glib2')
makedepends=('git' 'meson' 'rust' 'cargo')
checkdepends=('appstream-glib')
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

prepare() {
  cd "${pkgname%-git}"
  cargo update
}

build() {
  arch-meson "${pkgname%-git}" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
