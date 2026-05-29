# Maintainer: vredix-openvuture <https://github.com/vredix-openvuture>
pkgname=vutureland-git
pkgver=r1.0000000
pkgrel=1
pkgdesc="Modular Hyprland desktop configuration — compositor, bar, theming, and settings GUI"
arch=('any')
url="https://github.com/vredix-openvuture/vutureland"
license=('MIT')
depends=(
    'hyprland'
    'hyprlock'
    'hypridle'
    'hyprpolkitagent'
    'waybar'
    'rofi-wayland'
    'kitty'
    'python'
    'python-gobject'
    'gtk4'
    'libadwaita'
    'gtk4-layer-shell'
    'swww'
    'wallust'
    'swaync'
    'playerctl'
    'jq'
    'socat'
    'imagemagick'
    'grim'
    'fastfetch'
    'fish'
    'cava'
    'wl-clipboard'
    'network-manager-applet'
    'gnome-keyring'
    'clipvault'
)
optdepends=(
    'hyprshot: region screenshot support'
    'ffmpeg: video wallpaper support'
    'mpvpaper: animated video wallpapers'
    'openrgb: RGB peripheral lighting control'
    'ddcutil: external monitor brightness control'
    'tmux: terminal multiplexer'
    'localsend: local network file sharing'
    'pywalfox: Firefox color theme integration'
    'nextcloud-client: cloud sync tray icon'
    'power-profiles-daemon: performance/powersave profiles'
    'gamemode: game performance daemon'
)
makedepends=('git')
provides=('vutureland')
conflicts=('vutureland')
install=vutureland.install
source=("$pkgname::git+https://github.com/vredix-openvuture/vutureland.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$pkgname"

    local dest="$pkgdir/usr/share/vutureland"
    install -dm755 "$dest"

    # Copy all project files
    cp -a . "$dest/"

    # Remove development / runtime-generated artifacts
    rm -rf \
        "$dest/.git"      \
        "$dest/.claude"   \
        "$dest/.vscode"   \
        "$dest/.test"     \
        "$dest/gui/settings.json"

    # Ensure all scripts are executable
    find "$dest" -name "*.sh" -exec chmod 755 {} +
    chmod 755 "$dest/welcome_to_vutureland.sh"
    chmod 755 "$dest/bin/vutureland"

    # /usr/bin/vutureland → symlink so realpath() in the launcher resolves correctly
    install -dm755 "$pkgdir/usr/bin"
    ln -s /usr/share/vutureland/bin/vutureland "$pkgdir/usr/bin/vutureland"

    # License
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
