# Maintainer: Jeff Dickey <releases at mise dot jdx dot dev>

pkgname=mise
pkgver=2024.3.7
pkgrel=1
pkgdesc='The front-end to your dev env'
arch=('x86_64')
url='https://github.com/jdx/mise'
license=('MIT')
makedepends=('cargo')
provides=('mise')
conflicts=('rtx' 'rtx-bin')
replaces=('rtx')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jdx/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('5f60bb188ad0a0d4db5ef046c477d513dfeada314c350bb88fac1d0ae2fe457ece028743d70beffd3d48b309c3c10136fbf01626e6b7f4b1d8f1a5993b5a9146')

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
