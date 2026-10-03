# Maintainer: Joey Eamigh @JoeyEamigh on GitHub

# shellcheck shell=bash
# shellcheck disable=SC2034  # Variables used by makepkg
# shellcheck disable=SC2154  # srcdir/pkgdir/startdir set by makepkg

pkgname=superhuman
pkgver=1041.0.65
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
    "linux_patches.js"
    "linux_shim.js"
)
sha256sums=('SKIP'
            'e7354121be70d07d6a69150bb37376a2a16b9253b17762b723fb1a9a8714e56b'
            '859be0a8e8a72c25c8288380dae29e281cd9e20a81cc8ddb46d99537295afd20')
noextract=("Superhuman-${pkgver}.exe")

_electron_version="41.10.6"

prepare() {
    cd "$srcdir" || return

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

    msg2 "Installing build tools..."
    npm install --silent @electron/asar acorn

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

    msg2 "Applying Linux compatibility patches..."
    NODE_PATH="$srcdir/node_modules" node "$srcdir/linux_patches.js" asar-contents/dist/main.js

    # Repack app.asar
    msg2 "Repacking app.asar..."
    npx @electron/asar pack asar-contents app.asar
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
