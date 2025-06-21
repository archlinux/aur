# Maintainer: Agustin Carrasco <asermax@gmail.com>

pkgname=claudia
pkgver=0.1.0
pkgrel=1
pkgdesc="A powerful GUI app and Toolkit for Claude Code"
arch=('x86_64')
url="https://github.com/getAsterisk/claudia"
license=('MIT')
depends=('claude-code' 'webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'librsvg' 'sqlite')
makedepends=('rust' 'bun-bin' 'git' 'pkg-config' 'xdo')
source=("git+https://github.com/getAsterisk/claudia.git")
sha256sums=('SKIP')

prepare() {
    cd "$srcdir/$pkgname"

    # Install frontend dependencies
    bun install
}

build() {
    cd "$srcdir/$pkgname"

    # Workaround as per: https://archlinux.org/todo/lto-fat-objects/
    export CFLAGS+=" -ffat-lto-objects"

    # Build the application
    bun run tauri build --no-bundle
}

package() {
    cd "$srcdir/$pkgname"

    # Install the binary
    install -Dm755 "src-tauri/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

    # Generate and install desktop file
    mkdir -p "$pkgdir/usr/share/applications"
    cat > "$pkgdir/usr/share/applications/$pkgname.desktop" << EOF
[Desktop Entry]
Type=Application
Version=${pkgver}
Name=Claudia
Comment=A powerful GUI app and Toolkit for Claude Code
Exec=/usr/bin/$pkgname
Icon=$pkgname
Terminal=false
Categories=Development;Utility;
StartupWMClass=claudia
EOF

    # Install icon (if available)
    if [ -f "src-tauri/icons/icon.png" ]; then
        install -Dm644 "src-tauri/icons/icon.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
    fi

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
