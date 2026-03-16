# Maintainer: Selim Bucher <your@email>
pkgname=kiwi-shell
pkgver=0.3.0
pkgrel=1
pkgdesc="Desktop shell for Hyprland built with AGS and Astal"
arch=('x86_64')
url="https://github.com/selimbucher/kiwi-shell"
license=('GPL-3.0-or-later')
depends=(
    'gjs'
    'gtk4'
    'libadwaita'
    'libsoup'
    'swww'
    'hyprsunset'
    'brightnessctl'
    'zenity'
    'imagemagick'
    'psmisc'
    'libastal-meta'
    'kiwi-settings'
)
makedepends=(
    'aylurs-gtk-shell'
    'meson'
    'ninja'
    'pkg-config'
    'wayland'
    'wayland-protocols'
    'gobject-introspection'
    'glib2'
    'dart-sass'
)
optdepends=(
    'networkmanager: network status'
    'bluez: bluetooth support'
    'power-profiles-daemon: power profile switching'
    'wireplumber: audio control'
    'pipewire: audio support'
    'upower: battery status'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/selimbucher/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('bf02208c6598fd89d49e9029ae49ad39859e82204ed9ee1ae9d4820b4b924cf8')

build() {
    cd "$pkgname-$pkgver"

    meson setup src/app-capture build-app-capture \
        --prefix=/usr \
        --buildtype=release
    ninja -C build-app-capture
}

package() {
    cd "$pkgname-$pkgver"

    DESTDIR="$pkgdir" ninja -C build-app-capture install

    install -dm755 "$pkgdir/usr/bin"
    ags bundle src/kiwi-shell/app.tsx "$pkgdir/usr/bin/.kiwi-core" \
        --define "SRC='/usr/share/kiwi-shell'"

    install -dm755 "$pkgdir/usr/share/kiwi-shell"
    cp -r src/kiwi-shell/* "$pkgdir/usr/share/kiwi-shell/"

    cat > "$pkgdir/usr/bin/kiwi" << 'EOF'
#!/usr/bin/env bash
LOG_FILE="$HOME/.cache/kiwi-shell.log"
mkdir -p "$(dirname "$LOG_FILE")"
echo "--- Starting Kiwi Shell at $(date) ---" | tee -a "$LOG_FILE"
/usr/bin/.kiwi-core "$@" 2>&1 | tee -a "$LOG_FILE"
EOF
    chmod +x "$pkgdir/usr/bin/kiwi"

    cat > "$pkgdir/usr/bin/kiwictl" << 'EOF'
#!/usr/bin/env bash
exec ags request "$@"
EOF
    chmod +x "$pkgdir/usr/bin/kiwictl"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}