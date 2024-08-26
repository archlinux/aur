# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=wayprompt-git
pkgver=0+91+66fe874
pkgrel=1
pkgdesc='Multi-purpose prompt tool for Wayland (pinentry)'
arch=(x86_64)
url='https://git.sr.ht/~leon_plickat/wayprompt'
license=(GPL3)
depends=(fcft libxkbcommon pixman wayland )
makedepends=(git wayland-protocols zig)
conflicts=(wayprompt)
source=(
    git+https://git.sr.ht/~leon_plickat/wayprompt
)
b2sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  printf "0+%s+%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

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
  cd ${pkgname%-git}
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
  cd ${pkgname%-git}
  mv -v build/* "${pkgdir}"
}
