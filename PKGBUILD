# Maintainer: Joey Eamigh @JoeyEamigh on GitHub

# shellcheck shell=bash
# shellcheck disable=SC2034  # Variables used by makepkg
# shellcheck disable=SC2154  # srcdir/pkgdir/startdir set by makepkg

pkgname=superhuman
pkgver=1041.0.51
pkgrel=1
pkgdesc="The fastest email experience ever made (unofficial)"
arch=('x86_64')
url="https://superhuman.com"
license=('custom:proprietary')
depends=('gtk3' 'nss' 'alsa-lib' 'libcups' 'libxkbcommon' 'libdrm' 'mesa' 'libnotify')
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
sha256sums=('SKIP'
            '2ca108b624f8e444e3ad4a70f5d066342a85dc6d245ce63220a91e5c2b4cfd25')
noextract=("Superhuman-${pkgver}.exe")

_electron_version="41.6.1"
_failed_patches=()

prepare() {
    cd "$srcdir" || return
    _failed_patches=()

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
    _write_patch_tool
    _apply_patches

    # Repack app.asar
    msg2 "Repacking app.asar..."
    npx @electron/asar pack asar-contents app.asar
}

# The main process ships as a single webpack bundle, so every patch is an exact
# literal replacement guarded by an expected match count. A drifted match string
# fails loudly instead of silently clobbering an unrelated module.
_write_patch_tool() {
    cat > "$srcdir/apply_patch.js" << 'PATCHER'
const fs = require('fs')

const [file, expected, find, replace] = process.argv.slice(2)
const parts = fs.readFileSync(file, 'utf8').split(find)
const found = parts.length - 1

if (found !== Number(expected)) {
  process.stderr.write(`  expected ${expected} match(es), found ${found}\n`)
  process.stderr.write(`  anchor: ${find.split('\n')[0].trim().slice(0, 100)}\n`)
  process.exit(1)
}

fs.writeFileSync(file, parts.join(replace))
PATCHER
}

# _bundle_patch <description> required|optional <expected matches> <find> <replace>
# A required patch aborts the build; an optional one is reported in the summary.
_bundle_patch() {
    local desc="$1"
    local importance="$2"
    local count="$3"
    local find="$4"
    local replace="$5"

    if node "$srcdir/apply_patch.js" "$srcdir/asar-contents/dist/main.js" "$count" "$find" "$replace"; then
        msg2 "Applied: $desc"
        return 0
    fi

    if [ "$importance" = "required" ]; then
        error "REQUIRED PATCH FAILED: $desc"
        error ">>> MAINTAINER: Superhuman changed, patches need review <<<"
        return 1
    fi

    warning "OPTIONAL PATCH FAILED: $desc"
    _failed_patches+=("$desc")
    return 0
}

_apply_patches() {
    msg2 "Applying Linux compatibility patches..."
    local dist_dir="$srcdir/asar-contents/dist"

    if [ ! -f "$dist_dir/main.js" ]; then
        error "Superhuman bundle layout changed: dist/main.js not found"
        return 1
    fi

    # Upstream already hides the last window instead of closing it, but gates
    # that on macOS. Without this the window teardown runs on every close and
    # destroys the tabs behind a still-visible window.
    _bundle_patch \
        "Window: Close to tray instead of quitting" \
        required \
        1 \
        "        if (this.main.windows.length === 1 && isMac && !isForceQuitting) {" \
        "        if (this.main.windows.length === 1 && (isMac || process.platform === 'linux') && !isForceQuitting) {"

    _bundle_patch \
        "Updater: Skip on Linux, updates come from pacman" \
        required \
        1 \
        "  async _startUpdate() {" \
        "  async _startUpdate() {
    if (process.platform === 'linux') {
      this.setStage(stages.SKIPPED)
      return
    }"

    _bundle_patch \
        "Window: Ctrl shortcuts for Linux" \
        optional \
        1 \
        "    _registerShortcuts(view) {" \
        "    _registerShortcuts(view) {
        if (process.platform === 'linux') {
            this._registerWindowsShortcuts(view);
            return;
        }"

    _bundle_patch \
        "Window: Zoom control for Linux" \
        optional \
        1 \
        "(process.platform === 'win32' && input.control)" \
        "((process.platform === 'win32' || process.platform === 'linux') && input.control)"

    _bundle_patch \
        "Main: Linux argv URL handling" \
        optional \
        1 \
        "    } else if (process.platform === 'win32') {
      // the \`open-url\` event is Mac-only, so on Windows startup we check argv directly" \
        "    } else if (process.platform === 'win32' || process.platform === 'linux') {
      // the \`open-url\` event is Mac-only, so on Windows startup we check argv directly"

    # wasOpenedAsHidden() is macOS-only, so the autostart entry's --hidden flag
    # is otherwise ignored.
    _bundle_patch \
        "Main: Honor --hidden on Linux" \
        optional \
        1 \
        "    let launchHidden = process.platform === 'win32' ? false : this._loginItem.wasOpenedAsHidden()" \
        "    let launchHidden = process.argv.includes('--hidden') || (process.platform === 'win32' ? false : this._loginItem.wasOpenedAsHidden())"

    # Tray module - close to tray with a show/hide and quit menu
    cp "$srcdir/linux_tray.js" "$dist_dir/linux_tray.js"
    sed -i "1i\\
if (process.platform === 'linux') require('./linux_tray');" "$dist_dir/main.js"
    msg2 "Applied: Tray module (self-initializing)"

    if [ ${#_failed_patches[@]} -gt 0 ]; then
        warning "=========================================="
        warning "${#_failed_patches[@]} optional patch(es) failed:"
        local desc
        for desc in "${_failed_patches[@]}"; do
            warning "  - $desc"
        done
        warning "The app will run but these features are missing."
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

# Electron resolves the desktop entry from this when registering itself as the
# mailto:/superhuman: handler via xdg-settings.
export CHROME_DESKTOP="${CHROME_DESKTOP:-superhuman.desktop}"

ARGS=()
for arg in "$@"; do
    if [[ "$arg" == superhuman://login* ]]; then
        ARGS+=("${arg/superhuman:\/\/login/superhuman://~login}")
    else
        ARGS+=("$arg")
    fi
done

exec "${SCRIPT_DIR}/superhuman-bin" "${ARGS[@]}"
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

    # Fallback sandbox for kernels without unprivileged user namespaces
    chmod 4755 "$pkgdir/opt/superhuman/chrome-sandbox"

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

    install -Dm644 superhuman-linux/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE.electron"

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
StartupWMClass=superhuman
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
