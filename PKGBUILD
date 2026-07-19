# Maintainer: ChouChiu
# SPDX-FileCopyrightText: 2026 ChouChiu
# SPDX-License-Identifier: AGPL-3.0-only

pkgname=floatlyrics
pkgver=1.1.1
pkgrel=1
pkgdesc='Floating synchronized lyrics for Spotify on Linux Wayland'
arch=('x86_64')
url='https://github.com/ChouChiu/FloatLyrics'
license=('AGPL-3.0-only')
depends=(
    'cairo'
    'glib2'
    'glibc'
    'gtk4'
    'gtk4-layer-shell'
    'libgcc'
    'openssl'
    'pango'
    'sqlite'
    'webkitgtk-6.0'
)
makedepends=('bun' 'cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
# Replace SKIP with the v1.0.0 source archive checksum before publishing to AUR:
#   updpkgsums && makepkg --printsrcinfo > .SRCINFO
sha256sums=('e36499b12d42f7a56e62506cabf5cb5667b9482417c980d77c53ccff4c82bcb4')

prepare() {
    cd "FloatLyrics-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "FloatLyrics-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export LIBSQLITE3_SYS_USE_PKG_CONFIG=1
    CFLAGS+=" -ffat-lto-objects"
    export CFLAGS
    CARGO_TARGET_DIR=target cargo build --frozen --release
}

check() {
    cd "FloatLyrics-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export LIBSQLITE3_SYS_USE_PKG_CONFIG=1
    CFLAGS+=" -ffat-lto-objects"
    export CFLAGS
    CARGO_TARGET_DIR=target cargo test --frozen --all-targets --all-features
}

package() {
    cd "FloatLyrics-$pkgver"
    ./packaging/install.sh "$pkgdir" target/release/floatlyrics
}
