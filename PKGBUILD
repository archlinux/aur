# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=funkcio-git
pkgver=r62.6e06814
pkgrel=2
pkgdesc="Draw functions from points"
arch=('x86_64')
url="https://github.com/wbernard/funkcio"
license=('GPL3')
depends=('lapack' 'pybind11' 'python-numpy' 'python-scipy')
makedepends=('meson')
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

build() {
    arch-meson ${pkgname%-git} build
    meson compile -C build
}

package() {
  cd "$srcdir"
    DESTDIR="${pkgdir}" ninja -C build install
}
