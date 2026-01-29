# Maintainer: Zack Fitch <zack@johnzfitch.com>
pkgname=claude-cowork-linux
pkgver=1.23.26
pkgrel=1
pkgdesc="Official Anthropic Claude Desktop with Cowork (local agent) support for Linux"
arch=('x86_64')
url="https://github.com/johnzfitch/claude-cowork-linux"
license=('custom:proprietary')
depends=(
    'electron'
    'bubblewrap'
    'nodejs'
)
makedepends=(
    'p7zip'
    'npm'
)
optdepends=(
    'xdg-utils: for opening URLs'
)
provides=('claude-cowork')
conflicts=('claude-cowork')
options=('!strip')
source=(
    "Claude-${pkgver}.dmg::https://storage.googleapis.com/osprey-downloads-c02f6a0d-347c-492b-a752-3e0651722e97/nest/Claude.dmg"
    "git+https://github.com/johnzfitch/claude-cowork-linux.git#tag=v${pkgver}"
)
sha256sums=(
    'SKIP'  # DMG checksum varies with updates
    'SKIP'  # Git source
)

prepare() {
    cd "${srcdir}"

    # Extract DMG
    7z x -y "Claude-${pkgver}.dmg" -o"dmg-extracted" >/dev/null 2>&1 || true

    # Find Claude.app
    _claude_app=$(find dmg-extracted -name "Claude.app" -type d | head -1)
    if [[ -z "$_claude_app" ]]; then
        echo "Error: Claude.app not found in DMG"
        return 1
    fi

    # Install asar tool locally
    npm install --prefix "${srcdir}" @electron/asar >/dev/null 2>&1
}

build() {
    cd "${srcdir}"

    _claude_app=$(find dmg-extracted -name "Claude.app" -type d | head -1)
    _asar="${srcdir}/node_modules/.bin/asar"

    # Extract app.asar
    "$_asar" extract "$_claude_app/Contents/Resources/app.asar" app-extracted

    # Apply Linux stub (replaces macOS-specific Swift bindings)
    cp -f "${srcdir}/claude-cowork-linux/stubs/@ant/claude-swift/js/index.js" \
          "app-extracted/node_modules/@ant/claude-swift/js/index.js"

    # Repack asar
    "$_asar" pack app-extracted app.asar
}

package() {
    cd "${srcdir}"

    # Install app.asar
    install -Dm644 app.asar "${pkgdir}/usr/lib/claude-cowork/app.asar"

    # Install launcher script
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/claude-cowork" <<'EOF'
#!/bin/bash
# Claude Cowork Linux launcher

# Wayland support
if [[ -n "$WAYLAND_DISPLAY" ]] || [[ "$XDG_SESSION_TYPE" == "wayland" ]]; then
    export ELECTRON_OZONE_PLATFORM_HINT=wayland
fi

exec electron /usr/lib/claude-cowork/app.asar "$@"
EOF

    # Install desktop entry
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/claude-cowork.desktop" <<EOF
[Desktop Entry]
Name=Claude Cowork
Comment=Anthropic Claude Desktop with local agent support
Exec=claude-cowork %U
Icon=claude-cowork
Type=Application
Categories=Development;Utility;
MimeType=x-scheme-handler/claude;
StartupWMClass=Claude
EOF

    # Install icon (extract from app if available, otherwise use placeholder)
    _claude_app=$(find dmg-extracted -name "Claude.app" -type d | head -1)
    if [[ -f "$_claude_app/Contents/Resources/electron.icns" ]]; then
        # Convert icns to png (if icns2png available) or just copy
        install -Dm644 "$_claude_app/Contents/Resources/electron.icns" \
            "${pkgdir}/usr/share/icons/hicolor/256x256/apps/claude-cowork.icns"
    fi

    # Install license notice
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" <<EOF
Claude Desktop is proprietary software by Anthropic PBC.
This package provides a Linux compatibility layer for the official macOS app.
See https://www.anthropic.com/legal/consumer-terms for terms of service.
EOF
}
