# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=wayprompt-git
pkgver=0+33+916a8df
pkgrel=1
pkgdesc='Multi-purpose prompt tool for Wayland (pinentry, himitsu)'
url='https://git.sr.ht/~leon_plickat/wayprompt'
license=(GPL3)
depends=(fcft libxkbcommon pixman wayland )
makedepends=(git wayland-protocols zig)
arch=(x86_64)
source=(
    git+https://git.sr.ht/~leon_plickat/wayprompt
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

pkgver() {
  cd ${pkgname%-git}
  printf "0+%s+%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${pkgname%-git}
  git submodule init
  git config submodule."deps/zig-wayland".url "${srcdir}/zig-wayland"
  git config submodule."deps/zig-pixman".url "${srcdir}/zig-pixman"
  git config submodule."deps/zig-xkbcommon".url "${srcdir}/zig-xkbcommon"
  git config submodule."deps/zig-fcft".url "${srcdir}/zig-fcft"
  git submodule update
}

build() {
    cd ${pkgname%-git}
    zig build
}

package() {
    cd ${pkgname%-git}
    install -Dm755 zig-out/bin/wayprompt "${pkgdir}"/usr/bin/wayprompt
}

