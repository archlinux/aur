# Maintainer: FXS <admin@fxs.life>
pkgname=rustle
pkgver=0.5.2
pkgrel=1
pkgdesc="A modern music player built with Rust and iced, supporting NetEase Cloud Music"
arch=('x86_64')
url="https://github.com/Fei-xiangShi/Rustle"
license=('AGPL-3.0-or-later')
depends=(
    'dbus'
    'alsa-lib'
)
makedepends=(
    'rust'
    'cargo'
)
optdepends=(
    'libpulse: PulseAudio support'
    'pipewire-pulse: PipeWire audio support'
    'vulkan-icd-loader: GPU acceleration'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

prepare() {
    cd "Rustle-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "Rustle-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "Rustle-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen
}

package() {
    cd "Rustle-$pkgver"

    # Install binary
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

    # Install desktop metadata and icon
    install -Dm644 "packaging/linux/life.fxs.rustle.desktop" \
        "$pkgdir/usr/share/applications/life.fxs.rustle.desktop"
    install -Dm644 "packaging/linux/life.fxs.rustle.metainfo.xml" \
        "$pkgdir/usr/share/metainfo/life.fxs.rustle.metainfo.xml"
    install -Dm644 "assets/icons/icon_256.png" \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/life.fxs.rustle.png"

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
