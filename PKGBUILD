# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=didyoumean
pkgver=1.1.3
pkgrel=1
pkgdesc="A CLI spelling corrector"
arch=('x86_64')
url="https://github.com/hisbaan/didyoumean"
license=('GPL3')
depends=('gcc-libs' 'libxcb' 'openssl')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('b23b0c5ef1a984032461c1d5144b5162c87bed561e19e9bea6f059d282e1a482aa240e52b6a237e864d3bcca7ade8b46ef90452d51a1de3dc34761b69325f7ec')

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
