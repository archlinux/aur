# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=spedread-git
_pkgname=Spedread
pkgver=r105.fa641a7
pkgrel=1
pkgdesc="GTK speed reading software: Read like a speedrunner!"
arch=('x86_64')
url="https://github.com/Darazaki/Spedread"
license=('GPL3')
depends=('libadwaita')
makedepends=('git' 'meson' 'vala')
checkdepends=('appstream-glib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+$url.git)
b2sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  arch-meson "$_pkgname" build
  meson compile -C build
}

check() {
  meson test -C build || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
