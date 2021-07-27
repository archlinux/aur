# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@pm.me>
pkgname=rusty_ulid
pkgver=0.10.1
pkgrel=2
pkgdesc="Rust ULID generation and processing"
arch=('x86_64')
url="https://crates.io/crates/rusty_ulid"
license=('MIT' 'Apache')
makedepends=('cargo')
depends=('gcc-libs')
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/huxi/rusty_ulid/archive/refs/tags/$pkgver.tar.gz")
b2sums=('493b7e228d5e61b95b816626c71cd03ffcb3987a2cbf90de704fba33d2f78ab4a3ac4cacdfc351e4f5789f7d2417d7a93c8022304a1f0c8fda87be286e863346')

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
