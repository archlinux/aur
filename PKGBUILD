# Maintainer: hoornet <hoornet@users.noreply.github.com>
pkgname=wrystr-git
pkgver=0.3.0
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
    'cargo'
    'nodejs'
    'npm'
    'git'
)
provides=('wrystr')
conflicts=('wrystr')
source=("$pkgname::git+https://github.com/hoornet/wrystr.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --tags --long 2>/dev/null | sed 's/^v//;s/-/.r/;s/-/./' || echo "$pkgver"
}

build() {
    cd "$pkgname"
    npm install
    npm run tauri build -- --bundles deb
}

package() {
    cd "$pkgname"

    install -Dm755 "src-tauri/target/release/wrystr" \
        "$pkgdir/usr/bin/wrystr"

    install -Dm644 "src-tauri/icons/128x128.png" \
        "$pkgdir/usr/share/icons/hicolor/128x128/apps/wrystr.png"

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
