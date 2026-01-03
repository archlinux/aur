# Maintainer: Mark Karlinsky <mark.devnull@gmail.com>
# Contributor: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=xwayland-satellite-nosystemd
pkgver=0.8
pkgrel=1
pkgdesc="Xwayland outside your Wayland (without systemd feature)"
arch=(x86_64)
url="https://github.com/Supreeeme/xwayland-satellite"
license=('MPL-2.0')
depends=(
  'libxcb'
  'xcb-util-cursor'
  'xorg-xwayland'
  'gcc-libs'
  'glibc'
)
makedepends=(
  'git'
  'cargo'
  'clang'
)
provides=("xwayland-satellite=$pkgver")
conflicts=("xwayland-satellite")
options=()
_tag=dacdbc61e427cf8e06d6cdf435eee08df2f054e3 # git rev-parse v${pkgver}
source=("git+${url}.git#tag=${_tag}")
sha256sums=('cc1347fd78590a03c46027a2372a1e3de7c25cc0d2b770115f44782cbac1dea8')

prepare() {
  cd "$srcdir/xwayland-satellite"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_HOME="$(pwd)/.cargo"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$srcdir/xwayland-satellite"
  export RUSTFLAGS="--remap-path-prefix=$srcdir=/"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_HOME="$(pwd)/.cargo"
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "$srcdir/xwayland-satellite"
  install -Dm755 "target/release/xwayland-satellite" -t "$pkgdir/usr/bin/"
}
