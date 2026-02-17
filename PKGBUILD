# Maintainer: evoludigit <your-email@example.com>
pkgname=ascfix
pkgver=0.6.0
pkgrel=2
pkgdesc="Automatic ASCII diagram repair tool for Markdown files"
arch=('x86_64')
url="https://github.com/evoludigit/ascfix"
license=('MIT')
depends=()
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha256sums=('949fa350816926c7d1badd2f144e0dfb8ac26aec0c3f0c4b0dc459cca53ba893')  # Will be updated after first download

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features --lib --bins --tests
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
    install -Dm644 .ascfix.example.toml "$pkgdir/usr/share/doc/$pkgname/ascfix.example.toml"
}
