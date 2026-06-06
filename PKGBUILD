# Maintainer: Christian Balcom <robot.inventor@gmail.com>

pkgname=damascene-volume
pkgver=0.3.1
pkgrel=1
pkgdesc='PipeWire volume control panel built with Damascene'
arch=('x86_64')
url='https://github.com/computer-whisperer/damascene-volume'
license=('MIT OR Apache-2.0')
depends=(
    'libpipewire'
    'libx11'
    'libxcursor'
    'libxi'
    'libxkbcommon'
    'libxkbcommon-x11'
    'vulkan-icd-loader'
    'wayland'
    'gcc-libs'
    'glibc'
)
makedepends=('cargo' 'clang' 'pkgconf')
# Disable system LTO — Arch's default `-flto=auto` lands in CFLAGS and makes
# libspa's C wrapper (compiled by its build.rs via the `cc` crate) emit
# LTO-IR objects, which rust-lld can't resolve at the final Rust link step.
options=('!lto')
source=(
    "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
    'LICENSE-MIT'
)
sha256sums=('f7fff4ebc2709106bd7ec0a5da2d2eb2721bfa86d87d1b8aa5c94a6be40840cf'
            '9f00c7ed7074fac147074cf3440eb30099ca20ffce962d9fda4188d84bcdface')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --frozen --bin damascene-volume
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --release --frozen --lib
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/damascene-volume" "$pkgdir/usr/bin/damascene-volume"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 damascene-volume.desktop \
        "$pkgdir/usr/share/applications/damascene-volume.desktop"
    # Scalable hicolor icon — `Icon=damascene-volume` in the .desktop entry
    # resolves here. Renaming on install so the icon name is stable
    # regardless of the source filename.
    install -Dm644 icon.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/damascene-volume.svg"
    install -Dm644 "$srcdir/LICENSE-MIT" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
}
