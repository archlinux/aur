# Maintainer: Rico Riedel <rico dot riedel at protonmail dot ch>

pkgname=nonogram-cli
pkgver=2.2.0
pkgrel=0
pkgdesc='A fast command-line based nonogram solver.'
url='https://github.com/ricoriedel/nonogram-rs'
arch=(x86_64)
license=(GPL3)
makedepends=(cargo)
source=(nonogram-rs-2.2.0.tar.gz::https://github.com/ricoriedel/nonogram-rs/archive/refs/tags/v2.2.0.tar.gz
        nonogram-rs-2.2.0.tar.gz.sig::https://github.com/ricoriedel/nonogram-rs/releases/download/v2.2.0/nonogram-rs-2.2.0.tar.gz.sig)
b2sums=(d22d8003c7b2fe23ff478ec363afce3327825807719ce4a1b5f2c802fa7ee72e0f3f539443aef8b4ddf8f473a9daf1f034c0579df93cdf27489b9aebb79400e1
        ff7cd5c1c29867422499f71b9546566ef4673cc8331e9e27dffdf01743e254693e57ab4dc680b4dc73e5adcf13bc7de4bee06379efabda00de58973afccef4c0)
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
