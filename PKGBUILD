# Maintainer: Horace Liu <im.liuhq@gmail.com>

pkgname=which-key-wayland
pkgver=0.2.1
pkgrel=1
pkgdesc="About A key-hint panel for Wayland, inspired by the Neovim plugin which-key.nvim and the Helix editor style"
arch=('x86_64')
url="https://github.com/liuhq/which-key.wayland"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('dd87a94fa7f7eec1fcfaf89972fdb7fb003b4b53e958cbb186b327ee5ab8af9b')
makedepends=(rust)
depends=(libxkbcommon)
options=(!debug)

prepare() {
  mv which-key.wayland-$pkgver $pkgname-$pkgver
  cd $pkgname-$pkgver

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
}

build() {
  cd $pkgname-$pkgver

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --frozen --all-features --package $pkgname
}

check() {
  cd $pkgname-$pkgver

  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features --package $pkgname
}

package() {
  cd $pkgname-$pkgver

  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
