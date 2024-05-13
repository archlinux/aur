# Maintainer: Jeff Dickey <releases at mise dot jdx dot dev>

pkgname=mise
pkgver=2024.5.11
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
sha512sums=('495e6717d16348f24484c0096f188c53c8d7ce3b09d197d086afef2bd190ab0eefb47f088a738cec71aec4a5658b08bcdb7bbf3ca17a656a38391eb66142ccdb')
optdepends=('usage: completion support')

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
