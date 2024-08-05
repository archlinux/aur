# Maintainer: Nick Dowsett <nickdowsett42@gmail.com>

pkgname=youtui
pkgver=0.0.11
pkgrel=1
pkgdesc="A simple TUI YouTube Music player written in Rust aiming to implement an Artist->Albums workflow for searching for music, and using discoverability principles for navigation."
url="https://github.com/nick42d/youtui"
arch=('x86_64' 'armv7h' 'aarch64')
license=('MIT')
depends=('alsa-lib')
makedepends=('cargo' 'base-devel')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('e98a301d892df4d21828a69350564c2d1b9c2c7f2f272cd6520fca119302e4b0')
# Workarond for Ring bug https://github.com/briansmith/ring/issues/1444
# More info: https://gitlab.archlinux.org/archlinux/packaging/packages/pacman/-/issues/20
options=(!lto)

prepare() {
  cd $pkgname-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd $pkgname-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd $pkgname-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd $pkgname-$pkgver
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
