# Maintainer: Selim Bucher <me@selim.one>
pkgname=kiwi-shell
pkgver=0.4.0
pkgrel=2
pkgdesc="Desktop shell for Hyprland built with AGS and Astal"
arch=('x86_64')
url="https://github.com/selimbucher/kiwi-shell"
license=('GPL-3.0-or-later')
depends=(
    'gjs'
    'gtk4'
    'libadwaita'
    'libsoup3'
    'awww'
    'hyprsunset'
    'brightnessctl'
    'zenity'
    'imagemagick'
    'libpulse'
    'psmisc'
    'glib2'
    'libastal-meta'
    'libastal-quarrel-git'
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
sha256sums=('28d547a24efdf31911836c833b668c45d279d4e6389e7024c94086a75ecf3286')

build() {
    cd "$pkgname-$pkgver"

    meson setup src/app-capture build-app-capture \
        --prefix=/usr \
        --buildtype=release
    ninja -C build-app-capture

    meson setup src/hyprland-shortcuts build-hyprland-shortcuts \
        --prefix=/usr \
        --buildtype=release
    ninja -C build-hyprland-shortcuts
}

package() {
    cd "$pkgname-$pkgver"

    DESTDIR="$pkgdir" ninja -C build-app-capture install
    DESTDIR="$pkgdir" ninja -C build-hyprland-shortcuts install

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

    # "--" stops the ags CLI from eating flags meant for the shell's own
    # quarrel-based command parser
    cat > "$pkgdir/usr/bin/kiwictl" << 'EOF'
#!/usr/bin/env bash
exec ags request -- "$@"
EOF
    chmod +x "$pkgdir/usr/bin/kiwictl"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
