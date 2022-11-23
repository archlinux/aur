# Maintainer: Rico Riedel <rico dot riedel at protonmail dot ch>

pkgname=wipe-term
pkgver=2.1.0
pkgrel=0
pkgdesc='Wipe the content of your terminal with a random animation.'
url='https://github.com/ricoriedel/wipe'
arch=(x86_64)
license=(MIT)
makedepends=(cargo)
conflicts=(wipe)
source=(wipe-2.1.0.tar.gz::https://github.com/ricoriedel/wipe/archive/refs/tags/v2.1.0.tar.gz
        wipe-2.1.0.tar.gz.sig::https://github.com/ricoriedel/wipe/releases/download/v2.1.0/wipe-2.1.0.tar.gz.sig)
b2sums=(a01db973a5f0ad89deca2b0817345362bd72d1f9022495ad8bba757331dd613df0fff0615035f932d943eec64df3463997424fd80508430c3e376b339c51c3e0
        e4a033c63f9fd979b7ecca8e419dc94fb340ef682ac7fddae84273d04c4a9bfa22a7aef1672ad7bc007e3adf1f79f5c257fe1f3c0916365dcd29270ca006924c)
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
