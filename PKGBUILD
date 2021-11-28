# Maintainer: Funami
pkgname=bins-git
pkgver=v2.0.0.r9.gd91d94e
pkgrel=1
pkgdesc="A tool for pasting from the terminal"
arch=('x86_64')
url="https://github.com/ascclemens/bins"
license=('MPL2')
provides=('bins')
conflicts=('bins')
depends=('file' 'libxcb')
makedepends=('cargo-nightly')
source=("$pkgname-$pkgver::git+https://github.com/ascclemens/bins.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname-$pkgver"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=nightly-2019-09-25
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --no-default-features --features rustls,file_type_checking,clipboard_support
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/bins" -t "$pkgdir/usr/bin"
}
