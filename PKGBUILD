# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=warp-share-files-git
_pkgname=warp
pkgver=0.1.2.r108.g917f435
pkgrel=1
pkgdesc="Share files with each other effortlessly"
arch=('x86_64')
url="https://gitlab.gnome.org/World/warp"
license=('GPL3')
depends=('glib2' 'libadwaita' 'magic-wormhole')
makedepends=('git' 'meson' 'rust' 'itstool')
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

#check() {
#  meson test -C build
#}

package() {
  meson install -C build --destdir "$pkgdir"
}
