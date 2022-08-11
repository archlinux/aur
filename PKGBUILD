# Maintainer: Your Name <youremail@domain.com>
pkgname=colorfulgtk-git
_pkgname=Colorful
pkgver=r14.7e54944
pkgrel=1
pkgdesc="Pick a color from your screen, use it wherever you want."
arch=('x86_64' 'aarch64')
url="https://github.com/Diego-Ivan/Colorful"
license=('GPL3')
depends=('libadwaita' 'libportal-gtk4')
makedepends=('git' 'meson' 'vala')
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
  meson test -C build || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
