# Maintainer: Jeff Dickey <releases at rtx dot pub>

pkgname=rtx
pkgver=1.35.2
pkgrel=1
pkgdesc='Polyglot runtime manager'
arch=('x86_64')
url='https://github.com/jdxcode/rtx'
license=('MIT')
makedepends=('cargo')
provides=('rtx')
conflicts=('rtx-bin')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jdxcode/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('b629036d033402d7e3e0225b857c2c57506ac51e48a04af4cfa22886f5ec8d76903d9fb41da2b987a6f9a7cdd309432af323997a96ebffbe49e9ad15df079b72')

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
    install -Dm755 target/release/rtx "$pkgdir/usr/bin/rtx"
    install -Dm644 man/man1/rtx.1 "$pkgdir/usr/share/man/man1/rtx.1"
    install -Dm644 completions/rtx.bash "$pkgdir/usr/share/bash-completion/completions/rtx"
    install -Dm644 completions/rtx.fish "$pkgdir/usr/share/fish/completions/rtx.fish"
    install -Dm644 completions/_rtx "$pkgdir/usr/share/zsh/site-functions/_rtx"
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    ./target/release/rtx --version
}
