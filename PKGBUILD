# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# GPG keys: https://github.com/LIghtJUNction.gpg

pkgname=emailctl
pkgver=0.1.2
pkgrel=2
_commit=b0771c9
pkgdesc='Rust email CLI with Gmail OAuth and generic IMAP/SMTP support'
arch=(x86_64)
url='https://github.com/LIghtJUNction/emailctl'
license=('MIT OR Apache-2.0')
replaces=(email-cli-lightjunction)
depends=(openssl)
makedepends=(cargo git)
options=(!lto)
source=("$pkgname::git+$url#commit=$_commit?signed")
sha256sums=('b90b06323a6d762ffcee0609a67751cc3ddd2c896483495bee72b58b811aa513')
validpgpkeys=(EB21B83AB1E982DF66F08387A67178405F7736FD)

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$pkgname"
    cargo fetch --locked --target host-tuple
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export OPENSSL_NO_VENDOR=1
    cd "$pkgname"
    cargo build --frozen --release --all-features
}

check() {
    cd "$pkgname"
    cargo test --frozen --all-features
}

package() {
    cd "$pkgname"
    install -Dm755 target/release/email -t "$pkgdir/usr/bin/"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

