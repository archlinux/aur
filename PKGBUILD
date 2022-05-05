# Maintainer: Your Name <youremail@domain.com>
pkgname=citations-git
pkgver=0.1.0
pkgrel=1
pkgdesc="Manage your bibliographies using the BibTeX format"
arch=('x86_64')
url="https://gitlab.gnome.org/msandova/citations"
license=('GPL3')
depends=('glib2' 'libadwaita-git')
makedepends=('git' 'meson' 'rust')
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
  meson test -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
