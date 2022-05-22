# Maintainer: Rico Riedel <rico dot riedel at protonmail dot ch>

pkgname=nonosolver
pkgver=2.0.0
pkgrel=1
pkgdesc='A fast command-line based nonogram solver.'
url='https://github.com/ricoriedel/nonogram-rs'
arch=(x86_64)
license=(GPL3)
makedepends=(cargo)
source=(nonogram-rs-2.0.0.tar.gz::https://github.com/ricoriedel/nonogram-rs/archive/refs/tags/v2.0.0.tar.gz
        nonogram-rs-2.0.0.tar.gz.sig::https://github.com/ricoriedel/nonogram-rs/releases/download/v2.0.0/nonogram-rs-2.0.0.tar.gz.sig)
b2sums=(06e82bf7b7a144d15329bc4be5bae284499274936b9ec0e56fd75a249b5526a700831e693e44a39619c4b4f985d4e8cba52e7ff2dfaf8121eee45e3a6349f271
        15de461b3bac20fd4c0fdd67eac94758b588f1bed19d76d8756b91932a836df65713a7f48776ac1cf80ae71ba88b6ac1afe238eedbf9cca0f748860dfff4d916)
validpgpkeys=(C6BC439C0B32DFBE1CB809006B4087D7F5F4F83B)

prepare() {
    cd "nonogram-rs-$pkgver"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "nonogram-rs-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "nonogram-rs-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "nonogram-rs-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" 'LICENSE'
    install -Dm0644 -t "$pkgdir/usr/share/$pkgname" res/*
}
