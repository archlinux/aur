# Maintainer: Selim Bucher <your@email>
pkgname=kiwi-shell
<<<<<<< HEAD
pkgver=0.2
=======
pkgver=0.2.0
>>>>>>> 90c236e (build: add PKGBUILD for arch)
pkgrel=1
pkgdesc="Desktop shell for Hyprland built with AGS and Astal"
arch=('x86_64')
url="https://github.com/selimbucher/kiwi-shell"
<<<<<<< HEAD
license=('MIT')
depends=(
    'gjs'
    'gtk4'
    'gtk4-layer-shell'
    'libadwaita'
    'gobject-introspection'
    'wayland'
=======
license=('GPL-3.0-or-later')
depends=(
    'gjs'
    'gtk4'
    'libadwaita'
>>>>>>> 90c236e (build: add PKGBUILD for arch)
    'swww'
    'hyprsunset'
    'brightnessctl'
    'zenity'
    'imagemagick'
    'sox'
    'psmisc'
<<<<<<< HEAD
    'ttf-quicksand'
    'whitesur-icon-theme'
    'whitesur-gtk-theme'
    # Astal libs from AUR:
    'astal-io'
    'astal4'
    'astal-battery'
    'astal-network'
    'astal-hyprland'
    'astal-wireplumber'
    'astal-mpris'
    'astal-power-profiles'
    'astal-bluetooth'
    'astal-tray'
    'astal-apps'
=======
    'libastal-meta'
>>>>>>> 90c236e (build: add PKGBUILD for arch)
)
makedepends=(
    'aylurs-gtk-shell'
    'meson'
    'ninja'
    'pkg-config'
<<<<<<< HEAD
    'wayland-protocols'
    'gobject-introspection'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/selimbucher/kiwi-shell/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')
=======
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
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/selimbucher/kiwi-shell/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c093b959afdeee133f54fd3106270244912aece933e993fbb129b711f5d13dde')
>>>>>>> 90c236e (build: add PKGBUILD for arch)

build() {
    cd "$pkgname-$pkgver"

    # Build app-capture C library
    meson setup src/app-capture build-app-capture \
        --prefix=/usr \
        --buildtype=release
    ninja -C build-app-capture
}

package() {
    cd "$pkgname-$pkgver"

    # Install app-capture
    DESTDIR="$pkgdir" ninja -C build-app-capture install

    # Install source files
    install -dm755 "$pkgdir/usr/share/kiwi-shell"
    cp -r src/kiwi-shell/* "$pkgdir/usr/share/kiwi-shell/"

    # Bundle the shell
    install -dm755 "$pkgdir/usr/bin"
    cd "$pkgdir/usr/share/kiwi-shell"
    ags bundle app.ts "$pkgdir/usr/bin/.kiwi-core" \
        --define "SRC='/usr/share/kiwi-shell'"

    # Logging wrapper
    cat > "$pkgdir/usr/bin/kiwi" << 'EOF'
#!/usr/bin/env bash
LOG_FILE="$HOME/.cache/kiwi-shell.log"
mkdir -p "$(dirname "$LOG_FILE")"
echo "--- Starting Kiwi Shell at $(date) ---" | tee -a "$LOG_FILE"
/usr/bin/.kiwi-core "$@" 2>&1 | tee -a "$LOG_FILE"
EOF
    chmod +x "$pkgdir/usr/bin/kiwi"

    # Controller script
    cat > "$pkgdir/usr/bin/kiwictl" << 'EOF'
#!/usr/bin/env bash
exec ags request "$@"
EOF
    chmod +x "$pkgdir/usr/bin/kiwictl"

    # License
<<<<<<< HEAD
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
=======
    install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
>>>>>>> 90c236e (build: add PKGBUILD for arch)
}