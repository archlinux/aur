# Maintainer: Jeff Dickey <releases at rtx dot pub>

pkgname=rtx
pkgver=1.34.2
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
sha512sums=('7fa9b9056ea72f6346a3187adb313567042710382353a7dcd3ef8784baca7553a59ddc0c0706242328b66a1adee4281a712a2b0c29dc30813382de5ffb034e05')

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
