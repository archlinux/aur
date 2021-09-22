# Maintainer: Celti Burroughs <celti@celti.name>
pkgname=inputplug
pkgver=0.4.0
pkgrel=1
pkgdesc="Xinput hotplug event monitor daemon"
arch=('x86_64')
url="https://github.com/andrewshadura/inputplug"
license=('MIT')
depends=('gcc-libs' 'libbsd')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha512sums=('920aee68defbdf91e699a1e5c4ff312f6e3c1a6ee1887bec409dfdee851358f4a7e6e845dfa3e5b57a2035195a6bc1afee400c5475eeb821c07d748e760127b8')

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE" "LICENSE"
    install -Dm644 -t "$pkgdir/usr/share/man/man1/$pkgname.1" "$pkgname.1"
}
