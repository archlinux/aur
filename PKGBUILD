# Maintainer: Qingxu <me@linioi.com>
pkgname=craft-agents-bin
pkgver=0.7.10
pkgrel=1
pkgdesc='Desktop app for Craft Agents'
url='https://github.com/lukilabs/craft-agents-oss'
arch=(
    'x86_64'
)
license=(
    'Apache-2.0'
)
depends=(
    'alsa-lib'
    'gtk3'
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
    "$pkgname-$pkgver-x86_64.AppImage::https://github.com/lukilabs/craft-agents-oss/releases/download/v$pkgver/Craft-Agents-$pkgver-linux-x64.AppImage"
    "LICENSE::https://raw.githubusercontent.com/lukilabs/craft-agents-oss/v$pkgver/LICENSE"
    "NOTICE::https://raw.githubusercontent.com/lukilabs/craft-agents-oss/v$pkgver/NOTICE"
)
noextract=(
    "$pkgname-$pkgver-x86_64.AppImage"
)
sha256sums=('a3c36f76a469c1a2304100cb9e2e4436eaa9726754e4e38872514435d93892ec'
            '9a75ace1224f0f880ddfdd8442d14d5a0d865152c61a2fd363d8e2c351f94d2c'
            'caa334b760b4c7835957c91ac24c3d52e7abc7ac770050445027766b4ce4ce7f')

package() {
    local _appimage="$srcdir/$pkgname-$pkgver-x86_64.AppImage"
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

    install -Dm755 /dev/stdin "$pkgdir/usr/bin/craft-agents" <<'EOF'
#!/bin/sh
exec /opt/craft-agents/AppRun --no-sandbox "$@"
EOF

    sed \
        -e 's|^Exec=.*|Exec=/usr/bin/craft-agents %U|' \
        -e 's|^Icon=.*|Icon=craft-agents|' \
        "$_appdir/@craft-agentelectron.desktop" \
        > "$pkgdir/usr/share/applications/craft-agents.desktop"

    install -Dm644 \
        "$_appdir/usr/share/icons/hicolor/512x512/apps/@craft-agentelectron.png" \
        "$pkgdir/usr/share/icons/hicolor/512x512/apps/craft-agents.png"

    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/NOTICE" "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
}
