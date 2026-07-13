# Maintainer: ChouChiu
# SPDX-FileCopyrightText: 2026 ChouChiu
# SPDX-License-Identifier: GPL-3.0-or-later

pkgname=floatlyrics
pkgver=1.0.2
pkgrel=1
pkgdesc='Floating synchronized lyrics for Spotify on Linux Wayland'
arch=('x86_64')
url='https://github.com/ChouChiu/FloatLyrics'
license=('GPL-3.0-or-later')
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
)
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
# Replace SKIP with the v1.0.0 source archive checksum before publishing to AUR:
#   updpkgsums && makepkg --printsrcinfo > .SRCINFO
sha256sums=('26d58bbf50f68133449ce9d640493ddd8d8215ace7428e875c028bf7d12850cb')

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
