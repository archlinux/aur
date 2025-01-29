# Maintainer: creations <creations@creations.works>
pkgname=navithingy
pkgver=0.2.0
pkgrel=1
pkgdesc="A Navidrome client built with Tauri and Svelte. "
arch=('x86_64')
url="https://github.com/vMohammad24/NaviThingy"
license=('MIT')
depends=('nodejs' 'npm' 'gtk3' 'gstreamer' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad' 'gst-plugins-ugly')
makedepends=('git' 'nodejs' 'npm' 'rustup' 'pkg-config' 'clang' 'lld' 'webkit2gtk-4.1' 'openssl' 'openssl-1.1' 'fuse2' 'glib2' 'zlib' 'patchelf')
source=("$pkgname::git+https://github.com/vMohammad24/NaviThingy.git#tag=NaviThingy$pkgver")
sha256sums=('SKIP')
install="$pkgname.install"

prepare() {
    cd "$srcdir/$pkgname"

    rustup default stable
    rustup update stable
    rustup target add x86_64-unknown-linux-gnu
    
    npm install
}

build() {
    cd "$srcdir/$pkgname"

    export RUSTFLAGS="-C link-arg=-fuse-ld=lld"
    export CC=clang
    export CXX=clang++

    npm run build
    npm run tauri build -- --no-bundle
}

package() {
    cd "$srcdir/$pkgname"
    install -d "$pkgdir/usr/bin"
    install -d "$pkgdir/usr/share/applications"
    install -d "$pkgdir/usr/share/icons/hicolor"

    install -m755 "src-tauri/target/release/${pkgname}" "$pkgdir/usr/bin/"

    cat > "$pkgdir/usr/share/applications/navithingy.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=NaviThingy
Exec=env WEBKIT_DISABLE_COMPOSITING_MODE=1 /usr/bin/navithingy
Icon=navithingy
Categories=Audio;Music;
EOF

    # Install icons
    if [ -d "$srcdir/$pkgname/static" ]; then
        install -Dm644 "$srcdir/$pkgname/static/favicon.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/navithingy.png"
        install -Dm644 "$srcdir/$pkgname/static/logo.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/navithingy.svg"
    fi
}

optdepends=(
    "libappindicator-gtk3: System tray support"
    "xdg-desktop-portal: Required for file picker integration"
    "fuse2: Required for AppImage support"
    "gst-plugin-pipewire: Required for PipeWire-based audio playback"
)

check() {
    echo "Skipping check() due to svelte-check issue."
    # cd "$srcdir/$pkgname"
    # npm run check
}
