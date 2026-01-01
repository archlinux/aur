# Maintainer: Stewart Wong <siwei.wong@gmail.com>
pkgname=hamr
pkgver=0.12.0
pkgrel=1
pkgdesc='Extensible launcher for Hyprland and Niri built with Quickshell'
arch=('any')
url='https://github.com/Stewart86/hamr'
license=('GPL-3.0-or-later')
depends=(
    # Core (quickshell is in extra repo)
    'quickshell'
    'qt6-5compat'

    # Python runtime
    'python'
    'python-click'

    # Thumbnail generation
    'python-loguru'
    'python-tqdm'
    'python-gobject'
    'gnome-desktop-4'

    # Clipboard
    'wl-clipboard'
    'cliphist'

    # File search
    'fd'
    'fzf'

    # Desktop integration
    'xdg-utils'
    'libnotify'
    'gtk3'
    'libpulse'
    'jq'

    # Calculator
    'libqalculate'

    # Fonts
    'ttf-material-symbols-variable'
    'ttf-jetbrains-mono-nerd'
)
optdepends=(
    'hyprland: Hyprland compositor support'
    'niri: Niri compositor support'
    'ttf-readex-pro: Reading font for cards (AUR)'
    'matugen: Material You color generation from wallpapers'
    'tesseract: OCR text extraction for screenshot search'
    'tesseract-data-eng: English OCR language data'
    'imagemagick: Alternative thumbnail generation'
    'bitwarden-cli: Bitwarden password manager integration'
    'python-keyring: Secure session storage for Bitwarden plugin'
    'slurp: Screen region selection for screenshots'
    'wf-recorder: Screen recording'
)
source=("$pkgname-$pkgver::git+${url}.git#tag=v${pkgver}")
sha256sums=('SKIP')
install=hamr.install

package() {
    cd "$srcdir/$pkgname-$pkgver"

    # Install to /etc/xdg/quickshell/hamr (system-wide quickshell config)
    install -dm755 "$pkgdir/etc/xdg/quickshell/$pkgname"
    cp -r modules services plugins scripts assets defaults "$pkgdir/etc/xdg/quickshell/$pkgname/"
    cp *.qml "$pkgdir/etc/xdg/quickshell/$pkgname/"

    # Install hamr command
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/$pkgname" <<'EOF'
#!/bin/bash
set -euo pipefail

show_help() {
    cat <<HELP
Usage: hamr [OPTIONS] [COMMAND]

Hamr - Extensible launcher for Wayland compositors

Commands:
  (none)              Start hamr daemon (use in autostart)
  toggle              Toggle hamr open/close
  plugin <name>       Open a specific plugin directly

Options:
  -h, --help          Show this help message

Examples:
  hamr                Start hamr daemon
  hamr toggle         Toggle launcher visibility
  hamr plugin clipboard   Open clipboard plugin
  hamr plugin emoji       Open emoji picker

Keybinding examples (Hyprland):
  bind = SUPER, Space, exec, hamr toggle
  bind = SUPER, V, exec, hamr plugin clipboard

Keybinding examples (Niri):
  Mod+Space { spawn "hamr" "toggle"; }
  Mod+V { spawn "hamr" "plugin" "clipboard"; }
HELP
}

case "${1:-}" in
    -h|--help)
        show_help
        exit 0
        ;;
    toggle)
        exec qs ipc -c hamr call hamr toggle
        ;;
    plugin)
        if [[ -z "${2:-}" ]]; then
            echo "Error: plugin name required" >&2
            echo "Usage: hamr plugin <name>" >&2
            exit 1
        fi
        exec qs ipc -c hamr call hamr plugin "$2"
        ;;
    "")
        exec qs -c hamr
        ;;
    *)
        echo "Error: unknown command '$1'" >&2
        echo "Run 'hamr --help' for usage" >&2
        exit 1
        ;;
esac
EOF

    # Install systemd user service (for Niri and other systemd-based compositors)
    install -Dm644 hamr.service "$pkgdir/usr/lib/systemd/user/hamr.service"
}
