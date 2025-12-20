# Maintainer: mfw <espadonne@outlook.com>

pkgname=fussr
pkgver=0.2.9
pkgrel=2
pkgdesc='A git staging TUI tool - Rust port of fuss'
arch=('x86_64')
url='https://github.com/tenseleyFlow/fussr'
license=('MIT')
depends=('git')
makedepends=('rust' 'cargo' 'cmake' 'pkg-config')
provides=('fussr')
source=("git+https://github.com/tenseleyFlow/fussr.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
    cd fussr
    export CARGO_TARGET_DIR=target
    # Ensure vendored builds don't try to use system libraries
    unset LIBSSH2_SYS_USE_PKG_CONFIG
    unset LIBGIT2_NO_VENDOR
    # Disable incremental compilation for clean build
    export CARGO_INCREMENTAL=0
    cargo build --release
}

package() {
    cd fussr

    # Install main binary
    install -Dm755 target/release/fussr "$pkgdir/usr/bin/fussr"

    # Install documentation if present
    [ -f README.md ] && install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md" || true

    # Install license if present
    [ -f LICENSE ] && install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE" || true
}
