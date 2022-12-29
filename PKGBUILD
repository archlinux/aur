# Maintainer: Rico Riedel <rico dot riedel at protonmail dot ch>

pkgname=wipe-term
pkgver=2.1.1
pkgrel=0
pkgdesc='Wipe the content of your terminal with a random animation.'
url='https://github.com/ricoriedel/wipe'
arch=(x86_64)
license=(MIT)
makedepends=(cargo)
conflicts=(wipe)
source=(wipe-2.1.1.tar.gz::https://github.com/ricoriedel/wipe/archive/refs/tags/v2.1.1.tar.gz
        wipe-2.1.1.tar.gz.sig::https://github.com/ricoriedel/wipe/releases/download/v2.1.1/wipe-2.1.1.tar.gz.sig)
b2sums=(ae37c1ff6e05478a03184a73192d4aac5c6c7e85b1965123aaacd6bf0f07a691e673a092d4882887a7ef79dc901252fb4ce37e2a4d027a0d0969087942669505
        8fe507cc316ab85fdb222c62c2f41de95fe1c305d519067c34623b8409506878a05c167bd02bd820bcc4c93e2030be957993b66309ec3cc3907c6c06fd50f671)
validpgpkeys=(CC38FB15A3F349D3E01757EDE8835756AADCBA00)

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
