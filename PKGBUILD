# Maintainer: Keon Cachia <keonfarrugia@gmail.com>
pkgname=canoe
pkgver=0.5.1
pkgrel=1
pkgdesc="Stacking window manager for River inspired by Windows 3.x"
arch=('x86_64')
url="https://github.com/roblillack/canoe"
license=('MIT')
depends=('river' 'freetype2' 'libgcc' 'libxkbcommon' 'glibc' 'fontconfig')
optdepends=(
  'fuzzel: Default launcher'
  'foot: Default terminal emulator'
  'swaylock: Default screen locker'
)
# It seems unable to strip debug symbols and it just leads to an empty debug package as well
options=('!debug' '!strip')
makedepends=('cargo-nightly')
install=canoe.install
source=(
  canoe-$pkgver::https://github.com/roblillack/canoe/archive/refs/tags/v"$pkgver".tar.gz
)
sha256sums=('88d9aa20d6e663b6d6efe8e51c575e3dfbbfca47f39e5553239d2a777b4fb460')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=nightly
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=nightly
  export CARGO_TARGET_DIR=target
  cargo build --release --frozen --all-features
}
check() {
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=nightly
  cargo test --frozen --all-features
}
package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"

  install -Dm0744 -t "$pkgdir/usr/share/licenses/$pkgname/" "LICENSE"
}

# vim:set ts=2 sw=2 et:
