# Maintainer: Rico Riedel <rico dot riedel at protonmail dot ch>

pkgname=wipe-term
pkgver=2.1.2
pkgrel=0
pkgdesc='Wipe the content of your terminal with a random animation.'
url='https://github.com/ricoriedel/wipe'
arch=(x86_64)
license=(MIT)
makedepends=(cargo)
conflicts=(wipe)
source=(wipe-2.1.2.tar.gz::https://github.com/ricoriedel/wipe/archive/refs/tags/v2.1.2.tar.gz
        wipe-2.1.2.tar.gz.sig::https://github.com/ricoriedel/wipe/releases/download/v2.1.2/wipe-2.1.2.tar.gz.sig)
b2sums=(6f90a53797df0f044ea80b33bd12a13b7ea81e7c26eebadab07f022fc47aaea5234ffb4448e5755e096e1ed34f67720534a6a0d2749b7072f4605089720d59f5
        f961d651589e686cde4b28f02b10e26677d3a640ede1b0c945ee72b79f1bf565577e89fa11aaf2ea3f9c02bc0bfc48d43c6946e3acf39c5aa5e19ff222b05174)
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
    install -Dm0644 -t "$pkgdir/usr/share/zsh/plugins/wipe/"   'misc/shell/wipe.zsh'
    install -Dm0644 -t "$pkgdir/usr/share/fish/vendor_conf.d/" 'misc/shell/wipe.fish'
}
