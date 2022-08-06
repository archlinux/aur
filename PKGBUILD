# Maintainer: Rico Riedel <rico dot riedel at protonmail dot ch>

pkgname=wipe-term
pkgver=2.0.0
pkgrel=1
pkgdesc='Wipe the content of your terminal with a random animation.'
url='https://github.com/ricoriedel/wipe'
arch=(x86_64)
license=(MIT)
makedepends=(cargo)
conflicts=(wipe)
source=(wipe-2.0.0.tar.gz::https://github.com/ricoriedel/wipe/archive/refs/tags/v2.0.0.tar.gz
        wipe-2.0.0.tar.gz.sig::https://github.com/ricoriedel/wipe/releases/download/v2.0.0/wipe-2.0.0.tar.gz.sig)
b2sums=(d53786c64a7b730d06ddb3402c7a4d321bdc0458b87a62195b1fba14a6bc3c8808a6b1712fbc6f9a548cae104f738d692deb25f346c12d7560f52a9f74e04e19
        4c6a3606010d3f2aed7be942efc0d782b1f70692301ce57788160881f187857b0c24cecae115b0343e9294527d86c8e782f6c4698d3c54b8712a0530bf2c9f13)
validpgpkeys=(F9A7D7F04CF97BE30275A9BA75AC868575DE7B18)

prepare() {
    cd "wipe-$pkgver"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "wipe-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "wipe-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "wipe-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" 'target/release/wipe'
    install -Dm0644 -t "$pkgdir/usr/share/licenses/wipe/" 'LICENSE'
    install -Dm0644 -t "$pkgdir/usr/share/zsh/plugins/wipe/" 'misc/wipe.zsh'
}
