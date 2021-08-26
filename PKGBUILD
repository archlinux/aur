# Maintainer: Thorben Günther <echo YWRtaW5AeGVucm94Lm5ldAo= | base64 -d>

pkgname=steamguard-cli
pkgver=0.4.0
pkgrel=1
pkgdesc="A linux utility for generating 2FA codes for Steam and managing Steam trade confirmations."
arch=('x86_64')
url='https://github.com/dyc3/steamguard-cli'
license=('GPL3')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dyc3/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9e0e0e47672f0ad4a7b2df7e4ecbb614afcfdcff33821f331572dc7e3c5c4204')


prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features

    # completion
    "target/release/$pkgname" completion --shell bash > "$srcdir/$pkgname-$pkgver/$pkgname"
    "target/release/$pkgname" completion --shell zsh > "$srcdir/$pkgname-$pkgver/_$pkgname"
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    # NOTE: Install as steamguard, otherwise completions won't work
    install -Dm0755 "target/release/$pkgname" "$pkgdir/usr/bin/steamguard"
    install -Dm0644 -t "$pkgdir/usr/share/bash-completion/completions/" "$pkgname"
    install -Dm0644 -t "$pkgdir/usr/share/zsh/site-functions/" "_$pkgname"
}
