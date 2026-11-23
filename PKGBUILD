# Maintainer: VZstless <i [at] vzstless [dot] moe>

pkgname=stoolap
pkgver=0.5.1
pkgrel=1
pkgdesc="Modern Embedded SQL Database written in Rust"
arch=('x86_64')
url="https://github.com/stoolap/stoolap"
license=('Apache-2.0')
makedepends=('rust')
options=('!lto')
provides=('stoolap')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('2ddf190124391d0fa2dc0cc2ec22785aa309c710da6a0c7b4b31584b2d7088d5042c7bb62324c93011d20e40225c28efff2b3fb4a161a7495665817ba41120bf')

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
