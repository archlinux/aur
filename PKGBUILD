# Maintainer: CallMeAlphabet
pkgname=near
pkgver=0.1.0
pkgrel=1
pkgdesc="near, a LAN-only file transfer hub, builds from source"
arch=('x86_64' 'aarch64')
url="https://github.com/CallMeAlphabet/near"
license=('Apache-2.0')
depends=('gcc-libs')
makedepends=('cargo')
provides=('near')
conflicts=('near-bin')
# Arch's default makepkg.conf enables lto, which puts -flto=auto in CFLAGS.
# ring's C objects then become GCC LTO bytecode, and rust-lld (Rust >= 1.90's
# default linker) cannot resolve them: undefined ring_core_0_17_14__* symbols.
# This only disables makepkg's C-level LTO; Cargo's own lto = "thin" is untouched.
options=('!debug' '!lto')
# The published crate is immutable and served from the crates.io CDN, unlike a
# GitHub archive. It is a gzipped tarball with a .crate extension.
source=("near-lan-$pkgver.crate::https://static.crates.io/crates/near-lan/near-lan-$pkgver.crate")
noextract=("near-lan-$pkgver.crate")
sha256sums=('bc8a6a033e6d3d5717d31945ae3bcf9d536aa22989a59fc3700ad2acd0a440f6')

prepare() {
    rm -rf "$srcdir/build"
    mkdir -p "$srcdir/build"
    tar -xzf "$srcdir/near-lan-$pkgver.crate" --strip-components=1 -C "$srcdir/build"
    cd "$srcdir/build"
    cargo fetch --locked
}

build() {
    cd "$srcdir/build"
    export CARGO_TARGET_DIR=target
    # cc-rs build scripts honour the distro CFLAGS; strip them so ring's C code
    # is compiled the same way as a plain cargo build. Rust flags come from Cargo.toml.
    CFLAGS= CXXFLAGS= CPPFLAGS= LDFLAGS= cargo build --frozen --release
}

package() {
    cd "$srcdir/build"
    install -Dm755 "target/release/near" "$pkgdir/usr/bin/near"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
