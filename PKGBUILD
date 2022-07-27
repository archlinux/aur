# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=hypatia-git
pkgver=r27.19b2d98
pkgrel=1
pkgdesc="A research helper tool that provides context and information about interesting topics."
arch=('x86_64' 'aarch64')
url="https://github.com/HypatiaProject/hypatia"
license=('GPL3')
depends=('libadwaita' 'libgee' 'libsoup3' 'json-glib')
makedepends=('git' 'meson' 'gobject-introspection' 'vala')
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
  arch-meson "${pkgname%-git}" build
  meson compile -C build
}

check() {
  meson test -C build || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
