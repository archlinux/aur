# Maintainer: Eshu Team <support@eshu-apps.com>
pkgname=eshu-shapeshifter
pkgver=0.1.0
pkgrel=1
pkgdesc="Transform your Linux distro without reinstalling - migrate between distributions seamlessly"
arch=('x86_64')
url="https://eshu-apps.com"
license=('MIT')
depends=('gcc-libs' 'sqlite')
makedepends=('cargo' 'rust')
source=("$pkgname-$pkgver.tar.gz::https://github.com/eshu-apps/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=("68a327c92b2762d2e62bd156a9d0981e17517d65f8ffa7b45f843eb8472358c5")

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --target "$CARCH-unknown-linux-gnu"
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

    # Install binary
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

    # Create config directory
    install -dm755 "$pkgdir/etc/$pkgname"
}

# vim:set ts=2 sw=2 et:
