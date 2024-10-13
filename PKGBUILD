# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@pm.me>
pkgname=rusty_ulid
pkgver=2.0.0
pkgrel=1
pkgdesc="Rust ULID generation and processing"
arch=('x86_64')
url="https://crates.io/crates/rusty_ulid"
license=('MIT' 'Apache')
makedepends=('cargo')
depends=('gcc-libs')
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/huxi/rusty_ulid/archive/refs/tags/$pkgver.tar.gz")
b2sums=('2536be5c177ce95626b7f2897f1de364f0f76e586e22ea559c8385adaec4cc74471d45fc2922b7d2d783e4b88a7000bee93d8201f244010dd11c220cc5e93f3d')

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
