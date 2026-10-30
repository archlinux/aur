# Maintainer: distsystem <dev@dist.systems>

# Codex Desktop for Linux, distsystem soft-fork.
#
# Patches OpenAI's official Linux package into the fork's distribution, pinned
# to the version nix/upstream-linux-packages.json carries so a build always
# targets the payload the patches were validated against. Sourced from main
# (rolling): the distsystem fork stays rebased on upstream/main, and main is
# force-pushed only after CI validates the cross-combination, so main is always
# last-known-good, with no separate tag needed.
#
# This is a standalone PKGBUILD for the no-updater pacman/AUR install path;
# updates come from pacman. packaging/linux/PKGBUILD.template is a different
# path: the updater-rebuild shell rendered by build-pacman.sh, bundled into the
# update-builder and referenced by updater/src/builder.rs.

pkgname=codex-desktop-linux
# Copied from nix/upstream-linux-packages.json; prepare() asserts they agree.
_appver=26.1027.30824
pkgver=26.1027.30824
pkgrel=1
pkgdesc="Codex Desktop for Linux, distsystem soft-fork (official Linux package pinned, no auto-updater)"
arch=('x86_64')
url="https://github.com/distsystem/codex-desktop-linux"
license=('MIT')
# Runtime libraries the official ChatGPT ELF links against, matching
# packaging/linux/PKGBUILD.template minus the updater's polkit.
depends=(
    'curl'
    'nodejs'
    'xdg-utils'
    'alsa-lib'
    'at-spi2-core'
    'atk'
    'cairo'
    'dbus'
    'expat'
    'gdk-pixbuf2'
    'glib2'
    'graphite'
    'gtk3'
    'libcups'
    'libdrm'
    'libglvnd'
    'libnotify'
    'libusb'
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
    'openssl'
    'pango'
    'systemd-libs'
    'tpm2-tss'
    'xz'
)
makedepends=(
    'git'     # clone the distsystem fork (rolling main)
    'dpkg'    # dpkg-deb: read and unpack the official Linux package
    'python'  # candidate promotion helpers
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
_debfile="chatgpt_${_appver}_amd64.deb"
source=(
    "$pkgname::git+https://github.com/distsystem/codex-desktop-linux.git#branch=main"
    "$_debfile::https://persistent.oaistatic.com/codex-app-prod/linux/deb/pool/main/c/chatgpt/$_debfile"
)
sha256sums=('SKIP'
            '4e139a44f7c917a643f2dd014ad32298dd30aec6d324d323524b190f7667684c')
# install.sh runs dpkg-deb on the payload itself; let it own the extraction.
noextract=("$_debfile")

# Installed app identity stays "codex-desktop": matches the Electron WM_CLASS,
# the ~/.config/codex-desktop settings dir, and provides/conflicts.
_appname=codex-desktop

pkgver() {
    cd "$srcdir/$pkgname"
    printf '%s.r%s.g%s' "$_appver" "$(git rev-list --count HEAD)" "$(git rev-parse --short=8 HEAD)"
}

prepare() {
    cd "$srcdir/$pkgname"

    # makepkg evaluates source=() before the git source is cloned, so the
    # version and checksum cannot be read from the tree at that point. They are
    # copied above and asserted against their source of truth here, so drift
    # fails the build instead of quietly packaging a different payload.
    local pinned_version pinned_sha
    pinned_version="$(node -p 'require("./nix/upstream-linux-packages.json").version')"
    pinned_sha="$(node -p 'require("./nix/upstream-linux-packages.json").amd64.sha256')"
    if [ "$pinned_version" != "$_appver" ] || [ "$pinned_sha" != "${sha256sums[1]}" ]; then
        echo "error: PKGBUILD pins $_appver/${sha256sums[1]}, nix/upstream-linux-packages.json pins $pinned_version/$pinned_sha" >&2
        return 1
    fi

    # The in-app Computer Use UI is opened via the env flag in build().
    # record-and-replay pulls in chronicle-skysight through its feature.json.
    cat > linux-features/features.json <<'JSON'
{
  "enabled": [
    "copilot-reasoning-effort",
    "read-aloud",
    "read-aloud-mcp",
    "remote-control-ui",
    "remote-mobile-control",
    "cli-model-visibility",
    "computer-use-linux",
    "tray-usage",
    "frameless-titlebar",
    "directory-only-working-tree-watch",
    "node-repl-reaper",
    "mcp-helper-reaper",
    "preferred-editor-file-links",
    "pet-overlay",
    "persistent-status-panel",
    "authored-message-visibility",
    "project-task-sort",
    "project-group-last-updated-sort",
    "model-picker-default-presets",
    "record-and-replay",
    "agent-workspace",
    "automation-extensions",
    "filesystem-root-follow-ups"
  ],
  "settings": {
    "model-picker-default-presets": {
      "presets": [
        {"model": "gpt-6-luna", "effort": "medium"},
        {"model": "gpt-6-astra", "effort": "medium", "default": true},
        {"model": "gpt-6.1-sol", "effort": "high"}
      ]
    }
  }
}
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

    # Feature stage hooks copy prebuilt release binaries into the app tree.
    # The Makefile target owns which crate each enabled feature needs, so it
    # reads the features.json prepare() wrote rather than repeating that map.
    make build-native-feature-helpers

    # Pass the payload positionally: without a path install.sh resolves the
    # package through signed APT metadata and picks up whatever version is
    # current, defeating the pin. Patches app.asar, rebuilds native modules,
    # builds the Rust backends, runs feature stage hooks. --fresh is
    # non-interactive.
    ./install.sh --fresh "$srcdir/$_debfile"
}

check() {
    # Patch gate: every makepkg (CI + AUR users) validates that the
    # required-upstream patches actually applied against the pinned official
    # Linux package. Fails if a required patch was skipped or failed.
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
    assert_official_payload_architecture amd64
    stage_common_package_files "$pkgdir"
    write_launcher_stub "$pkgdir"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
