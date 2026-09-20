# Maintainer: ChouChiu
# SPDX-FileCopyrightText: 2026 ChouChiu
# SPDX-License-Identifier: AGPL-3.0-only

pkgname=floatlyrics
pkgver=1.3.0
pkgrel=1
pkgdesc='Floating synchronized lyrics for MPRIS players on Linux Wayland'
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
# The other sources are the dictionaries `lindera-ipadic` and `lindera-cc-cedict`
# build the readings they embed into the binary from; pinned copies keep the build
# from fetching them on its own.
source=(
    "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
    "mecab-ipadic-2.7.0-20250920.tar.gz::https://lindera.dev/mecab-ipadic-2.7.0-20250920.tar.gz"
    "CC-CEDICT-MeCab-0.1.0-20200409.tar.gz::https://lindera.dev/CC-CEDICT-MeCab-0.1.0-20200409.tar.gz"
)
# The source archive comes first, then the dictionaries in the order above;
# scripts/update-aur-checksum.sh replaces the first one on every release.
sha256sums=(
    'a7818983a078cfaa6f502e6bb7e2a8b38b24835659d297463f62fa87f3278ae8'
    'a7ba9f645ffe7094e56ae1c4a81d100df8fbb1e28bbe1792622e9728e162db3d'
    'ed3cf9e3ec8a80647f0ec783dc09dad43b8ccad2e994f5eab6ff13a41d0916c8'
)
# A lindera dictionary crate looks for its archive in
# "$LINDERA_BUILD_DICTIONARY_CACHE_DIR/<crate version>-fmt<dictionary format
# version>"; both numbers are pinned by Cargo.lock, and a mismatch falls back to
# the download the pinned copies are here to avoid.
dictionary_cache="$srcdir/lindera-cache"
dictionary_build="$dictionary_cache/6.0.0-fmt2"
export LINDERA_BUILD_DICTIONARY_CACHE_DIR="$dictionary_cache"

prepare() {
    cd "FloatLyrics-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
    install -Dm644 "$srcdir/mecab-ipadic-2.7.0-20250920.tar.gz" \
        "$dictionary_build/mecab-ipadic-2.7.0-20250920.tar.gz"
    install -Dm644 "$srcdir/CC-CEDICT-MeCab-0.1.0-20200409.tar.gz" \
        "$dictionary_build/CC-CEDICT-MeCab-0.1.0-20200409.tar.gz"
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
