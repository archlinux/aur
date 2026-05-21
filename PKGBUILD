# Maintainer: fecet <xiezej@gmail.com>

# Community Linux rebuild of the macOS OpenAI Codex Desktop app. The packaging
# logic lives upstream at https://github.com/ilysenko/codex-desktop-linux and
# converts the proprietary Codex.dmg into a runnable Linux Electron tree.
#
# The macOS app payload is pinned to the appcast-versioned arm64 zip
# (Codex-darwin-arm64-$_appver.zip) and checksummed, so the build is reproducible.
# _appver tracks the Sparkle appcast shortVersionString (bumped by apply.sh/
# nvchecker); pkgver() appends the git rev so patch-logic changes also bump pkgver.

pkgname=codex-desktop-linux
_appver=26.513.31313   # Sparkle appcast shortVersionString; bumped by apply.sh/nvchecker
pkgver=26.513.31313.dev.r626.g33395586   # placeholder; pkgver() derives the real value
pkgrel=1
pkgdesc="Codex Desktop for Linux — community rebuild of the macOS OpenAI Codex Desktop app (all Linux features, no auto-updater)"
arch=('x86_64')
url="https://github.com/ilysenko/codex-desktop-linux"
license=('MIT')
depends=(
    'python'
    # Electron runtime libraries
    'alsa-lib'
    'at-spi2-core'
    'atk'
    'cairo'
    'dbus'
    'glib2'
    'gtk3'
    'libcups'
    'libdrm'
    'libx11'
    'libxcb'
    'libxcomposite'
    'libxdamage'
    'libxext'
    'libxfixes'
    'libxkbcommon'
    'libxrandr'
    'mesa'
    'nspr'
    'nss'
    'pango'
)
makedepends=(
    'git'     # source clone
    '7zip'    # modern 7z/7zz for the APFS DMG (old p7zip is rejected by check_deps)
    'nodejs'  # asar patch, electron-rebuild, feature stage hooks
    'npm'     # native module install (better-sqlite3, node-pty)
    'rust'    # cargo: Computer Use + read-aloud-mcp backends
    'curl'    # DMG / Electron / managed Node downloads
    'unzip'   # Electron runtime extraction
)
optdepends=(
    'nodejs>=22.22.0: override the bundled managed Node.js runtime'
    'npm: Codex CLI install/update flows'
    'zenity: GTK dialog fallback when the Codex CLI is missing'
    'kdialog: KDE dialog fallback when the Codex CLI is missing'
    'ydotool: synthetic keyboard/pointer input for Computer Use on Wayland'
    'xdg-desktop-portal-wlr: screenshot/remote-desktop portal backend (niri/sway/wlroots)'
    'xdg-desktop-portal-gnome: screenshot/remote-desktop portal backend (GNOME/Mutter)'
    'alsa-utils: audio playback for Read Aloud'
    'speech-dispatcher: system TTS bridge for Read Aloud'
    'espeak-ng: offline TTS fallback for Read Aloud'
    'python-pip: bootstrap the Kokoro voice runtime for Read Aloud'
)
provides=('codex-desktop')
conflicts=('codex-desktop')
options=('!debug' '!strip')
install="$pkgname.install"
source=(
    "$pkgname::git+https://github.com/ilysenko/codex-desktop-linux.git"
    "Codex-$_appver.zip::https://persistent.oaistatic.com/codex-app-prod/Codex-darwin-arm64-$_appver.zip"
)
sha256sums=('SKIP'
            '6001ed876cc8b62e1ae41b7c9e1246c31e7bd13eb11aa5ba7ff163bd9ef88c80')

# Installed app identity stays "codex-desktop": it matches the Electron app's
# WM_CLASS and settings dir (~/.config/codex-desktop) and the upstream native
# package, so the desktop entry binds the taskbar icon correctly.
_appname=codex-desktop

pkgver() {
    cd "$srcdir/$pkgname"
    printf '%s.dev.r%s.g%s' "$_appver" "$(git rev-list --count HEAD)" "$(git rev-parse --short=8 HEAD)"
}

prepare() {
    cd "$srcdir/$pkgname"

    # Enable every Linux feature except the no-op example; the in-app Computer
    # Use UI is opened separately via an env flag in build().
    cat > linux-features/features.json <<'JSON'
{"enabled":["open-target-discovery","zed-opener","copilot-reasoning-effort","read-aloud","read-aloud-mcp","conversation-mode","remote-control-ui","remote-mobile-control"]}
JSON
}

build() {
    cd "$srcdir/$pkgname"

    # Let the upstream toolchain (electron-rebuild, cargo, node-gyp) own its
    # compile flags; makepkg defaults can break the prebuilt-runtime ABI.
    unset CFLAGS CXXFLAGS LDFLAGS

    export PACKAGE_WITH_UPDATER=0                 # updates come from pacman/AUR
    export CODEX_LINUX_ENABLE_COMPUTER_USE_UI=1   # expose the in-app Computer Use UI

    # Pin the macOS app payload to the appcast-versioned arm64 zip (no versioned
    # .dmg exists); 7z extracts the .app and only the JS asar + webview are used
    # (native modules are rebuilt for Linux), so the macOS arch is irrelevant.
    export PROVIDED_DMG_PATH="$srcdir/Codex-$_appver.zip"

    # codex-app/: patches app.asar, rebuilds native modules, builds Rust backends,
    # runs feature stage hooks. --fresh is non-interactive.
    ./install.sh --fresh
}

package() {
    cd "$srcdir/$pkgname"

    export PACKAGE_WITH_UPDATER=0

    # Variables build-pacman.sh sets before sourcing the staging helpers; we
    # stage straight into $pkgdir instead of rendering a template + nesting
    # makepkg. The updater-off path skips polkit/systemd/update-builder.
    export REPO_DIR="$PWD"
    export APP_DIR="$PWD/codex-app"
    export PACKAGE_NAME="$_appname"
    export PACKAGE_DISPLAY_NAME="Codex Desktop"
    export PACKAGE_COMMENT="Run Codex Desktop on Linux"
    export ICON_SOURCE="$PWD/assets/codex.png"
    export DESKTOP_TEMPLATE="$PWD/packaging/linux/codex-desktop.desktop"
    export PACKAGED_RUNTIME_SOURCE="$PWD/packaging/linux/codex-packaged-runtime.sh"

    . "$PWD/scripts/lib/package-common.sh"

    ensure_app_layout
    stage_common_package_files "$pkgdir"
    write_launcher_stub "$pkgdir"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
