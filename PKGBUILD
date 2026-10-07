# Maintainer: denisotree <denisotree@users.noreply.github.com>
# AUR package: tuitab  (builds from source)
# AUR page: https://aur.archlinux.org/packages/tuitab

pkgname=tuitab
pkgver=0.10.2
pkgrel=1
pkgdesc="Terminal tabular data explorer — CSV/JSON/YAML/TOML/Parquet/Excel/SQLite viewer"
arch=('x86_64' 'aarch64')
url="https://github.com/denisotree/tuitab"
license=('Apache-2.0')
depends=()
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1e4202c38e6878ae8aece3ad454190b516d5f849d0cca497cfd7ff2b0dc80255')

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
    install -Dm755 "target/release/tuitab" "$pkgdir/usr/bin/tuitab"

    # Short aliases
    ln -s /usr/bin/tuitab "$pkgdir/usr/bin/ttab"
    ln -s /usr/bin/tuitab "$pkgdir/usr/bin/ttb"

    # License
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
