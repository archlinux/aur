# Maintainer: everyx <lunt.luo#gmail.com>

pkgname=shadow-tls
pkgver=0.2.22
pkgrel=1

pkgdesc='A proxy to expose real tls handshake to the firewall.'
arch=('x86_64')
url='https://github.com/ihciah/shadow-tls'
license=('MIT' 'Apache')

makedepends=('cargo-nightly')

source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('4b16f30d0655a952d9ed26c2fe0c0bf2b55e114ee07c3af8976f7e1660cc5fb6')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=nightly
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$pkgver"
    export CARGO_TARGET_DIR=target
    export CARGO_REGISTRIES_CRATES_IO_PROTOCOL=sparse
    export RUSTFLAGS=""
    cargo build --frozen --release --bin "$pkgname"
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
}
