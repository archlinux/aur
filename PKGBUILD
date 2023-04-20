# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=darkbar-git
pkgver=1.0.1.r14.g5d94eb8
pkgrel=1
pkgdesc="Darken application titlebars based on your preference"
arch=('x86_64' 'aarch64')
url="https://github.com/bluesabre/darkbar"
license=('GPL3')
conflicts=("${pkgname%-git}")
depends=('libhandy' 'libwnck3' 'libgee')
makedepends=('git' 'meson' 'vala')
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
  meson install -C build --destdir "${pkgdir}"
}
