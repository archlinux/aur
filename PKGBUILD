# Maintainer: FXS <admin@fxs.life>
pkgname=rustle
pkgver=0.1.0
pkgrel=1
pkgdesc="A modern music player built with Rust and iced, supporting NetEase Cloud Music"
arch=('x86_64')
url="https://github.com/ArcticFoxNetwork/Rustle"
license=('AGPL-3.0-or-later')
depends=(
    'openssl'
    'dbus'
    'alsa-lib'
    'libayatana-appindicator'
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
    cargo build --frozen --release --all-features
}

check() {
    cd "Rustle-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "Rustle-$pkgver"

    # Install binary
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

    # Install desktop file
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$pkgname.desktop" << EOF
[Desktop Entry]
Name=Rustle
Comment=A modern music player
Exec=rustle
Icon=rustle
Type=Application
Categories=Audio;Music;Player;AudioVideo;
Keywords=music;player;netease;cloud;
EOF

    # Install icon
    install -Dm644 "assets/icons/icon_256.png" \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
