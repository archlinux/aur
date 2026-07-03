# Maintainer: vredix-openvuture <https://github.com/vredix-openvuture>
pkgname=velumeron-git
pkgver=0.1.0.r158.a296e2f
pkgrel=1
pkgdesc="Modular Hyprland desktop — quickshell bar/overlays, GUI onboarding & settings, wallust theming"
arch=('any')
url="https://github.com/vredix-openvuture/velumeron"
license=('MIT')
depends=(
    'hyprland'
    'hyprlock'
    'hypridle'
    'hyprpolkitagent'
    'quickshell'
    'rofi-wayland'
    'kitty'
    'wallust'
    'hypremoji'
    # Live video wallpapers: mpv plugin is built on first launch (cmake/ninja),
    # rendered through qt6-multimedia/-declarative.
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
    # Screenshots
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
    'openrgb: RGB peripheral lighting control (autostart example)'
    'localsend: local network file sharing'
    'nextcloud-client: cloud sync tray icon'
    'syncthing: file sync daemon'
    'pywalfox: Firefox color theme integration'
    'power-profiles-daemon: performance/powersave profiles in the bar'
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

    local dest="$pkgdir/usr/share/velumeron"
    install -dm755 "$dest"

    # Copy the whole tree — includes VERSION and CHANGELOG.md, which the
    # onboarding update-report GUI reads from the package dir.
    cp -a . "$dest/"

    # Remove development / runtime-generated artifacts
    rm -rf \
        "$dest/.git"    \
        "$dest/.claude" \
        "$dest/.vscode" \
        "$dest/.test"

    # Ensure all scripts are executable
    find "$dest" -name "*.sh" -exec chmod 755 {} +
    find "$dest/assets/scripts" -name "*.py" -exec chmod 755 {} +
    chmod 755 "$dest/welcome_to_velumeron.sh"
    chmod 755 "$dest/bin/velumeron"

    # /usr/bin entry points — symlinks so realpath() in the scripts resolves
    # back to /usr/share/velumeron.
    install -dm755 "$pkgdir/usr/bin"
    ln -s /usr/share/velumeron/bin/velumeron            "$pkgdir/usr/bin/velumeron"
    ln -s /usr/share/velumeron/welcome_to_velumeron.sh  "$pkgdir/usr/bin/velumeron-setup"

    # License
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
