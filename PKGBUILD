# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=wayprompt
pkgver=0.1.2
pkgrel=1
pkgdesc='Multi-purpose prompt tool for Wayland (pinentry)'
arch=(x86_64)
url='https://git.sr.ht/~leon_plickat/wayprompt'
license=(GPL3)
depends=(
  fcft
  libxkbcommon
  pixman
  wayland
)
makedepends=(
  git
  wayland-protocols
  zig
)
source=(
  git+https://git.sr.ht/~leon_plickat/wayprompt#tag=v${pkgver}
)
b2sums=('5c279a375d23cd700ec81f3eb1a9ad3ed35c982ff9ef4b2b247deb1d6e11493c9c52bf6f2f81aa4b932c683c7155c85a085f55d2736c3a6020cd2c9b056dcbb6')

prepare() {
  zig fetch --global-cache-dir ./zig-global-cache "https://codeberg.org/ifreund/zig-pixman/archive/v0.2.0.tar.gz"
  zig fetch --global-cache-dir ./zig-global-cache "https://codeberg.org/ifreund/zig-wayland/archive/v0.2.0.tar.gz"
  zig fetch --global-cache-dir ./zig-global-cache "https://codeberg.org/ifreund/zig-xkbcommon/archive/v0.2.0.tar.gz"
  zig fetch --global-cache-dir ./zig-global-cache "https://git.sr.ht/~leon_plickat/zig-ini/archive/879c74a3a801d49fa34343aebd55a22f591899b3.tar.gz"
  zig fetch --global-cache-dir ./zig-global-cache "https://git.sr.ht/~leon_plickat/zig-spoon/archive/fdba8e643c9558254bf4e6c600dfbd782fa7a267.tar.gz"
  zig fetch --global-cache-dir ./zig-global-cache "https://git.sr.ht/~novakane/zig-fcft/archive/1.1.0.tar.gz"
  zig fetch --global-cache-dir ./zig-global-cache "https://git.sr.ht/~novakane/zig-fcft/archive/1.1.0.tar.gz"
}

build() {
  cd ${pkgname}
  DESTDIR="build" zig build \
    --summary all \
    --prefix /usr \
    --search-prefix /usr \
    --global-cache-dir ../zig-global-cache \
    --system ../zig-global-cache/p \
    -Dtarget=native-linux.6.1-gnu.2.38 \
    -Dcpu=baseline \
    -Doptimize=ReleaseSafe \
    -Dpie
}

package() {
  cd ${pkgname}
  mv -v build/* "${pkgdir}"
}
