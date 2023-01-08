# Maintainer: Rico Riedel <rico dot riedel at protonmail dot ch>

pkgname=nonogram-cli
pkgver=2.2.1
pkgrel=0
pkgdesc='A fast command-line based nonogram solver.'
url='https://github.com/ricoriedel/nonogram-rs'
arch=(x86_64)
license=(GPL3)
makedepends=(cargo)
source=(nonogram-rs-2.2.1.tar.gz::https://github.com/ricoriedel/nonogram-rs/archive/refs/tags/v2.2.1.tar.gz
        nonogram-rs-2.2.1.tar.gz.sig::https://github.com/ricoriedel/nonogram-rs/releases/download/v2.2.1/nonogram-rs-2.2.1.tar.gz.sig)
b2sums=(1bda4a7aabf14efd341bde33d548b57535b1889bb440f0e444a32c5403dc46fba93508815e1de8ca18c41c1ea00dd0a5b4d9f57b2ef5febfcd04cf9fbcc45950
        b6692237bb7b57a794bed0f50d0b0af3a04b9d90a4e85423b85acbaab1d8138e1b804e0bca111b522ad69ece2a8c22bc954f5482f7254e8c60e5bc158aa7f271)
validpgpkeys=(CC38FB15A3F349D3E01757EDE8835756AADCBA00)

prepare() {
    cd "nonogram-rs-$pkgver"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "nonogram-rs-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --bin nonogram-cli --features='cli'
}

check() {
    cd "nonogram-rs-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "nonogram-rs-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/nonogram-cli"
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" 'LICENSE'
    install -Dm0644 -t "$pkgdir/usr/share/$pkgname" res/*
}
