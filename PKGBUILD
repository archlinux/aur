# Maintainer: denisotree <denisotree@users.noreply.github.com>
# AUR package: qrow  (builds from source)
# AUR page: https://aur.archlinux.org/packages/qrow

pkgname=qrow
pkgver=0.12.0
pkgrel=1
pkgdesc="Query rows in tables, documents and databases from the terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/denisotree/qrow"
license=('Apache-2.0')
depends=()
# tuitab is the same program under its former name.
conflicts=('tuitab')
replaces=('tuitab')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e739d90b9eda539010af549ba1bdb50b9d329712fc3aec519304b7d9119a2418')

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
