#!/usr/bin/env bash
# Maintainer: JeremyStarTM <jeremystartm@staropensource.de>

_prjname=edit
pkgname=microsoft-${_prjname}
pkgver=1.0.0
pkgrel=2
pkgdesc="Modern version of the MS-DOS Editor with a modern UI and keybindings similar to VS Code"
arch=("x86_64" "aarch64")
url="https://git.staropensource.de/JeremyStarTM/aur-${pkgname}"
license=("GPL-3.0-or-later")
sha512sums=("SKIP")
source=("git+https://github.com/microsoft/${_prjname}.git")
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
    cargo build --frozen --release --bin "${_prjname}"
}

package() {
    cd "edit"
    install "-Dm644" "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install "-Dm755" "target/release/${_prjname}" "${pkgdir}/usr/bin/microsoft-${_prjname}"
}
