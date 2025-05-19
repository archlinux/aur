#!/usr/bin/env bash
# Maintainer: JeremyStarTM <jeremystartm@staropensource.de>

pkgname=microsoft-edit-git
pkgver=1.0.0.r1.ge8d40f6
pkgrel=1
pkgdesc="Modern version of the MS-DOS Editor with a modern UI and keybindings similar to VS Code"
arch=("any")
url="https://git.staropensource.de/JeremyStarTM/aur-microsoft-edit-git"
license=("GPL-3.0-or-later")
sha512sums=("SKIP")
source=("git+https://github.com/microsoft/edit.git")
makedepends=("rustup")
conflicts=("microsoft-edit")

# Configure rustup toolchain
: "${RUSTUP_TOOLCHAIN:="nightly"}"
export RUSTUP_TOOLCHAIN

pkgver() {
    cd "edit"
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "edit"
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
