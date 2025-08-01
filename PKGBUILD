# Maintainer: creations <creations@creations.works>
pkgname=navithingy-git
pkgver=0.8.5
pkgrel=1
pkgdesc="A Navidrome client built with Tauri and Svelte."
arch=("$CARCH")
url="https://github.com/vMohammad24/NaviThingy"
license=('MIT')
depends=('gtk3' 'gstreamer' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad' 'gst-plugins-ugly')
makedepends=('git' 'rustup' 'curl' 'pkg-config' 'clang' 'lld' 'webkit2gtk-4.1' 'openssl' 'openssl-1.1' 'glib2' 'zlib' 'patchelf' 'jq')
optdepends=(
    "libappindicator-gtk3: System tray support"
    "gst-plugin-pipewire: Required for PipeWire-based audio playback"
)
source=("git+https://github.com/vMohammad24/NaviThingy.git")
sha256sums=('SKIP')
install="$pkgname.install"
provides=('navithingy')
conflicts=('navithingy')

pkgver() {
    cd "$srcdir/NaviThingy"
    local tag rev commit
    tag=$(git describe --tags --abbrev=0 | sed 's/^NaviThingy//' | tr -d 'v')
    rev=$(git rev-list --count HEAD)
    commit=$(git rev-parse --short HEAD)

    echo "${tag}.r${rev}.${commit}"
}

prepare() {
    cd "$srcdir/NaviThingy"

    rustup show active-toolchain || rustup default stable
    rustup update stable
    rustup target add "$(rustc -vV | grep host | awk '{print $2}')"

    curl -fsSL https://bun.sh/install | bash
    export PATH="$HOME/.bun/bin:$PATH"

    bun install --no-cache

    cargo install tauri-cli --locked
}

build() {
    cd "$srcdir/NaviThingy"
    export PATH="$HOME/.bun/bin:$PATH"
    export RUSTFLAGS="-C link-arg=-fuse-ld=lld"
    export CC=clang
    export CXX=clang++

    jq '.bundle.active = false' src-tauri/tauri.conf.json > src-tauri/tauri.conf.json.patched && mv src-tauri/tauri.conf.json.patched src-tauri/tauri.conf.json

    bun run build
    cargo tauri build
}

package() {
    cd "$srcdir/NaviThingy"
    install -d "$pkgdir/usr/bin"
    install -d "$pkgdir/usr/share/applications"
    install -d "$pkgdir/usr/share/icons/hicolor"

    install -m755 "src-tauri/target/release/navithingy" "$pkgdir/usr/bin/"

    cat > "$pkgdir/usr/share/applications/navithingy.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=NaviThingy
Exec=env WEBKIT_DISABLE_COMPOSITING_MODE=1 /usr/bin/navithingy
Icon=navithingy
Categories=Audio;Music;
EOF

    # Install icons
    if [ -d "$srcdir/NaviThingy/static" ]; then
        install -Dm644 "$srcdir/NaviThingy/static/favicon.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/navithingy.png"
        install -Dm644 "$srcdir/NaviThingy/static/logo.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/navithingy.svg"
    fi
}

check() {
    echo "Skipping check() due to svelte-check issue."
    # cd "$srcdir/NaviThingy"
    # npm run check
}
