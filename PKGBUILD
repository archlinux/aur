# Maintainer: Stewart <stewart@anomaly.co>
# AUR package for hamr - builds from source

pkgname=hamr
pkgver=1.0.0
pkgrel=1
pkgdesc="A fast, extensible desktop launcher for Linux"
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
makedepends=(
    'rust'
    'cargo'
    'pkgconf'
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
replaces=('hamr-qml')
install=hamr.install
source=("$pkgname-$pkgver::git+${url}.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
    cd "$pkgname-$pkgver"
    export CARGO_TARGET_DIR=target
    cargo build --release --locked
}

package() {
    cd "$pkgname-$pkgver"

    # Install binaries
    install -Dm755 target/release/hamr "$pkgdir/usr/bin/hamr"
    install -Dm755 target/release/hamr-daemon "$pkgdir/usr/bin/hamr-daemon"
    install -Dm755 target/release/hamr-gtk "$pkgdir/usr/bin/hamr-gtk"
    install -Dm755 target/release/hamr-tui "$pkgdir/usr/bin/hamr-tui"

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
