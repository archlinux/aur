# Maintainer: daniel <metzs843@gmail.com>
#
# Local test build (from inside python/):
#   PKGEXT='.pkg.tar.zst' makepkg -si
#
# AUR publish:
#   1. Push source to GitHub, set url= below
#   2. git clone ssh://aur@aur.archlinux.org/p2record-git.git
#   3. Copy this PKGBUILD there, run: makepkg --printsrcinfo > .SRCINFO
#   4. git add PKGBUILD .SRCINFO && git commit -m "initial" && git push

pkgname=p2record-git
pkgver=0.2.0
pkgrel=1
pkgdesc='Linux game clip recorder — GTK4 + FFmpeg ring buffer, Wayland/X11, VAAPI'
arch=('any')
url='https://github.com/Varionetzwerk/p2record'
license=('MIT')
install=p2record.install
provides=('p2record')
conflicts=('p2record')

depends=(
    'python'
    'python-gobject'
    'gtk4'
    'libadwaita'
    'ffmpeg'
    'python-evdev'
    'python-xlib'
    'python-dbus'
    'gstreamer'
    'gst-plugins-base'
    'gst-plugin-pipewire'
)

optdepends=(
    'xdg-desktop-portal: Wayland screen capture (required on Wayland)'
    'xdg-desktop-portal-gnome: GNOME Wayland support'
    'xdg-desktop-portal-kde: KDE Wayland support'
    'xdg-desktop-portal-wlr: Sway/Hyprland Wayland support'
    'libayatana-appindicator: System tray icon'
    'pipewire-pulse: Desktop audio + microphone recording'
    'pulseaudio: Desktop audio + microphone recording (alternative)'
)

source=("git+$url.git")
sha256sums=('SKIP')

# Auto-reads version from the latest git tag (e.g. v0.3.0 → 0.3.0).
# yay -Syu compares this against the installed version and updates if newer.
pkgver() {
    cd "$srcdir/p2record"
    git describe --long --tags 2>/dev/null \
        | sed 's/^v//;s/-\([0-9]*\)-g[0-9a-f]*/.\1/' \
        || printf '%s.r%s.g%s' \
            "$(git log -1 --format=%ci | cut -d' ' -f1 | tr -d '-')" \
            "$(git rev-list --count HEAD)" \
            "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/p2record"
}

package() {
    local _src="$srcdir/p2record/python"

    install -dm755 "$pkgdir/usr/share/p2record"

    for dir in core ui resources; do
        cp -r "$_src/$dir" "$pkgdir/usr/share/p2record/"
    done
    install -Dm644 "$_src/main.py" "$pkgdir/usr/share/p2record/main.py"

    find "$pkgdir/usr/share/p2record" -name '__pycache__' -type d \
        -exec rm -rf {} + 2>/dev/null || true
    find "$pkgdir/usr/share/p2record" -name '*.pyc' -delete 2>/dev/null || true

    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/p2record" <<'EOF'
#!/bin/bash
exec python3 /usr/share/p2record/main.py "$@"
EOF
    chmod 755 "$pkgdir/usr/bin/p2record"

    install -Dm644 "$_src/p2record.desktop" \
        "$pkgdir/usr/share/applications/p2record.desktop"

    install -Dm644 "$_src/resources/p2record.svg" \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/p2record.svg"

    install -Dm644 "$_src/LICENSE" \
        "$pkgdir/usr/share/licenses/p2record/LICENSE"
}
