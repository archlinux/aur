# Maintainer: Nick Dowsett <nick42d at gmail dot com>

pkgname=openscad-lsp
pkgver=1.2.5
pkgrel=1
pkgdesc="A LSP server for OpenSCAD"
arch=('i686' 'x86_64')
url="https://github.com/Leathong/openscad-LSP"
keywords=('cad' 'lsp')
license=('Apache-2.0')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('a1ea8455e21e70c690f1946b39c94015f0e8f38107ed26064d9164c5fd68f6ed')
# This is the pre-existing lto/rust bug.
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
  cd "$pkgname-$pkgver"
  install -vDm755 -t "$pkgdir/usr/bin" target/release/openscad-lsp
}
