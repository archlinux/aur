# Maintainer: Your Name <your.email@example.com>

pkgname=eshu-trace
pkgver=1.0.3
pkgrel=1
pkgdesc="Binary search tool to find which package broke your Linux system"
arch=('x86_64' 'aarch64')
url="https://github.com/eshu-apps/eshu-trace"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
optdepends=(
    'timeshift: for Timeshift snapshot support'
    'snapper: for Snapper snapshot support'
    'btrfs-progs: for BTRFS snapshot support'
    'lvm2: for LVM snapshot support'
)
_commit=8aa5407457f29e8f2cdce57296c7dae22e784ad3
source=("$pkgname-$pkgver.tar.gz::https://github.com/eshu-apps/eshu-trace/archive/$_commit.tar.gz")
sha256sums=("d8b4977224a4f595d32db4ae994334c22d2d2ac4a66275f69194cb2c6f015670")

prepare() {
    cd "$srcdir/$pkgname-$_commit"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$srcdir/$pkgname-$_commit"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "$srcdir/$pkgname-$_commit"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$srcdir/$pkgname-$_commit"

    # Install binary
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Install README
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim:set ts=2 sw=2 et:
