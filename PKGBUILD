# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@pm.me>
pkgname=rusty_ulid
pkgver=1.0.0
pkgrel=1
pkgdesc="Rust ULID generation and processing"
arch=('x86_64')
url="https://crates.io/crates/rusty_ulid"
license=('MIT' 'Apache')
makedepends=('cargo')
depends=('gcc-libs')
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/huxi/rusty_ulid/archive/refs/tags/$pkgver.tar.gz")
b2sums=('e7e3ae0e3edff7e90112a77be640510e51c155bbb2a497c86a6f99994755ff4d040b23f221a626eb3cf945ba0e3a69c26a1b885a119b0309492f799a42a71a0b')

build() {
    cd "$pkgname-$pkgver"
    RUSTUP_TOOLCHAIN=stable cargo build --release --locked --all-features --target-dir=target
}

check() {
    cd "$pkgname-$pkgver"
    RUSTUP_TOOLCHAIN=stable cargo test --release --locked --target-dir=target
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm775 target/release/rusty_ulid -t "$pkgdir/usr/bin"
    find target/release \
        -maxdepth 1 \
        -executable \
        -type f \
        -exec install -m755 "{}" "$pkgdir/usr/bin" \;
    mkdir -p "$pkgdir/usr/share/licenses/rusty_ulid"
    install -Dm644 LICENSE-MIT LICENSE-APACHE "$pkgdir/usr/share/licenses/rusty_ulid"
}
