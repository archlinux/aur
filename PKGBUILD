# Maintainer: Jeff Dickey <releases at mise dot jdx dot dev>

pkgname=mise
pkgver=2024.2.19
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
sha512sums=('28d631c638928fce904cd40403231e1d413bbf7fe5f5f0952a2884d3744a3edcf7e4106bc8ab50e687b653d39f489cfd8bc59446e0bfb5602fabe807c70d7894')

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
