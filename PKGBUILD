# Maintainer: Jeff Dickey <releases at rtx dot pub>

pkgname=rtx
pkgver=2023.11.4
pkgrel=1
pkgdesc='Polyglot runtime manager'
arch=('x86_64')
url='https://github.com/jdx/rtx'
license=('MIT')
makedepends=('cargo')
provides=('rtx')
conflicts=('rtx-bin')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jdx/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('b5fbfe691459333b14330c52828a08aebf7ce88c14c7710f0ed8906742400bb4dc6eb57ece9815b61ecfe3c84a1712634fbc9188e07ed993c22b48b9d0aba094')

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
