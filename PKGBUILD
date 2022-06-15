# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=rnote-git
pkgver=r953.6bb6de8
pkgrel=1
pkgdesc="A simple drawing application to create handwritten notes"
arch=('x86_64')
url="https://github.com/flxzt/rnote"
license=('GPL3')
depends=('libadwaita' 'poppler-glib' 'gstreamer' 'alsa-lib')
makedepends=('git' 'meson' 'cargo')
checkdepends=('appstream-glib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(
  "git+$url.git"
  "git+https://github.com/flxzt/piet.git"
)
b2sums=('SKIP'
        'SKIP')
options=('!lto')

prepare() {
  cd "${pkgname%-git}"
  git submodule init
  git config submodule."piet".url "${srcdir}"/piet
  git submodule update --init --recursive
}

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
