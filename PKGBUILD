# Maintainer: Rico Riedel <rico dot riedel at protonmail dot ch>

pkgname=nonogram-cli
pkgver=2.1.0
pkgrel=1
pkgdesc='A fast command-line based nonogram solver.'
url='https://github.com/ricoriedel/nonogram-rs'
arch=(x86_64)
license=(GPL3)
makedepends=(cargo)
source=(nonogram-rs-2.1.0.tar.gz::https://github.com/ricoriedel/nonogram-rs/archive/refs/tags/v2.1.0.tar.gz
        nonogram-rs-2.1.0.tar.gz.sig::https://github.com/ricoriedel/nonogram-rs/releases/download/v2.1.0/nonogram-rs-2.1.0.tar.gz.sig)
b2sums=(db8d9ffc6765dc765727309200f2037da5729b38193bf49b364a658b278f8b43ba7c3269f437747ba564fa08c7482ae623092281a6b897153a7135fb18bb93ec
        f57bc01a8d5c5c4215083a381262db31b973f5047e0eb6e80eb693c1a23beed70b22fc3e0be8fa1d059f135bd965cd7b052d02a577ce203b61d79c8c54707715)
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
