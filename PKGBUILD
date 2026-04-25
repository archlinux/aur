# Maintainer: Simon Ser <contact@emersion.fr>

pkgname=keulim-git
pkgver=r35.121d0c5
pkgrel=1
pkgdesc='A simple image C library'
url='https://gitlab.freedesktop.org/emersion/keulim'
arch=('x86_64')
license=('MIT')
source=("git+$url.git")
sha1sums=('SKIP')
depends=(libpng librsvg ffmpeg)
makedepends=(git meson ninja cargo)
conflicts=(keulim)
provides=(keulim keulim.so)

pkgver() {
  # TODO: switch to tag once an initial release is shipped
  #git -C keulim describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
  cd keulim
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  export RUSTUP_TOOLCHAIN=stable
  cd keulim/rust
  cargo fetch --locked --target host-tuple
}

build() {
  arch-meson keulim build
  ninja -C build
}

check() {
  ninja -C build test
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" "keulim/LICENSE"
}
