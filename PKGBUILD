# Maintainer: Christian Balcom <robot.inventor@gmail.com>

pkgname=aetna-volume
pkgver=0.2.2
pkgrel=1
pkgdesc='PipeWire volume control panel built with Aetna'
arch=('x86_64')
url='https://github.com/computer-whisperer/aetna-volume'
license=('MIT OR Apache-2.0')
depends=('libpipewire' 'libxkbcommon' 'vulkan-icd-loader' 'gcc-libs' 'glibc')
makedepends=('cargo' 'pkgconf')
# Disable system LTO — Arch's default `-flto=auto` lands in CFLAGS and makes
# libspa's C wrapper (compiled by its build.rs via the `cc` crate) emit
# LTO-IR objects, which rust-lld can't resolve at the final Rust link step.
options=('!lto')
source=(
    "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
    'LICENSE-MIT'
)
sha256sums=(
    '21c47ae632ec2c58f32faf949536f5d3777e3031263dbda441530200986687c7'
    '9f00c7ed7074fac147074cf3440eb30099ca20ffce962d9fda4188d84bcdface'
)

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --frozen --bin aetna-volume
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --release --frozen --lib
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/aetna-volume" "$pkgdir/usr/bin/aetna-volume"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 aetna-volume.desktop \
        "$pkgdir/usr/share/applications/aetna-volume.desktop"
    # Scalable hicolor icon — `Icon=aetna-volume` in the .desktop entry
    # resolves here. Renaming on install so the icon name is stable
    # regardless of the source filename.
    install -Dm644 icon.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/aetna-volume.svg"
    install -Dm644 "$srcdir/LICENSE-MIT" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
}
