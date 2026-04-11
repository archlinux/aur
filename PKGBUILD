# Maintainer: Novaturiente <novaturiente@proton.me>
pkgname=simple-whatsapp-git
pkgver=0.1.0
pkgrel=1
pkgdesc="Minimal WhatsApp Web client for Linux (Tauri/WebKitGTK)"
arch=('x86_64')
url="https://github.com/Novaturiente/simple-whatsapp"
license=('MIT')
depends=(
    'webkit2gtk-4.1'
    'gtk3'
    'wl-clipboard'
    'libayatana-appindicator'
)
makedepends=(
    'cargo'
    'git'
    'pkg-config'
    'librsvg'
)
optdepends=(
    'gst-plugins-good: audio/video playback in WhatsApp Web'
    'gst-plugins-base: GStreamer base plugins'
)
provides=('simple-whatsapp')
conflicts=('simple-whatsapp')
source=('git+https://github.com/Novaturiente/simple-whatsapp.git')
sha256sums=('SKIP')

pkgver() {
    cd simple-whatsapp
    git describe --long --tags --abbrev=7 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' || echo "0.1.0.r$(git rev-list --count HEAD).$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd simple-whatsapp
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --manifest-path src-tauri/Cargo.toml --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd simple-whatsapp
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --manifest-path src-tauri/Cargo.toml
}

package() {
    cd simple-whatsapp

    # Binary
    install -Dm755 "target/release/simple-whatsapp" "$pkgdir/usr/bin/simple-whatsapp"

    # Desktop entry
    install -Dm644 whatsapp.desktop "$pkgdir/usr/share/applications/simple-whatsapp.desktop"

    # Icons
    install -Dm644 src-tauri/icons/icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/simple-whatsapp.svg"
    install -Dm644 src-tauri/icons/icon.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/simple-whatsapp.png"

    # License
    if [ -f LICENSE ]; then
        install -Dm644 LICENSE "$pkgdir/usr/share/licenses/simple-whatsapp/LICENSE"
    fi
}
