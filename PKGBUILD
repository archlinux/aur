# Maintainer: Mark Karlinsky <mark.devnull@gmail.com>
# Contributor: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=xwayland-satellite-nosystemd
pkgver=0.8.2
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
_tag=8d135d3b2854b30fd01ea6cd6c27e523dd50a839 # git rev-parse v${pkgver}
source=("git+${url}.git#tag=${_tag}")
sha256sums=('fcc2e476f5eb5ab3fbcc61fd3992b2a39144f63f3ae78a60cd5eac0383f09f98')

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
