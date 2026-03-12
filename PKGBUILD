# Maintainer: jaslrobinson
pkgname=lava-desktop
pkgver=0.1.0
pkgrel=1
pkgdesc="LAVA - Live Animated Visuals for Arch. Desktop live wallpaper engine with formula support, animations, and widget system."
arch=('x86_64')
url="https://github.com/jaslrobinson/lava"
license=('MIT')
depends=(
    'gtk3'
    'webkit2gtk-4.1'
    'gtk-layer-shell'
    'wireplumber'
)
optdepends=(
    'brightnessctl: brightness control via scroll gestures'
    'hyprland: primary compositor support (Wayland)'
    'sway: basic compositor support (Wayland)'
)
makedepends=(
    'rust'
    'cargo'
    'nodejs'
    'pnpm'
    'pkg-config'
)
provides=('lava')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jaslrobinson/lava/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$srcdir/lava-$pkgver"

    # Install frontend dependencies
    pnpm install

    # Build the wallpaper helper binary
    cargo build -p lava-wallpaper --release

    # Build the main Tauri app (frontend + Rust backend)
    npx tauri build --no-bundle
}

package() {
    cd "$srcdir/lava-$pkgver"

    # Install main binary
    install -Dm755 "target/release/lava" "$pkgdir/usr/bin/lava"

    # Install wallpaper helper binary
    install -Dm755 "target/release/lava-wallpaper" "$pkgdir/usr/bin/lava-wallpaper"

    # Install frontend dist (needed by wallpaper server in release mode)
    install -d "$pkgdir/usr/share/lava/dist/assets"
    install -Dm644 dist/index.html "$pkgdir/usr/share/lava/dist/index.html"
    for f in dist/assets/*; do
        install -Dm644 "$f" "$pkgdir/usr/share/lava/dist/assets/$(basename "$f")"
    done

    # Install desktop entry
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/lava.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=LAVA
GenericName=Live Wallpaper Engine
Comment=Live Animated Visuals for Arch
Exec=lava
Icon=lava
Categories=Utility;Graphics;
Keywords=wallpaper;live;widget;desktop;
StartupNotify=true
EOF

    # Install icon (multiple sizes if available)
    install -Dm644 "src-tauri/icons/icon.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/lava.png"

    # Install license
    if [ -f LICENSE ]; then
        install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
}
