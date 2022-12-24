# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=didyoumean
pkgver=1.1.4
pkgrel=1
pkgdesc="A CLI spelling corrector"
arch=('x86_64')
url="https://github.com/hisbaan/didyoumean"
license=('GPL3')
depends=('gcc-libs' 'libxcb' 'openssl')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('317daa601d3b6e0696faac47b8b3cdbda6ff3efafe859189afaa1cad1290a0a0069504b67c3d1a75bec4c42ec1008e5daf485f124c60e77d3c8c38e12616adc0')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --frozen
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --frozen --lib
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 target/release/dym -t "$pkgdir/usr/bin"
  install -Dm 644 docs/README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 man/dym.1 -t "$pkgdir/usr/share/man/man1/"
  install -Dm 644 completions/dym.bash -t "$pkgdir/usr/share/bash-completion/completions/"
  install -Dm 644 completions/dym.fish -t "$pkgdir/usr/share/fish/vendor_completions.d/"
  install -Dm 644 completions/_dym -t "$pkgdir/usr/share/zsh/site-functions/"
}
