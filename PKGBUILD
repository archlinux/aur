# Maintainer: Isaac Arcia <[EMAIL]>
pkgname=yawns
pkgver=1.3.1
pkgrel=1
pkgdesc="Your Adaptable Widget Notification System"
arch=('any')
url="https://github.com/ikz87/yawns"
license=('GPL-3.0')
depends=(
    'python'
    'python-pyqt6'
    'python-dbus-next'
    'python-pillow'
    'python-cssutils'
    'python-xlib'
    'python-gobject'
    'python-setproctitle'
    'gtk3'
    'qt6-base'
    'qt6-wayland'
    'wayland'
)
makedepends=(
    'make'
    'gcc'
    'pkgconf'
    'qt6-base'
    'qt6-wayland'
    'wayland'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('50915b3a4ef25a11e215a3021d2348a68ed01ed61f54857b9e12a1a6efd5c54b')

build() {
    cd "$srcdir/$pkgname-$pkgver"

    # Native Wayland helper (wlr-layer-shell). Only needed on Wayland, but it
    # is cheap to build and keeps a single package for both display servers.
    make -C src/backends/wayland
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    # Application tree
    install -d "$pkgdir/usr/lib/$pkgname"
    cp -r src assets LICENSE.md "$pkgdir/usr/lib/$pkgname/"

    # Native helper: install next to the Python backend and drop the
    # intermediate build directory copied along with the source tree.
    install -Dm755 "src/backends/wayland/build/libyawns_wayland.so" \
        "$pkgdir/usr/lib/$pkgname/src/backends/wayland/libyawns_wayland.so"
    rm -rf "$pkgdir/usr/lib/$pkgname/src/backends/wayland/build"

    # Assets
    install -d "$pkgdir/usr/share/$pkgname/assets"
    install -m644 assets/vinyl.png "$pkgdir/usr/share/$pkgname/assets/vinyl.png"
    install -m644 assets/yawns-logo.png "$pkgdir/usr/share/$pkgname/assets/yawns-logo.png"

    # Launcher: seed the user config on first run, then start yawns.
    install -d "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/$pkgname" <<'EOF'
#!/bin/bash
if [ ! -d "$HOME/.config/yawns" ]; then
    mkdir -p "$HOME/.config/yawns"
    cp "/usr/lib/yawns/src/config.ini" "$HOME/.config/yawns/config.ini"
    cp "/usr/lib/yawns/src/style.qss" "$HOME/.config/yawns/style.qss"
fi

exec python3 /usr/lib/yawns/src/app.py "$@"
EOF
    chmod +x "$pkgdir/usr/bin/$pkgname"
}
