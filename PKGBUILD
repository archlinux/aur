# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=shortwave-git
pkgver=r215.b28ab0d
pkgrel=1
pkgdesc="Find and listen to internet radio stations"
arch=(i686 x86_64 armv6h armv7h)
url="https://gitlab.gnome.org/World/Shortwave"
license=(GPL3)
depends=(gstreamer
         libhandy)
makedepends=(cargo
             git
             gobject-introspection
             libdazzle
             libhandy
             meson
             rust)
provides=(shortwave)
conflicts=(shortwave)
source=("git+https://gitlab.gnome.org/World/Shortwave.git")
sha256sums=('SKIP')

pkgver() {
  cd Shortwave
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  arch-meson Shortwave build
  ninja -C build
}

check() {
  ninja -C build test
}

package() {
  DESTDIR="$pkgdir/" ninja -C build install
}
