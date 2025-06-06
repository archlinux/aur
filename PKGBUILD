# Maintainer: Nick Dowsett <nick42d at gmail dot com>

pkgname=openscad-lsp
pkgver=2.0.1
pkgrel=1
pkgdesc="A LSP server for OpenSCAD"
arch=('i686' 'x86_64')
url="https://github.com/Leathong/openscad-LSP"
keywords=('cad' 'lsp')
license=('Apache-2.0')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('4b515451d2d54837b5556d83cdfdb494901ef9ca18a3ec9821b7eb01d282825f')
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
