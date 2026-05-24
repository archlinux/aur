# Maintainer: distsystem <dev@dist.systems>

# Codex Desktop for Linux — distsystem soft-fork.
#
# Converts OpenAI's macOS Codex payload into a Linux Electron tree. Pinned to a
# patch-validated version (the appcast-versioned arm64 zip; _appver is kept in
# sync with flake.nix's codexVersion). Sourced from main (rolling): the
# distsystem fork stays rebased on upstream/main, and main is force-pushed only
# after CI validates the cross-combination, so main is always last-known-good
# — no separate tag needed.
#
# This is NOT the PKGBUILD.template path: that template is the updater-rebuild
# shell (rendered by build-pacman.sh, bundled into the update-builder and
# referenced by updater/src/builder.rs). This file is a standalone PKGBUILD
# for the no-updater pacman/AUR install path; updates come from pacman.

pkgname=codex-desktop-linux
# _appver MUST match flake.nix's codexVersion — same versioned zip.
_appver=26.513.31313
pkgver=26.513.31313
pkgrel=1
pkgdesc="Codex Desktop for Linux — distsystem soft-fork (versioned-zip pinned, no auto-updater)"
arch=('x86_64')
url="https://github.com/distsystem/codex-desktop-linux"
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
    'git'     # clone the distsystem fork (rolling main)
    '7zip'    # extract the macOS app payload
    'nodejs'  # asar patch, electron-rebuild, feature stage hooks, validate-patch-report
    'npm'     # native module install (better-sqlite3, node-pty)
    'rust'    # cargo: Computer Use + read-aloud-mcp backends
    'curl'    # Electron / managed Node downloads
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
)
provides=('codex-desktop')
conflicts=('codex-desktop')
options=('!debug' '!strip')
install="$pkgname.install"
source=(
    "$pkgname::git+https://github.com/distsystem/codex-desktop-linux.git#branch=main"
    "Codex-$_appver.zip::https://persistent.oaistatic.com/codex-app-prod/Codex-darwin-arm64-$_appver.zip"
)
sha256sums=('SKIP'
            '6001ed876cc8b62e1ae41b7c9e1246c31e7bd13eb11aa5ba7ff163bd9ef88c80')
# install.sh runs 7z on the payload itself; let it own the extraction.
noextract=("Codex-$_appver.zip")

# Installed app identity stays "codex-desktop": matches the Electron WM_CLASS,
# the ~/.config/codex-desktop settings dir, and provides/conflicts.
_appname=codex-desktop

pkgver() {
    cd "$srcdir/$pkgname"
    printf '%s.r%s.g%s' "$_appver" "$(git rev-list --count HEAD)" "$(git rev-parse --short=8 HEAD)"
}

prepare() {
    cd "$srcdir/$pkgname"
    # Enable every Linux feature; the in-app Computer Use UI is opened via the
    # env flag in build().
    cat > linux-features/features.json <<'JSON'
{"enabled":["open-target-discovery","zed-opener","copilot-reasoning-effort","read-aloud","read-aloud-mcp","conversation-mode","remote-control-ui","remote-mobile-control"]}
JSON
}

build() {
    cd "$srcdir/$pkgname"
    # Let the upstream toolchain own its compile flags; makepkg defaults can
    # break the prebuilt-runtime ABI.
    unset CFLAGS CXXFLAGS LDFLAGS

    export PACKAGE_WITH_UPDATER=0                 # updates come from pacman
    export CODEX_LINUX_ENABLE_COMPUTER_USE_UI=1   # expose the in-app Computer Use UI
    # Have install.sh write the patch report so check() can validate it.
    export CODEX_PATCH_REPORT_JSON="$srcdir/patch-report.json"

    # Pin the payload via positional arg — install-helpers.sh resets the env
    # var to empty, so $PROVIDED_DMG_PATH does nothing. Without this the
    # script falls back to downloading the rolling Codex.dmg, defeating the
    # whole versioned-zip pin.
    # Patches app.asar, rebuilds native modules, builds the Rust backends,
    # runs feature stage hooks. --fresh is non-interactive.
    ./install.sh --fresh "$srcdir/Codex-$_appver.zip"
}

check() {
    # Patch gate: every makepkg (CI + AUR users) validates that the
    # required-upstream patches actually applied against the pinned versioned
    # zip. Fails if a required patch was skipped or failed.
    cd "$srcdir/$pkgname"
    node scripts/ci/validate-patch-report.js "$srcdir/patch-report.json" --profile upstream-build
}

package() {
    cd "$srcdir/$pkgname"
    export PACKAGE_WITH_UPDATER=0

    # Variables the staging helpers expect; stage straight into $pkgdir. The
    # updater-off path skips polkit/systemd/update-builder.
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
