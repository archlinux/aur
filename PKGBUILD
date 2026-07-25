# Maintainer: VZstless <i [at] vzstless [dot] moe>

pkgname=stoolap
pkgver=0.4.0
pkgrel=1
pkgdesc="Modern Embedded SQL Database written in Rust"
arch=('x86_64')
url="https://github.com/stoolap/stoolap"
license=('Apache-2.0')
makedepends=('rust')
options=('!lto')
provides=('stoolap')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('1301baed32346fe910e682ec83ae17b937a277d3a384f11d956c4155597abeed8713292f455d6f87f12f119a32eb8adb38c062b3361e903d7d488cd38a32524a')

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
