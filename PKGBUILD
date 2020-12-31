# Maintainer: Daurnimator <daurnimator@archlinux.org>

pkgname="river-git"
pkgver=r522.c143864
pkgrel=1
pkgdesc='A dynamic tiling wayland compositor.'
arch=('x86_64')
url='https://github.com/ifreund/river'
license=('GPL3')
depends=('libevdev' 'libxkbcommon' 'pixman' 'wlroots')
makedepends=('git' 'scdoc' 'wayland-protocols' 'zig')
provides=('river')
conflicts=('river')
source=('git+https://github.com/ifreund/river.git'
        'git+https://github.com/ifreund/zig-pixman.git'
        'git+https://github.com/ifreund/zig-wayland.git'
        'git+https://github.com/swaywm/zig-wlroots.git'
        'git+https://github.com/ifreund/zig-xkbcommon.git')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd river
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd river
  git submodule init
  git config submodule.deps/zig-pixman.url "${srcdir}/zig-pixman"
  git config submodule.deps/zig-wayland.url "${srcdir}/zig-wayland"
  git config submodule.deps/zig-wlroots.url "${srcdir}/zig-wlroots"
  git config submodule.deps/zig-xkbcommon.url "${srcdir}/zig-xkbcommon"
  git submodule update
}

build() {
  cd river
  zig build \
    -Drelease-safe \
    -Dxwayland \
    -Dman-pages
}

package() {
  backup=('etc/river/init')

  cd river
  DESTDIR="${pkgdir}" zig build --prefix "/usr" \
    -Drelease-safe \
    -Dxwayland \
    -Dman-pages \
    install
}
