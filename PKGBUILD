# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=libdisplay-info-git
pkgver=r163.ac857e8985
pkgrel=1
pkgdesc='EDID and DisplayID library'
url='https://gitlab.freedesktop.org/emersion/libdisplay-info'
arch=('x86_64')
license=('MIT')
source=("git+$url")
sha1sums=('SKIP')
makedepends=(git meson ninja python)
checkdepends=(edid-decode)
depends=(hwdata)
conflicts=(libdisplay-info)
provides=(libdisplay-info)

pkgver() {
  cd libdisplay-info
  set -o pipefail
  git describe --tags --abbrev=10 | sed 's/^v//; s/-/+/; s/-/./' 2>/dev/null ||
  printf 'r%d.%s' \
    $(git rev-list --count HEAD) \
    $(git rev-parse --short=10 HEAD)
}

build() {
  arch-meson libdisplay-info build
  ninja -C build
}

check() {
  ninja -C build gen-test-data
  ninja -C build test
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}
