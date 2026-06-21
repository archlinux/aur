# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cosmic-workspaces-git
pkgver=1.0.16.r0.g5e62de1
pkgrel=1
pkgdesc="Cosmic workspaces"
arch=('x86_64' 'aarch64')
url="https://github.com/pop-os/cosmic-workspaces-epoch"
license=('GPL-3.0-only')
depends=(
  'cosmic-icons-git'
  'libinput'
  'libxkbcommon'
  'mesa'
  'wayland'
)
makedepends=(
  'cargo'
  'git'
  'mold'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/pop-os/cosmic-workspaces-epoch.git'
        'lto.patch')
sha256sums=('SKIP'
            '10767b42a2663dac030cef95635896755bda22ed91c6f4e3ad705f99080ee47c')

pkgver() {
  cd "${pkgname%-git}-epoch"
  git describe --long --tags --abbrev=7 | sed 's/^epoch-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}-epoch"

  # use thin LTO profile
  patch -Np1 -i ../lto.patch

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
}

build() {
  cd "${pkgname%-git}-epoch"
  export RUSTUP_TOOLCHAIN=stable

  # use mold instead of lld to speed up build
  RUSTFLAGS+=" -C link-arg=-fuse-ld=mold"

  # use nice to build with lower priority
  nice make ARGS+=" --frozen --release"
}

package() {
  cd "${pkgname%-git}-epoch"
  make prefix='/usr' DESTDIR="$pkgdir" install
}
