# Maintainer: Zack Fitch <zack@johnzfitch.com>
pkgname=claude-cowork-linux
pkgver=1.1.799
pkgrel=1
pkgdesc="Anthropic Claude Desktop with Cowork (local agent) support for Linux"
arch=('x86_64')
url="https://github.com/johnzfitch/claude-cowork-linux"
license=('custom:proprietary')
depends=(
    'electron'
    'nodejs'
)
makedepends=(
    'p7zip'
    'npm'
)
optdepends=(
    'xdg-utils: for opening URLs'
    'bubblewrap: for sandbox isolation'
)
provides=('claude-cowork' 'claude-desktop')
conflicts=(
    'claude-cowork'
    'claude-desktop'
    'claude-desktop-bin'
    'claude-desktop-native'
    'claude-desktop-appimage'
)
options=('!strip')

# Windows installer - same source as claude-desktop-debian
_claude_hash="2e02b656cbbb1f14a5a81a4ed79b1c5ea1427507"
source=(
    "Claude-${pkgver}.exe::https://downloads.claude.ai/releases/win32/x64/${pkgver}/Claude-${_claude_hash}.exe"
    "git+https://github.com/johnzfitch/claude-cowork-linux.git#tag=v${pkgver}"
)
sha256sums=(
    'SKIP'  # Installer checksum
    'SKIP'  # Git source
)

prepare() {
    cd "${srcdir}"

    # Extract Windows installer (contains nupkg)
    7z x -y "Claude-${pkgver}.exe" -o"exe-extracted" >/dev/null 2>&1 || true

    # Find and extract the nupkg (it's a zip file)
    _nupkg=$(find exe-extracted -name "*.nupkg" | head -1)
    if [[ -z "$_nupkg" ]]; then
        echo "Error: nupkg not found in installer"
        return 1
    fi
    7z x -y "$_nupkg" -o"nupkg-extracted" >/dev/null 2>&1

    # Install asar tool locally
    npm install --prefix "${srcdir}" @electron/asar >/dev/null 2>&1
}

build() {
    cd "${srcdir}"

    _asar="${srcdir}/node_modules/.bin/asar"

    # Find app.asar in extracted nupkg
    _app_asar=$(find nupkg-extracted -name "app.asar" | head -1)
    if [[ -z "$_app_asar" ]]; then
        echo "Error: app.asar not found"
        return 1
    fi

    # Extract app.asar
    "$_asar" extract "$_app_asar" app-extracted

    # Apply Linux stubs (replaces Windows/macOS native bindings)
    cp -f "${srcdir}/claude-cowork-linux/stubs/@ant/claude-swift/js/index.js" \
          "app-extracted/node_modules/@ant/claude-swift/js/index.js"
    cp -f "${srcdir}/claude-cowork-linux/stubs/@ant/claude-native/index.js" \
          "app-extracted/node_modules/@ant/claude-native/index.js"

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

exec electron /usr/lib/claude-cowork/app.asar --no-sandbox "$@"
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

    # Extract and install icon from Windows exe
    if command -v wrestool &>/dev/null && command -v icotool &>/dev/null; then
        wrestool -x -t 14 "Claude-${pkgver}.exe" -o icon.ico 2>/dev/null || true
        if [[ -f icon.ico ]]; then
            icotool -x icon.ico -o . 2>/dev/null || true
            _icon=$(ls -S *.png 2>/dev/null | head -1)
            if [[ -n "$_icon" ]]; then
                install -Dm644 "$_icon" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/claude-cowork.png"
            fi
        fi
    fi

    # Install license notice
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" <<EOF
Claude Desktop is proprietary software by Anthropic PBC.
This package provides a Linux compatibility layer for the official Windows app.
See https://www.anthropic.com/legal/consumer-terms for terms of service.
EOF
}
