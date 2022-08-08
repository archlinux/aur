# Maintainer: Your Name <youremail@domain.com>

pkgname=bluetype-git
pkgver=r31.1bd524e
pkgrel=1
pkgdesc="A fast and lightweight word processor"
arch=('x86_64' 'aarch64')
url="https://github.com/mjakeman/bluetype"
license=('MPL2')
depends=('libadwaita' 'text-engine')
makedepends=('git' 'blueprint-compiler' 'meson')
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
