# Maintainer: Joey Eamigh @JoeyEamigh on GitHub

# shellcheck shell=bash
# shellcheck disable=SC2034  # Variables used by makepkg
# shellcheck disable=SC2154  # srcdir/pkgdir/startdir set by makepkg

pkgname=superhuman
pkgver=1038.0.19
pkgrel=1
pkgdesc="The fastest email experience ever made (unofficial)"
arch=('x86_64')
url="https://superhuman.com"
license=('custom:proprietary')
depends=('gtk3' 'nss' 'alsa-lib' 'libxss' 'libxtst' 'libdrm' 'mesa' 'libnotify')
makedepends=('p7zip' 'nodejs' 'npm' 'wget' 'unzip')
optdepends=(
    'libappindicator-gtk3: System tray support'
    'xdg-utils: Protocol handler registration'
)
options=('!strip')
install=superhuman.install
source=(
    "Superhuman-${pkgver}.exe::https://assets.mail.superhuman.com/webapp/download/Superhuman.exe"
    "linux_tray.js"
)
sha256sums=('SKIP' 'SKIP')
noextract=("Superhuman-${pkgver}.exe")

_electron_version="38.7.1"
_patch_failures=0

# Automatically detect version from the downloaded exe
# Uncomment pkgver() for -git style versioning
# pkgver() {
#     cd "$srcdir"
#     if [ -f "VERSION" ]; then
#         cat VERSION
#     else
#         echo "1.0.0"
#     fi
# }

prepare() {
    cd "$srcdir" || return
    _patch_failures=0

    # Extract Windows installer
    msg2 "Extracting Windows installer..."
    mkdir -p extract
    7z x -y "Superhuman-${pkgver}.exe" -o"extract" > /dev/null

    # Extract the app from app-64.7z
    mkdir -p app-win
    7z x -y "extract/\$PLUGINSDIR/app-64.7z" -o"app-win" > /dev/null

    # Detect Electron version
    _electron_version=$(strings app-win/Superhuman.exe 2>/dev/null | grep -oP 'Electron/\K[0-9]+\.[0-9]+\.[0-9]+' | head -1 || echo "$_electron_version")
    msg2 "Detected Electron version: ${_electron_version}"

    # Download Electron for Linux
    msg2 "Downloading Electron ${_electron_version}..."
    mkdir -p electron
    wget -q "https://github.com/electron/electron/releases/download/v${_electron_version}/electron-v${_electron_version}-linux-x64.zip" \
        -O electron/electron.zip
    cd electron || return
    unzip -qo electron.zip
    rm electron.zip
    cd ..

    # Install asar tool
    msg2 "Installing asar tool..."
    npm install --silent @electron/asar

    # Extract app.asar
    msg2 "Extracting app.asar..."
    mkdir -p asar-contents
    npx @electron/asar extract app-win/resources/app.asar asar-contents

    # Extract version from package.json
    if [ -f "asar-contents/package.json" ]; then
        _app_version=$(grep -oP '"version"\s*:\s*"\K[^"]+' asar-contents/package.json 2>/dev/null || echo "unknown")
        msg2 "Detected Superhuman version: ${_app_version}"
        echo "${_app_version}" > VERSION
    fi

    # Apply Linux compatibility patches
    _apply_patches

    # Repack app.asar
    msg2 "Repacking app.asar..."
    npx @electron/asar pack asar-contents app.asar
}

# Graceful patch function - warns on failure instead of breaking build
_safe_sed_patch() {
    local desc="$1"
    local file="$2"
    local pattern="$3"
    local replacement="$4"
    local replace_all="${5:-false}"

    if [ ! -f "$file" ]; then
        warning "PATCH FAILED: $desc"
        warning "  File not found: $(basename "$file")"
        warning "  >>> MAINTAINER: App structure changed, update needed <<<"
        ((_patch_failures++)) || true
        return 1
    fi

    if ! grep -q "$pattern" "$file" 2>/dev/null; then
        warning "PATCH FAILED: $desc"
        warning "  Pattern not found in: $(basename "$file")"
        warning "  >>> MAINTAINER: App code changed, update needed <<<"
        ((_patch_failures++)) || true
        return 1
    fi

    if [ "$replace_all" = "true" ]; then
        sed -i "s#$pattern#$replacement#g" "$file"
    else
        sed -i "s#$pattern#$replacement#" "$file"
    fi

    msg2 "Applied: $desc"
    return 0
}

_safe_insert_patch() {
    local desc="$1"
    local file="$2"
    local after_pattern="$3"
    local text="$4"

    if [ ! -f "$file" ]; then
        warning "PATCH FAILED: $desc - File not found"
        warning "  >>> MAINTAINER: App structure changed, update needed <<<"
        ((_patch_failures++)) || true
        return 1
    fi

    if ! grep -q "$after_pattern" "$file" 2>/dev/null; then
        warning "PATCH FAILED: $desc - Pattern not found"
        warning "  >>> MAINTAINER: App code changed, update needed <<<"
        ((_patch_failures++)) || true
        return 1
    fi

    sed -i "/$after_pattern/a\\
$text" "$file"
    msg2 "Applied: $desc"
    return 0
}

_apply_patches() {
    msg2 "Applying Linux compatibility patches..."
    local src_dir="$srcdir/asar-contents/src"

    # =========================================================================
    # CORE PATCHES
    # =========================================================================

    _safe_sed_patch \
        "Memory poller: Linux support" \
        "${src_dir}/native_memory_poller.js" \
        "if (process.platform === 'darwin') {" \
        "if (process.platform === 'darwin' || process.platform === 'linux') {" \
        true

    _safe_sed_patch \
        "Window: Ctrl shortcuts for Linux" \
        "${src_dir}/window.js" \
        "} else if (process.platform === 'win32') {" \
        "} else if (process.platform === 'win32' || process.platform === 'linux') {" \
        true

    _safe_sed_patch \
        "Window: Zoom control for Linux" \
        "${src_dir}/window.js" \
        "(process.platform === 'win32' && input.control)" \
        "((process.platform === 'win32' || process.platform === 'linux') \\&\\& input.control)" \
        true

    _safe_sed_patch \
        "Main: Linux argv URL handling" \
        "${src_dir}/main.js" \
        "} else if (process.platform === 'win32') {" \
        "} else if (process.platform === 'win32' || process.platform === 'linux') {" \
        true

    _safe_sed_patch \
        "Main: Fix async download handler" \
        "${src_dir}/main.js" \
        "await fs.promises.mkdir(downloadsLocation, { recursive: true })" \
        "fs.mkdirSync(downloadsLocation, { recursive: true })"

    # =========================================================================
    # AUTO-UPDATER - Skip on Linux (use pacman)
    # =========================================================================

    if [ -f "${src_dir}/updater.js" ] && grep -q "if (appConfig.isDev) {" "${src_dir}/updater.js"; then
        _safe_insert_patch \
            "Updater: Skip on Linux" \
            "${src_dir}/updater.js" \
            "if (appConfig.isDev) {" \
"\\    // Linux: Use system package manager for updates\\
\\    if (process.platform === 'linux') {\\
\\      console.log('[Superhuman Linux] Updates managed by pacman');\\
\\      return;\\
\\    }"
    fi

    # =========================================================================
    # TRAY MODULE - Close to tray with account switcher
    # =========================================================================

    cp "$srcdir/linux_tray.js" "${src_dir}/linux_tray.js"

    # Import and initialize tray - the module self-initializes via app events
    sed -i "1i\\
if (process.platform === 'linux') { require('./linux_tray'); }" \
        "${src_dir}/main.js"

    msg2 "Applied: Tray module (self-initializing)"

    # =========================================================================
    # PATCH SUMMARY
    # =========================================================================

    if [ $_patch_failures -gt 0 ]; then
        warning "=========================================="
        warning "$_patch_failures patch(es) failed!"
        warning "The app may work but some features might be broken."
        warning ">>> MAINTAINER: Superhuman updated, patches need review <<<"
        warning "=========================================="
    fi
}

build() {
    cd "$srcdir" || return

    mkdir -p superhuman-linux/resources

    # Copy Electron files
    cp -r electron/* superhuman-linux/

    # Remove default app
    rm -f superhuman-linux/resources/default_app.asar

    # Copy patched app.asar
    cp app.asar superhuman-linux/resources/

    # Copy version file
    [ -f VERSION ] && cp VERSION superhuman-linux/

    # Rename electron binary
    mv superhuman-linux/electron superhuman-linux/superhuman-bin

    # Create wrapper script
    cat > superhuman-linux/superhuman << 'WRAPPER'
#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")" && pwd)"

ARGS=()
for arg in "$@"; do
    if [[ "$arg" == superhuman://login* ]]; then
        ARGS+=("${arg/superhuman:\/\/login/superhuman://~login}")
    else
        ARGS+=("$arg")
    fi
done

exec "${SCRIPT_DIR}/superhuman-bin" --no-sandbox "${ARGS[@]}"
WRAPPER
    chmod +x superhuman-linux/superhuman
}

package() {
    cd "$srcdir" || return

    # Install main application
    install -dm755 "$pkgdir/opt/superhuman"
    cp -r superhuman-linux/* "$pkgdir/opt/superhuman/"
    chmod +x "$pkgdir/opt/superhuman/superhuman"
    chmod +x "$pkgdir/opt/superhuman/superhuman-bin"
    chmod +x "$pkgdir/opt/superhuman/chrome_crashpad_handler"
    chmod 4755 "$pkgdir/opt/superhuman/chrome-sandbox" 2>/dev/null || true

    # Install icon (check both locations: assets/ for GitHub, root for AUR)
    local icon_src=""
    if [ -f "$startdir/assets/superhuman.png" ]; then
        icon_src="$startdir/assets/superhuman.png"
    elif [ -f "$startdir/superhuman.png" ]; then
        icon_src="$startdir/superhuman.png"
    fi
    if [ -n "$icon_src" ]; then
        install -Dm644 "$icon_src" "$pkgdir/usr/share/icons/hicolor/256x256/apps/superhuman.png"
        cp "$icon_src" "$pkgdir/opt/superhuman/"
    fi

    # Create bin symlinks
    install -dm755 "$pkgdir/usr/bin"
    ln -s /opt/superhuman/superhuman "$pkgdir/usr/bin/superhuman"

    # Install desktop file
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/superhuman.desktop" << 'EOF'
[Desktop Entry]
Name=Superhuman
Comment=The fastest email experience ever made
Exec=/opt/superhuman/superhuman %U
Icon=superhuman
Type=Application
Categories=Network;Email;
MimeType=x-scheme-handler/mailto;x-scheme-handler/superhuman;
StartupWMClass=Superhuman
Terminal=false
X-KDE-Protocols=mailto;superhuman;
EOF

    # Install autostart file (disabled by default)
    install -Dm644 /dev/stdin "$pkgdir/etc/xdg/autostart/superhuman.desktop" << 'EOF'
[Desktop Entry]
Name=Superhuman
Comment=The fastest email experience ever made
Exec=/opt/superhuman/superhuman --hidden
Icon=superhuman
Type=Application
Terminal=false
X-GNOME-Autostart-enabled=false
Hidden=true
NoDisplay=true
EOF
}
