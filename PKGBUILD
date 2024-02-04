# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=wayprompt
pkgver=0.1.0
pkgrel=1
pkgdesc='Multi-purpose prompt tool for Wayland (pinentry)'
url='https://git.sr.ht/~leon_plickat/wayprompt'
license=(GPL3)
depends=(fcft libxkbcommon pixman wayland)
makedepends=(git wayland-protocols zig)
arch=(x86_64)
source=(
    git+https://git.sr.ht/~leon_plickat/wayprompt#tag=v${pkgver}
    git+https://git.sr.ht/~novakane/zig-fcft
    git+https://github.com/ifreund/zig-pixman.git
    git+https://github.com/ifreund/zig-xkbcommon.git
    git+https://github.com/ifreund/zig-wayland.git
)
b2sums=('SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP')

prepare() {
  cd ${pkgname}
  git submodule init
  git config submodule."deps/zig-wayland".url "${srcdir}/zig-wayland"
  git config submodule."deps/zig-pixman".url "${srcdir}/zig-pixman"
  git config submodule."deps/zig-xkbcommon".url "${srcdir}/zig-xkbcommon"
  git config submodule."deps/zig-fcft".url "${srcdir}/zig-fcft"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd ${pkgname}
  DESTDIR="build" zig build \
    --prefix /usr \
    --search-prefix /usr \
    -Dtarget=native-linux.5.15-gnu.2.37 \
    -Dcpu=baseline \
    -Doptimize=ReleaseSafe \
    -Dpie=true
}

package() {
  cd ${pkgname}
  mv -v build/* "${pkgdir}"
}
