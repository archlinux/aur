# Maintainer: Daurnimator <daurnimator@archlinux.org>

pkgname="river-git"
pkgver=r577.3c1f1df
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
        'git+https://github.com/ifreund/zig-xkbcommon.git'
        'libc.patch')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'c3e9c81dd61a7b9e333791dd368b7bd9ec7270a0415c04a2adf578c95ed853e2')

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

  # Workaround https://github.com/ziglang/zig/issues/8144
  # See https://github.com/ifreund/river/issues/232#issuecomment-794067079
  zig libc > libc-paths
  patch -p1 < ../libc.patch
}

build() {
  cd river
  zig build \
    --search-prefix "/usr" \
    -Dtarget=x86_64-linux-gnu \
    -Drelease-safe \
    -Dxwayland \
    -Dman-pages
}

package() {
  backup=('etc/river/init')

  cd river
  DESTDIR="${pkgdir}" zig build \
    --prefix "/usr" \
    --search-prefix "/usr" \
    -Dtarget=x86_64-linux-gnu \
    -Drelease-safe \
    -Dxwayland \
    -Dman-pages \
    install
}
