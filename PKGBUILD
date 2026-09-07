# Maintainer: VZstless <i [at] vzstless [dot] moe>

pkgname=stoolap
pkgver=0.4.1
pkgrel=1
pkgdesc="Modern Embedded SQL Database written in Rust"
arch=('x86_64')
url="https://github.com/stoolap/stoolap"
license=('Apache-2.0')
makedepends=('rust')
options=('!lto')
provides=('stoolap')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('2cbbf8c478810b6368aaecbaa4cbd594340fc9ca8b9aed5f73c897675c832a8b666d9363f09bedb8017a1af0445fab7bbc8f88427aefa0100b9f09904da11552')

prepare() {
    cd $pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/^host: //p')"
}

build() {
    cd $pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd $pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd $pkgname-$pkgver
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" "LICENSE"
}
