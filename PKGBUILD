# Maintainer: OHMCFXG <ohmcfxg at outlook dot com>
pkgname=trace-ui-git
pkgver=0.5.8.r0.gfee4276
pkgrel=1
pkgdesc="Desktop trace viewer for ARM64 execution traces (Tauri + MCP Server)"
arch=('x86_64' 'aarch64')
url="https://github.com/imj01y/trace-ui"
license=('LicenseRef-Personal-Use')
depends=(
    'webkit2gtk-4.1'
    'gtk3'
    'libsoup3'
    'glib2'
    'cairo'
    'pango'
    'gdk-pixbuf2'
    'openssl'
)
makedepends=(
    'git'
    'cargo'
    'nodejs'
    'npm'
    'pkg-config'
)
provides=('trace-ui' 'trace-cli')
conflicts=('trace-ui')
source=("${pkgname}::git+https://github.com/imj01y/trace-ui.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/-/.r/;s/-/./g' \
        || printf "%s.r%s.g%s" \
            "$(grep '^version' src-tauri/Cargo.toml | head -1 | sed 's/.*"\(.*\)"/\1/')" \
            "$(git rev-list --count HEAD)" \
            "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$pkgname"
    export CARGO_HOME="${srcdir}/cargo-home"
    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
    cd src-web
    npm install
}

build() {
    cd "$pkgname"
    export CARGO_HOME="${srcdir}/cargo-home"

    # Build frontend
    cd src-web
    npm run build
    cd ..

    # Build trace-ui (Tauri app)
    cargo build --release -p trace-ui --features custom-protocol

    # Build trace-cli (MCP Server)
    cargo build --release --bin trace-cli
}

package() {
    cd "$pkgname"

    # Install binaries
    install -Dm755 "target/release/trace-ui" "$pkgdir/usr/bin/trace-ui"
    install -Dm755 "target/release/trace-cli" "$pkgdir/usr/bin/trace-cli"

    # Install desktop entry
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/trace-ui.desktop" <<EOF
[Desktop Entry]
Name=Trace UI
Comment=Desktop trace viewer for ARM64 execution traces
Exec=trace-ui
Icon=trace-ui
Terminal=false
Type=Application
Categories=Development;Debugger;
EOF

    # Install icons
    install -Dm644 src-tauri/icons/32x32.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/trace-ui.png"
    install -Dm644 src-tauri/icons/128x128.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/trace-ui.png"
    install -Dm644 src-tauri/icons/128x128@2x.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/trace-ui.png"
    install -Dm644 src-tauri/icons/icon.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/trace-ui.png"

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
