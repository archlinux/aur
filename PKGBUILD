# Maintainer: Daurnimator <daurnimator@archlinux.org>

pkgname="river-git"
pkgver=r476.2b24e55
pkgrel=1
pkgdesc='A dynamic tiling wayland compositor.'
arch=('x86_64')
url='https://github.com/ifreund/river'
license=('GPL3')
depends=('wlroots')
makedepends=('git' 'scdoc' 'wayland-protocols' 'zig')
provides=('river')
conflicts=('river')
source=('git+https://github.com/ifreund/river.git'
        'git+https://github.com/ifreund/zig-wayland.git')
md5sums=('SKIP'
         'SKIP')

pkgver() {
  cd river
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd river
  git submodule init
  git config submodule.deps/zig-wayland.url "${srcdir}/zig-wayland"
  git submodule update
}

build() {
  cd river
  zig build -Drelease-safe -Dxwayland
}

package() {
  cd river
  zig build -Drelease-safe -Dxwayland --prefix "${pkgdir}/usr" install
}
