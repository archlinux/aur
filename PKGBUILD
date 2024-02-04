# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=wayprompt-git
pkgver=0+76+d6f28ee
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
    git+https://git.sr.ht/~novakane/zig-fcft
    git+https://git.sr.ht/~leon_plickat/zig-spoon
    git+https://github.com/ifreund/zig-pixman.git
    git+https://github.com/ifreund/zig-xkbcommon.git
    git+https://github.com/ifreund/zig-wayland.git
)
b2sums=('SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP')

pkgver() {
  cd ${pkgname%-git}
  printf "0+%s+%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${pkgname%-git}
  git submodule init
  git config submodule."deps/zig-wayland".url "${srcdir}/zig-wayland"
  git config submodule."deps/zig-pixman".url "${srcdir}/zig-pixman"
  git config submodule."deps/zig-spoon".url "${srcdir}/zig-spoon"
  git config submodule."deps/zig-xkbcommon".url "${srcdir}/zig-xkbcommon"
  git config submodule."deps/zig-fcft".url "${srcdir}/zig-fcft"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd ${pkgname%-git}
  DESTDIR="build" zig build \
    --prefix /usr \
    --search-prefix /usr \
    -Dtarget=native-linux.5.15-gnu.2.37 \
    -Dcpu=baseline \
    -Doptimize=ReleaseSafe \
    -Dpie=true
}

package() {
  cd ${pkgname%-git}
  mv -v build/* "${pkgdir}"
}
