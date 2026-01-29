# Maintainer: Zack Fitch <zack@johnzfitch.com>
pkgname=claude-cowork-linux
pkgver=1.1.1200
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
    'curl'
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

# Auto-fetch latest Windows installer via redirect URL
source=(
    "git+https://github.com/johnzfitch/claude-cowork-linux.git"
)
sha256sums=(
    'SKIP'  # Git source
)

# Dynamically determine version from Anthropic's latest redirect
pkgver() {
    # Follow redirect to get latest version
    local url
    url=$(curl -sL \
        -H "User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36" \
        -H "Accept: text/html,application/xhtml+xml" \
        "https://claude.ai/api/desktop/win32/x64/exe/latest/redirect" \
        -w "%{url_effective}" -o /dev/null)
    # Extract version from URL: .../1.1.1200/Claude-hash.exe
    echo "$url" | grep -oP '\d+\.\d+\.\d+' | head -1
}

prepare() {
    cd "${srcdir}"

    # Download latest Windows installer via redirect
    echo "Fetching latest Claude Desktop installer..."
    curl -L \
        -H "User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36" \
        -H "Accept: text/html,application/xhtml+xml" \
        "https://claude.ai/api/desktop/win32/x64/exe/latest/redirect" \
        -o "Claude-latest.exe"

    # Extract Windows installer (contains nupkg)
    7z x -y "Claude-latest.exe" -o"exe-extracted" >/dev/null 2>&1 || true

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

    # Extract app.asar (we run from extracted dir, not repacked asar)
    "$_asar" extract "$_app_asar" linux-app-extracted

    # Apply Linux stubs (replaces Windows/macOS native bindings)
    mkdir -p "linux-app-extracted/node_modules/@ant/claude-swift/js"
    cp -f "${srcdir}/claude-cowork-linux/stubs/@ant/claude-swift/js/index.js" \
          "linux-app-extracted/node_modules/@ant/claude-swift/js/index.js"
    cp -f "${srcdir}/claude-cowork-linux/stubs/@ant/claude-native/index.js" \
          "linux-app-extracted/node_modules/@ant/claude-native/index.js"

    # Copy frame-fix wrapper files into extracted app
    cp -f "${srcdir}/claude-cowork-linux/stubs/frame-fix/frame-fix-entry.js" \
          "linux-app-extracted/frame-fix-entry.js"
    cp -f "${srcdir}/claude-cowork-linux/stubs/frame-fix/frame-fix-wrapper.js" \
          "linux-app-extracted/frame-fix-wrapper.js"
}

package() {
    cd "${srcdir}"

    # Install extracted app directory
    install -dm755 "${pkgdir}/usr/lib/claude-cowork"
    cp -r linux-app-extracted "${pkgdir}/usr/lib/claude-cowork/"

    # Install linux-loader.js (critical wrapper for platform spoofing and fixes)
    install -Dm644 "${srcdir}/claude-cowork-linux/linux-loader.js" \
                   "${pkgdir}/usr/lib/claude-cowork/linux-loader.js"

    # Install launcher script
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/claude-cowork" <<'EOF'
#!/bin/bash
# Claude Cowork Linux launcher

# Wayland support
if [[ -n "$WAYLAND_DISPLAY" ]] || [[ "$XDG_SESSION_TYPE" == "wayland" ]]; then
    export ELECTRON_OZONE_PLATFORM_HINT=wayland
fi

cd /usr/lib/claude-cowork
exec electron linux-loader.js --no-sandbox "$@"
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
        wrestool -x -t 14 "Claude-latest.exe" -o icon.ico 2>/dev/null || true
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
