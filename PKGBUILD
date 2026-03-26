# Maintainer: Zack Fitch <zack@internetuniverse.org>
pkgname=claude-cowork-linux
pkgver=1.1.4010
pkgrel=10
pkgdesc="Anthropic Claude Desktop with Cowork (local agent) support for Linux"
arch=('x86_64')
url="https://github.com/johnzfitch/claude-cowork-linux"
license=('custom:proprietary')
depends=(
    'electron'
    'nodejs'
)
# gnome-keyring is recommended but not required; launcher detects SecretService
# at runtime and falls back to --password-store=basic if unavailable
makedepends=(
    'p7zip'
    'npm'
    'curl'
)
optdepends=(
    'xdg-utils: for opening URLs'
    'bubblewrap: for sandbox isolation'
    'gnome-keyring: SecretService provider for secure credential storage'
    'kwallet: SecretService provider for KDE users'
    'python: for enable-cowork.py patch script'
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

source=(
    "git+https://github.com/johnzfitch/claude-cowork-linux.git"
)
sha256sums=(
    'SKIP'
)

pkgver() {
    cd "${srcdir}"

    # Use Node.js to query the DMG API
    local version
    version=$(node "${srcdir}/claude-cowork-linux/fetch-dmg.js" 2>/dev/null \
        | awk '{print $1}')

    echo "${version:-1.1.4010}"
}

prepare() {
    cd "${srcdir}"

    # Fetch latest DMG URL via Node.js, download with curl
    echo "Fetching latest Claude Desktop DMG URL..."
    local dmg_url
    dmg_url=$(node "${srcdir}/claude-cowork-linux/fetch-dmg.js" --url)
    echo "Downloading DMG from CDN..."
    curl -fSL --progress-bar -o "${srcdir}/Claude.dmg" "$dmg_url"

    # Install asar tool locally
    npm install --prefix "${srcdir}" @electron/asar >/dev/null 2>&1
}

build() {
    cd "${srcdir}"

    local _asar="${srcdir}/node_modules/.bin/asar"
    local _repo="${srcdir}/claude-cowork-linux"

    # Extract DMG with 7z
    echo "Extracting DMG..."
    local seven_z_exit=0
    7z x -y "${srcdir}/Claude.dmg" -o"${srcdir}/dmg-extracted" >/dev/null 2>&1 || seven_z_exit=$?
    # 7z exit 1 = warning (e.g. "Dangerous link path" for /Applications symlink)
    if [[ $seven_z_exit -gt 2 ]]; then
        echo "Error: Failed to extract DMG (7z exit code: $seven_z_exit)"
        return 1
    fi

    # Find Claude.app and app.asar
    local _claude_app
    _claude_app=$(find "${srcdir}/dmg-extracted" -name "Claude.app" -type d | head -1)
    if [[ -z "$_claude_app" ]]; then
        echo "Error: Claude.app not found in DMG"
        return 1
    fi

    local _app_asar="${_claude_app}/Contents/Resources/app.asar"
    if [[ ! -f "$_app_asar" ]]; then
        echo "Error: app.asar not found at: $_app_asar"
        return 1
    fi

    # Extract app.asar
    "$_asar" extract "$_app_asar" "${srcdir}/linux-app-extracted"

    # Copy unpacked native modules if present
    local _unpacked="${_claude_app}/Contents/Resources/app.asar.unpacked"
    if [[ -d "$_unpacked" ]]; then
        cp -r "$_unpacked"/* "${srcdir}/linux-app-extracted/" 2>/dev/null || true
    fi

    # Copy resources/ from DMG (i18n, icons, etc.) excluding the asar itself
    local _resources_dir="${_claude_app}/Contents/Resources"
    mkdir -p "${srcdir}/linux-app-extracted/resources"
    for item in "$_resources_dir"/*; do
        local name
        name=$(basename "$item")
        case "$name" in
            app.asar|app.asar.unpacked) continue ;;
        esac
        cp -r "$item" "${srcdir}/linux-app-extracted/resources/$name" 2>/dev/null || true
    done

    # Bake stubs into node_modules
    mkdir -p "${srcdir}/linux-app-extracted/node_modules/@ant/claude-swift/js"
    mkdir -p "${srcdir}/linux-app-extracted/node_modules/@ant/claude-native"
    cp -f "${_repo}/stubs/@ant/claude-swift/js/index.js" \
          "${srcdir}/linux-app-extracted/node_modules/@ant/claude-swift/js/index.js"
    cp -f "${_repo}/stubs/@ant/claude-native/index.js" \
          "${srcdir}/linux-app-extracted/node_modules/@ant/claude-native/index.js"

    # Copy frame-fix files
    cp -f "${_repo}/stubs/frame-fix/frame-fix-entry.js" \
          "${srcdir}/linux-app-extracted/frame-fix-entry.js"
    cp -f "${_repo}/stubs/frame-fix/frame-fix-wrapper.js" \
          "${srcdir}/linux-app-extracted/frame-fix-wrapper.js"

    # Copy cowork orchestration modules
    mkdir -p "${srcdir}/linux-app-extracted/cowork"
    cp -f "${_repo}"/stubs/cowork/*.js \
          "${srcdir}/linux-app-extracted/cowork/"
    cp -f "${_repo}"/stubs/cowork/*.sh \
          "${srcdir}/linux-app-extracted/cowork/" 2>/dev/null || true

    # Apply cowork patch
    echo "Applying cowork patch..."
    python "${_repo}/enable-cowork.py" \
        "${srcdir}/linux-app-extracted/.vite/build/index.js"

    # Repack into app.asar
    echo "Repacking app.asar..."
    "$_asar" pack "${srcdir}/linux-app-extracted" "${srcdir}/app.asar"
}

package() {
    cd "${srcdir}"

    # Install repacked app.asar
    install -Dm644 "${srcdir}/app.asar" \
                   "${pkgdir}/usr/lib/claude-cowork/app.asar"

    # Install i18n locale JSON files to electron's resources directory.
    # The app reads these via process.resourcesPath at startup, which resolves
    # to the system electron's resources dir -- not inside the asar.
    local _electron_name
    _electron_name=$(basename "$(readlink -f /usr/bin/electron)")
    local _electron_resources="/usr/lib/${_electron_name}/resources"
    mkdir -p "${pkgdir}${_electron_resources}"
    install -m644 "${srcdir}/linux-app-extracted/resources/"*.json \
        "${pkgdir}${_electron_resources}/"

    # Install plugin permission shim to electron resources dir.
    # The asar copies this to <sessionStorageDir>/shim-lib/shim.sh at session start.
    install -m755 "${srcdir}/linux-app-extracted/cowork/cowork-plugin-shim.sh" \
        "${pkgdir}${_electron_resources}/cowork-plugin-shim.sh"

    # Install launcher script
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/claude-cowork" <<'EOF'
#!/bin/bash
# Claude Cowork Linux launcher

if [[ -n "$WAYLAND_DISPLAY" ]] || [[ "$XDG_SESSION_TYPE" == "wayland" ]]; then
    export ELECTRON_OZONE_PLATFORM_HINT=wayland
fi

# Detect password store backend
PW_STORE="gnome-libsecret"
if ! dbus-send --session --print-reply --dest=org.freedesktop.DBus /org/freedesktop/DBus \
     org.freedesktop.DBus.NameHasOwner string:"org.freedesktop.secrets" 2>/dev/null \
     | grep -q "boolean true"; then
    PW_STORE="basic"
fi

exec electron /usr/lib/claude-cowork/app.asar \
    --no-sandbox \
    --disable-gpu \
    --password-store="$PW_STORE" \
    --enable-features=GlobalShortcutsPortal "$@"
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

    # Extract icon from DMG's Claude.app if available
    local _claude_app
    _claude_app=$(find "${srcdir}/dmg-extracted" -name "Claude.app" -type d 2>/dev/null | head -1)
    if [[ -n "$_claude_app" ]]; then
        local _icns="${_claude_app}/Contents/Resources/AppIcon.icns"
        # Try to convert .icns to png (icns2png from libicns)
        if [[ -f "$_icns" ]] && command -v icns2png &>/dev/null; then
            icns2png -x -s 256 "$_icns" -o "${srcdir}/" 2>/dev/null || true
            local _icon
            _icon=$(ls -S "${srcdir}/"*.png 2>/dev/null | head -1)
            if [[ -n "$_icon" ]]; then
                install -Dm644 "$_icon" \
                    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/claude-cowork.png"
            fi
        fi
    fi

    # Install license notice
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" <<EOF
Claude Desktop is proprietary software by Anthropic PBC.
This package provides a Linux compatibility layer for the macOS app.
See https://www.anthropic.com/legal/consumer-terms for terms of service.
EOF
}
