# Maintainer: jinzhongjia <mail@nvimer.org>

pkgname=lowfat
pkgver=0.6.10
pkgrel=1
pkgdesc="Lightweight CLI that filters verbose command output to cut AI agent token costs"
arch=('x86_64' 'aarch64')
url="https://github.com/zdk/lowfat"
license=('Apache-2.0')
depends=('glibc' 'gcc-libs')
makedepends=('rust' 'cargo')
provides=("lowfat=${pkgver}")
conflicts=('lowfat-bin')
# makepkg's global `lto` option pushes -flto=auto into CFLAGS, so the cc
# crate compiles rusqlite's bundled sqlite3.c into LTO bitcode. rust-lld
# then can't resolve the sqlite3_* symbols from that static archive at
# final link (undefined symbol: sqlite3_open/_step/_errmsg...). Disable
# LTO to restore normal static-archive linking.
# !debug: cargo's release profile builds without DWARF (debug=0), so the
# auto-split debug package would contain only a symtab, an empty
# /usr/src/debug tree, and a dangling build-id symlink (namcap E).
options=('!lto' '!debug')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0b9a31c43981142b1686bd08d6ee71d76e6bdc04595adcaf65daf985cc477c82')

prepare() {
    cd "${pkgname}-${pkgver}"

    # Keep cargo state inside $srcdir so the build never touches ~/.cargo.
    export CARGO_HOME="${srcdir}/.cargo"
    cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
    cd "${pkgname}-${pkgver}"

    export CARGO_HOME="${srcdir}/.cargo"
    export RUSTUP_TOOLCHAIN=stable

    # Only the `lowfat` binary crate; the other workspace members are libs.
    # rusqlite is built with the `bundled` feature, so SQLite is compiled
    # from C and statically linked (base-devel's gcc handles this) — no
    # system sqlite runtime dependency.
    cargo build --frozen --release --bin lowfat
}

package() {
    cd "${pkgname}-${pkgver}"

    install -Dm755 "target/release/lowfat" "${pkgdir}/usr/bin/lowfat"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
