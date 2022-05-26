# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=passes-git
pkgver=r115.c035c41
pkgrel=1
pkgdesc="A digital pass manager"
arch=('any')
url="https://github.com/pablo-s/passes"
license=('GPL3')
depends=('libadwaita' 'zint')
makedepends=('git' 'meson' 'blueprint-compiler')
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
