# Maintainer: hoornet <hoornet@users.noreply.github.com>
pkgname=wrystr-git
pkgver=0.9.0
pkgrel=1
pkgdesc="Cross-platform Nostr desktop client with Lightning integration"
arch=('x86_64')
url="https://github.com/hoornet/wrystr"
license=('MIT')
depends=(
    'webkit2gtk-4.1'
    'gtk3'
    'libayatana-appindicator'
    'openssl'
)
makedepends=(
    'rust'
    'nodejs'
    'npm'
    'git'
)
provides=('wrystr')
conflicts=('wrystr')
options=('!debug')
source=("$pkgname::git+https://github.com/hoornet/wrystr.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --tags --long 2>/dev/null | sed 's/^v//;s/-/.r/;s/-/./' || echo "$pkgver"
}

build() {
    cd "$pkgname"
    # Reset makepkg flags — they interfere with Rust cc crate
    # compiling bundled SQLite and Ring assembly
    unset CFLAGS CXXFLAGS LDFLAGS
    npm install
    npx tauri build --no-bundle
}

package() {
    cd "$pkgname"

    install -Dm755 "src-tauri/target/release/wrystr" \
        "$pkgdir/usr/bin/wrystr"

    # Strip build paths from binary (fixes $srcdir reference warning)
    strip --strip-unneeded "$pkgdir/usr/bin/wrystr"

    # Icons
    install -Dm644 "src-tauri/icons/32x32.png" \
        "$pkgdir/usr/share/icons/hicolor/32x32/apps/wrystr.png"
    install -Dm644 "src-tauri/icons/128x128.png" \
        "$pkgdir/usr/share/icons/hicolor/128x128/apps/wrystr.png"
    install -Dm644 "src-tauri/icons/128x128@2x.png" \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/wrystr.png"

    # Desktop entry
    install -Dm644 /dev/stdin \
        "$pkgdir/usr/share/applications/wrystr.desktop" << 'EOF'
[Desktop Entry]
Name=Wrystr
Comment=Nostr desktop client
Exec=env WEBKIT_DISABLE_DMABUF_RENDERER=1 /usr/bin/wrystr
Icon=wrystr
Type=Application
Categories=Network;InstantMessaging;
StartupNotify=true
EOF

    install -Dm644 "LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
