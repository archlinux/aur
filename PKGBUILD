# Maintainer: Jeff Dickey <releases at mise dot jdx dot dev>

pkgname=mise
pkgver=2025.1.9
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
sha512sums=('23a353077576b836306b74fca2a67e708f773258ae9c505e27aa97f3491fb6f5f7f35fdba54718aaca2c4ed5453bee8210a3cd4fce5cf323ab687df0d372bbee')
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
  install -Dm644 completions/mise.fish "$pkgdir/usr/share/fish/vendor_completions.d/mise.fish"
  install -Dm644 completions/_mise "$pkgdir/usr/share/zsh/site-functions/_mise"
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  ./target/release/mise --version
}
