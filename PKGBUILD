#!/usr/bin/env bash
# Maintainer: JeremyStarTM <jeremystartm@staropensource.de>

pkgname=microsoft-edit
pkgver=1.0.0
pkgrel=1
pkgdesc="Modern version of the MS-DOS Editor with a modern UI and keybindings similar to VS Code"
url="https://git.staropensource.de/JeremyStarTM/aur-microsoft-edit"
arch=("x86_64" "aarch64")
license=("GPL-3.0-or-later")
sha512sums=("SKIP")
source=("git+https://github.com/microsoft/edit.git")
makedepends=("cargo")

# Configure rustup toolchain
: "${RUSTUP_TOOLCHAIN:="nightly"}"
export RUSTUP_TOOLCHAIN

# Check for rust toolchain
_check_rust_toolchain() {
    if ! rustc --version | grep 'nightly' &> /dev/null; then
        echo ":: Warning: Your currently active Rust toolchain is running on a non-nightly version."
        echo "            You may experience build failures on non-nightly Rust toolchain builds."
    fi
}

prepare() {
    cd "edit"
    git checkout "v${pkgver}"
    _check_rust_toolchain
    cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
    cd "edit"
    export CARGO_TARGET_DIR="target"
    cargo build --frozen --release --bin edit
}

package() {
    cd "edit"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 target/release/edit "${pkgdir}/usr/bin/microsoft-edit"
}
