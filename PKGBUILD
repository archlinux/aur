# Maintainer: m39d
pkgname=crosshair-overlay
pkgver=0.1.2
pkgrel=1
pkgdesc="Native Wayland crosshair overlay for gaming, with a graphical settings tool"
arch=('any')
url="https://github.com/m39d/crosshair-overlay"
license=('MIT')
depends=(
    'python'
    'python-gobject'
    'gtk4'
    'gtk4-layer-shell'
    'python-cairo'
    'gdk-pixbuf2'
)

# Pulls the v$pkgver tag's source tarball straight from GitHub. The
# archive extracts into a "crosshair-overlay-$pkgver/" folder (GitHub's
# standard naming for tag archives), which is why every path in
# package() below is prefixed with "$pkgname-$pkgver/".
source=("$pkgname-$pkgver.tar.gz::https://github.com/m39d/crosshair-overlay/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('121312e5066265bb151e727eb20d0a4d61d91c285939b7bb28097a5a2d18acec')

package() {
    local libdir="$pkgdir/usr/lib/crosshair-overlay"
    local extracted="$srcdir/$pkgname-$pkgver"

    # The actual Python source lives under /usr/lib, not /usr/bin --
    # crosshair_common.py needs to sit next to the other three scripts
    # so Python's "script's own directory goes on sys.path" behavior
    # finds it, and /usr/lib keeps that implementation detail out of
    # the user's PATH.
    install -Dm644 "$extracted/crosshair_common.py" "$libdir/crosshair_common.py"
    install -Dm644 "$extracted/crosshaird.py"        "$libdir/crosshaird.py"
    install -Dm644 "$extracted/crosshair-gui.py"     "$libdir/crosshair-gui.py"
    install -Dm644 "$extracted/crosshairctl.py"      "$libdir/crosshairctl.py"

    install -Dm644 "$extracted/crosshair-overlay.desktop" \
        "$pkgdir/usr/share/applications/crosshair-overlay.desktop"
    install -Dm644 "$extracted/crosshair-overlay.svg" \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/crosshair-overlay.svg"

    install -Dm644 "$extracted/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$extracted/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "$extracted/config.example.toml" "$pkgdir/usr/share/doc/$pkgname/config.example.toml"

    # Thin wrapper executables on PATH. Each one execs the real .py file
    # by its full /usr/lib path (not a symlink) so that when Python sets
    # sys.path[0], it resolves to /usr/lib/crosshair-overlay -- exactly
    # where crosshair_common.py lives. A symlink in /usr/bin pointing at
    # the same file would NOT reliably give the same result, since the
    # interpreter sees the invoked path, not always the symlink target.
    install -d "$pkgdir/usr/bin"
    for name in crosshaird crosshair-gui crosshairctl; do
        cat > "$pkgdir/usr/bin/$name" <<EOF
#!/bin/sh
exec /usr/bin/python3 "/usr/lib/crosshair-overlay/$name.py" "\$@"
EOF
        chmod 755 "$pkgdir/usr/bin/$name"
    done
}
