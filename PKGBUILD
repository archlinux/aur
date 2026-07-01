# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# GPG keys: https://github.com/LIghtJUNction.gpg

pkgname=emailctl-git
pkgver=0.1.2.r1.gb415c44
pkgrel=1
pkgdesc='Rust email CLI with Gmail OAuth and generic IMAP/SMTP support'
arch=(x86_64)
url='https://github.com/LIghtJUNction/emailctl'
license=('MIT OR Apache-2.0')
depends=(openssl)
makedepends=(cargo git)
options=(!lto)
source=("emailctl::git+$url?signed")
sha256sums=('SKIP')
validpgpkeys=(EB21B83AB1E982DF66F08387A67178405F7736FD)

pkgver() {
    git -C emailctl describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd emailctl
    cargo fetch --locked --target host-tuple
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export OPENSSL_NO_VENDOR=1
    cd emailctl
    cargo build --frozen --release --all-features
}

check() {
    cd emailctl
    cargo test --frozen --all-features
}

package() {
    cd emailctl
    install -Dm755 target/release/email -t "$pkgdir/usr/bin/"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

