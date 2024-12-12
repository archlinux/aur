# Maintainer: Mark Karlinsky <mark.devnull@gmail.com>
# Contributor: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=xwayland-satellite-nosystemd
pkgver=0.5
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
_tag=5c7fe006d2e3617c9649f71f571e06c0e2158ba6
source=("git+${url}.git#tag=${_tag}")
sha256sums=("da5d99a013a835527f02a6bab07684273b71145076f41ecc5f118fbaddbb72d9")

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
