# Maintainer: Luis Villamarin <luisvillamarin at gmail dot com>
pkgname=rhisper
pkgver=0.2.7
pkgrel=1
pkgdesc="Dictation at cursor for Linux"
arch=('x86_64' 'aarch64')
url="https://github.com/lv10/rhisper"
license=('MIT')
depends=('pipewire' 'ffmpeg')
makedepends=('cargo' 'nasm')  # nasm: recommended by aws-lc-sys for its assembly codegen
backup=("usr/share/rhisper/rhisperrc.default")
# LTO conflicts with aws-lc-sys's CMake-built static C library (pulled in
# transitively via reqwest's rustls TLS backend): mixing LTO-compiled Rust
# object code with a plain (non-bitcode) C static archive produced
# "undefined symbol" link failures against makepkg.conf's default
# OPTIONS=(... lto ...). Confirmed via local reproduction - do not remove.
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lv10/rhisper/archive/refs/tags/v$pkgver.tar.gz")
# SKIP here is only for local dev builds against an untagged tree (see
# packaging/README or the AUR release CI job). The version pushed to AUR on
# each release has this replaced with the tagged tarball's real sha256sum -
# AUR convention discourages SKIP for a fixed-URL source.
sha256sums=('d61bce9d626d87a15bac849cb4f14fb16aea8d037f50fe0c9c34126e18073a5e')

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "$pkgname-$pkgver"
    cargo test --frozen --release
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm755 "target/release/rhisper" "$pkgdir/usr/bin/rhisper"
    install -Dm755 "target/release/rhispertool" "$pkgdir/usr/bin/rhispertool"
    ln -s rhispertool "$pkgdir/usr/bin/rhispertoold"

    install -Dm644 "default_rhisperrc" "$pkgdir/usr/share/rhisper/rhisperrc.default"
    install -Dm644 "packaging/rhisper-uinput.rules" "$pkgdir/usr/lib/udev/rules.d/60-rhisper-uinput.rules"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
