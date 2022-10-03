# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=pinapp-git
_pkgname=PinApp
pkgver=r146.894c5e8
_commit=a9947bd8f8691a352a41b6534686ce48c4f6ece4
pkgrel=1
pkgdesc="Create your own application shortcuts"
arch=('x86_64' 'aarch64')
url="https://github.com/fabrialberio/PinApp"
license=('GPL3')
depends=('libadwaita')
makedepends=('git' 'meson')
checkdepends=('appstream-glib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+$url.git)
b2sums=('SKIP')

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
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}

