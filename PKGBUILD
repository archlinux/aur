# Maintainer: Qingxu <me@linioi.com>
pkgname=craft-agents-bin
pkgver=0.15.11
pkgrel=2
pkgdesc='Claude Code-like agent for Craft documents'
url='https://github.com/lukilabs/craft-agents-oss'
arch=('x86_64')
license=(
    'Apache-2.0'
)
depends=(
    'alsa-lib'
    'gtk3'
    'hicolor-icon-theme'
    'nss'
    'xdg-utils'
)
makedepends=(
    '7zip'
)
provides=(
    'craft-agents'
)
conflicts=(
    'craft-agents'
)
options=(
    '!strip'
    '!debug'
)
source=(
    "$pkgname-$pkgver-linux-x64.AppImage::https://github.com/lukilabs/craft-agents-oss/releases/download/v$pkgver/Craft-Agents-$pkgver-linux-x64.AppImage"
    "$pkgname-$pkgver-NOTICE::https://raw.githubusercontent.com/lukilabs/craft-agents-oss/v$pkgver/NOTICE"
)
noextract=(
    "$pkgname-$pkgver-linux-x64.AppImage"
)
sha256sums=('56c5148748ada34e9c85f6c391f5332b60ecc3187da2850bcdd8befb58aa11de'
            'caa334b760b4c7835957c91ac24c3d52e7abc7ac770050445027766b4ce4ce7f')

package() {
    local _appimage="$srcdir/$pkgname-$pkgver-linux-x64.AppImage"
    local _appdir="$srcdir/appimage-root"

    install -dm755 "$_appdir"
    7z x -y "$_appimage" "-o$_appdir" >/dev/null

    install -dm755 \
        "$pkgdir/opt/craft-agents" \
        "$pkgdir/usr/bin" \
        "$pkgdir/usr/share/applications" \
        "$pkgdir/usr/share/icons/hicolor/512x512/apps" \
        "$pkgdir/usr/share/licenses/$pkgname"

    cp -a "$_appdir/." "$pkgdir/opt/craft-agents/"
    chmod -R u=rwX,go=rX "$pkgdir/opt/craft-agents"
    chmod 4755 "$pkgdir/opt/craft-agents/chrome-sandbox"

    install -Dm755 /dev/stdin "$pkgdir/usr/bin/craft-agents" <<'EOF'
#!/bin/sh
export APPDIR=/opt/craft-agents
exec "$APPDIR/AppRun" \
    --enable-wayland-ime \
    --wayland-text-input-version=3 \
    "$@"
EOF

    sed \
        -e 's|^Exec=.*|Exec=/usr/bin/craft-agents %U|' \
        -e 's|^Icon=.*|Icon=craft-agents|' \
        "$_appdir/@craft-agentelectron.desktop" |
        install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/craft-agents.desktop"

    install -Dm644 \
        "$_appdir/usr/share/icons/hicolor/512x512/apps/@craft-agentelectron.png" \
        "$pkgdir/usr/share/icons/hicolor/512x512/apps/craft-agents.png"

    install -Dm644 "$srcdir/$pkgname-$pkgver-NOTICE" "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
}
