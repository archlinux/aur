# Maintainer: Sungjoon Moon <sumoon at seoulsaram dot org>

pkgname=unalz
pkgver=0.1.1
pkgrel=1
pkgdesc='ALZ archive extractor'
arch=('x86_64')
url='https://github.com/alkegi/unalz'
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/alkegi/unalz/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('284faec9efa666aac5debe843cda28af704559eb05be4d0e4e8cc1e864f81cb5')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    RUSTFLAGS="--remap-path-prefix=$srcdir=/build/" \
        cargo build --frozen --release --all-features
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
