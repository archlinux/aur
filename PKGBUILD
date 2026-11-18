# Maintainer: VZstless <i [at] vzstless [dot] moe>

pkgname=stoolap
pkgver=0.5.0
pkgrel=1
pkgdesc="Modern Embedded SQL Database written in Rust"
arch=('x86_64')
url="https://github.com/stoolap/stoolap"
license=('Apache-2.0')
makedepends=('rust')
options=('!lto')
provides=('stoolap')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('459ef2485d992d10a1d5b60bafab2e40c5bd90fa9febe2f481439838974876ae7ee39a2ad57419b8f51074044b00d8d7be87a133c3dfeb70b425710fabca0d14')

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
    cargo test --frozen --all-features -- --skip kept_descriptor_test::
    cargo test --frozen --all-features --test cold_read -- kept_descriptor_test:: --test-threads=1
}

package() {
    cd $pkgname-$pkgver
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" "LICENSE"
}
