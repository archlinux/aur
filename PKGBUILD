# Maintainer: Stewart <stewart@anomaly.co>
# AUR package for hamr-bin - pre-built binaries

pkgname=hamr-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="A fast, extensible desktop launcher for Linux (pre-built binaries)"
arch=('x86_64')
url="https://github.com/Stewart86/hamr"
license=('MIT')
depends=(
    'gtk4'
    'gtk4-layer-shell'
    'python'

    # Fonts required for UI
    'ttf-material-symbols-variable'
    'ttf-jetbrains-mono-nerd'
)
optdepends=(
    'python-dbus: system dbus integration for plugins'
    'python-gobject: GObject introspection for plugins'

    # Desktop integration tools for plugins
    'wl-clipboard: clipboard operations in plugins'
    'xdg-utils: desktop integration (xdg-open)'
    'glib2: file operations (gio trash)'

    # Screenshot plugins
    'grim: screenshot capture'
    'slurp: screen region selection'

    # Screen recording
    'wf-recorder: screen recording'

    # Wallpaper
    'swww: animated wallpapers (wallpaper plugin)'
    'awww: wallpaper management'

    # Media player control
    'playerctl: media player control (player plugin)'

    # Bitwarden integration
    'bitwarden-cli: Bitwarden password manager integration'
)
provides=('hamr')
conflicts=('hamr')
replaces=('hamr-qml')
install=hamr.install
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/hamr-linux-x86_64.tar.gz")
sha256sums=('SKIP')

package() {
    cd "$srcdir/hamr-linux-x86_64"

    # Install binaries
    install -Dm755 hamr "$pkgdir/usr/bin/hamr"
    install -Dm755 hamr-daemon "$pkgdir/usr/bin/hamr-daemon"
    install -Dm755 hamr-gtk "$pkgdir/usr/bin/hamr-gtk"
    install -Dm755 hamr-tui "$pkgdir/usr/bin/hamr-tui"

    # Install plugins to system location
    install -dm755 "$pkgdir/usr/share/hamr/plugins"
    cp -r plugins/* "$pkgdir/usr/share/hamr/plugins/"

    # Fix permissions on plugin files
    find "$pkgdir/usr/share/hamr/plugins" -type f -name "*.py" -exec chmod 755 {} \;
    find "$pkgdir/usr/share/hamr/plugins" -type f -name "*.json" -exec chmod 644 {} \;

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
