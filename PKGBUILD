# Maintainer: paperbenni <paperbenni@gmail.com>
pkgname=ins
pkgver=0.7.7
pkgrel=1
pkgdesc="A powerful command-line tool for managing dotfiles, system diagnostics, and instantOS configurations"
arch=('x86_64')
url="https://github.com/instantOS/instantCLI"
license=('GPL-2.0-only')
depends=('glibc' 'gcc-libs' 'fzf' 'git' 'sqlite')
makedepends=('rust')
optdepends=(
    'restic: for backup functionality'
    'kitty: default terminal for scratchpad'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/instantOS/instantCLI/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')  # Will be calculated after first release
options=('!lto')  # Disable LTO as recommended for Rust packages

prepare() {
    cd "instantCLI-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "instantCLI-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "instantCLI-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "instantCLI-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
