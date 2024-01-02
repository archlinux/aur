# Maintainer: Jeff Dickey <releases at rtx dot pub>

pkgname=mise
pkgver=2024.0.0
pkgrel=1
pkgdesc='Polyglot runtime manager'
arch=('x86_64')
url='https://github.com/jdx/mise'
license=('MIT')
makedepends=('cargo')
provides=('mise')
conflicts=('mise-bin')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jdx/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('1d0f4785eaa79865139998430402c28320d1d6c762169e9bf49ed228af77d690d3a8db13713130be6126ae4901308c5746fff01299cd265b4728b980d791a561')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 target/release/mise "$pkgdir/usr/bin/mise"
  install -Dm644 man/man1/mise.1 "$pkgdir/usr/share/man/man1/mise.1"
  install -Dm644 completions/mise.bash "$pkgdir/usr/share/bash-completion/completions/mise"
  install -Dm644 completions/mise.fish "$pkgdir/usr/share/fish/completions/mise.fish"
  install -Dm644 completions/_mise "$pkgdir/usr/share/zsh/site-functions/_mise"
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  ./target/release/mise --version
}
