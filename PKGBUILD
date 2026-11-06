# Maintainer: denisotree <denisotree@users.noreply.github.com>
# AUR package: qrow  (builds from source)
# AUR page: https://aur.archlinux.org/packages/qrow

pkgname=qrow
pkgver=1.1.1
pkgrel=1
pkgdesc="Query rows in tables, documents and databases from the terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/denisotree/qrow"
license=('Apache-2.0')
depends=()
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c4e472d9cd7a1a78f11d9a83b4f56b6177789b318732a5642fba762d8d47342c')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --frozen
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --release --frozen
}

package() {
    cd "$pkgname-$pkgver"

    # Main binary
    install -Dm755 "target/release/qrow" "$pkgdir/usr/bin/qrow"

    # Short alias
    ln -s /usr/bin/qrow "$pkgdir/usr/bin/qrw"

    # License
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
