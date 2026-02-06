# Maintainer: lemonxah <lemonxah@gmail.com>
pkgname=drawing-tablet
pkgver=0.1.0
pkgrel=1
pkgdesc="Stream your desktop to an Android tablet and use it as a drawing tablet"
arch=('x86_64')
url="https://github.com/lemonxah/drawing_tablet"
license=('MIT')
depends=(
    'gstreamer'
    'gst-plugins-base'
    'gst-plugins-good'
    'gst-plugins-bad'      # For VA-API encoder
    'gst-plugin-va'        # VA-API GStreamer plugin
    'pipewire'
    'libpipewire'
    'xdg-desktop-portal'
    'avahi'                # For mDNS service discovery
    'hicolor-icon-theme'
)
makedepends=(
    'rust'
    'cargo'
    'clang'
    'pkgconf'
)
optdepends=(
    'gst-plugins-bad: NVIDIA NVENC encoder support'
    'intel-media-driver: Intel VA-API support'
    'libva-mesa-driver: AMD VA-API support'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

prepare() {
    cd "drawing_tablet-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "drawing_tablet-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --locked --bin dt-server
}

check() {
    cd "drawing_tablet-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --release --locked --bin dt-server
}

package() {
    cd "drawing_tablet-$pkgver"
    
    # Install binary
    install -Dm755 "target/release/dt-server" "$pkgdir/usr/bin/drawing-tablet"
    
    # Install desktop file
    install -Dm644 "pkg/drawing-tablet.desktop" "$pkgdir/usr/share/applications/drawing-tablet.desktop"
    
    # Install icon
    install -Dm644 "crates/dt-server/assets/icon.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/drawing-tablet.png"
    
    # Install license
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    
    # Install documentation
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
