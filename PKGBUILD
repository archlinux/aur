# Maintainer: evoludigit <lionel@evoludigit.com>

pkgname=ascfix
pkgver=0.5.8
pkgrel=2
pkgdesc="Automatic ASCII diagram repair tool for Markdown files"
arch=('x86_64')
url="https://github.com/evoludigit/ascfix"
license=('MIT')
depends=()
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('d9e594727e178a4aa25e76e84eae176468c3322a92a67fc601aac68b25f3d996')

prepare() {
    cd "$pkgname-$pkgver"
    export CARGO_HOME="$srcdir/.cargo"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_HOME="$srcdir/.cargo"
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_HOME="$srcdir/.cargo"
    export CARGO_TARGET_DIR=target
    # Skip doctests due to /tmp noexec on many Arch systems
    cargo test --frozen --release --lib --bins
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
