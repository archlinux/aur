# Maintainer: vredix-openvuture <https://github.com/vredix-openvuture>
pkgname=velumeron-git
pkgver=0.1.0.r306.38d8dd6
pkgrel=1
pkgdesc="Modular desktop for Wayland compositors — quickshell shell, GUI onboarding & settings, wallust theming"
arch=('any')
url="https://github.com/vredix-openvuture/velumeron"
license=('MIT')
depends=(
    'hyprland'
    'hypridle'
    'hyprpolkitagent'
    'quickshell'
    'wallust'
    'hypremoji'
    # Native wallpaper engine: the libmpv→QtQuick plugin is built on first launch.
    'mpv'
    'qt6-multimedia'
    'qt6-declarative'
    'cmake'
    'ninja'
    'playerctl'
    'jq'
    'socat'
    'fastfetch'
    'tmux'
    'network-manager-applet'
    'gnome-keyring'
    # Clipboard history (clipboard menu)
    'wl-clipboard'
    'clipvault'
    # Laptop panel + external monitor brightness
    'brightnessctl'
    'ddcutil'
    # Screenshots: grim does the capture, hyprshot is the fallback when the shell is down
    'grim'
    'hyprshot'
    # File pickers (wallpaper folders, onboarding avatar page)
    'zenity'
    # App theming: Qt platform themes + the GTK theme that honours the palette
    'qt5ct'
    'qt6ct'
    'adw-gtk-theme'
    # notify-send + video wallpaper thumbnails
    'libnotify'
    'ffmpeg'
    'python'
)
optdepends=(
    'kitty: the default terminal pick — any of foot/alacritty/wezterm/ghostty works and is themed too'
    'openrgb: RGB lighting, adds its own settings page when switched on'
    'power-profiles-daemon: performance/powersave profiles in the bar'
    'localsend: local network file sharing'
    'nextcloud-client: cloud sync tray icon'
    'syncthing: file sync daemon'
    'pywalfox: Firefox colour theme integration'
    'gamemode: game performance daemon'
)
makedepends=('git')
provides=('velumeron')
conflicts=('velumeron' 'vutureland-git')
replaces=('vutureland-git')
install=velumeron.install
source=("$pkgname::git+https://github.com/vredix-openvuture/velumeron.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    # Human-readable release from the repo's VERSION file + commit count/sha for -git ordering.
    printf "%s.r%s.%s" "$(cat VERSION 2>/dev/null || echo 0)" \
        "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$pkgname"
    # The Makefile is the single definition of what an install contains — the /usr/bin
    # entry points, the wayland session file greeters look for, the licence and the exec
    # bits. Copying the tree by hand here is what left `velumeron-session` and the SDDM
    # session entry out of the package.
    make DESTDIR="$pkgdir" PREFIX=/usr install

    # Development leftovers the payload does not carry but a git checkout has.
    rm -rf "$pkgdir/usr/share/velumeron/.git"
}
