# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=worldpossible-scriptlauncher-git
pkgver=1.0.1.r0.gbaa8c0a
pkgrel=1
pkgdesc="A tool for running shell scripts with root privileges"
arch=('any')
url="https://github.com/endlessm/worldpossible-scriptlauncher"
license=('GPL2')
makedepends=('git' 'meson' 'python')
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
    arch-meson ${pkgname%-git} build
    meson compile -C build
}

package() {
  cd "$srcdir"
    DESTDIR="${pkgdir}" ninja -C build install
}
