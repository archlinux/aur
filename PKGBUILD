# Maintainer: Gabriel Limieri <limieri at protonmail dot com>
pkgname=emendo
pkgver=1.0.1
pkgrel=1
pkgdesc="Lightweight GTK4/libadwaita media exporter for quick and powerful trimming, cropping and re-encoding workflows"
arch=('any')
url="https://github.com/Gabriel2Silva/Emendo"
license=('GPL-3.0-only')
depends=(
    'python'
    'python-gobject'
    'gtk4'
    'libadwaita'
    'gst-python'
    'gstreamer'
    'gst-plugins-base'
    'gst-plugins-good'
    'gst-plugins-bad'
    'gst-plugins-ugly'
    'gst-libav'
    'gst-plugin-gtk4'
    'ffmpeg'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('fdd16526c4315154013a7e88bab94873b24ca64bcebc4c101724cc82039d8073')

package() {
    cd "Emendo-$pkgver"

    local sharedir="$pkgdir/usr/share/emendo"
    install -dm755 "$sharedir"
    for f in emendo.py constants.py media_services.py gst_player.py utils.py exceptions.py; do
        install -Dm644 "$f" "$sharedir/$f"
    done

    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/emendo" << 'EOF'
#!/usr/bin/env sh
set -eu
export PYTHONPATH="/usr/share/emendo${PYTHONPATH:+:$PYTHONPATH}"
exec /usr/bin/python3 /usr/share/emendo/emendo.py "$@"
EOF
    chmod 755 "$pkgdir/usr/bin/emendo"

    install -Dm644 flatpak/io.github.Gabriel2Silva.Emendo.desktop \
        "$pkgdir/usr/share/applications/io.github.Gabriel2Silva.Emendo.desktop"

    install -Dm644 flatpak/io.github.Gabriel2Silva.Emendo.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/io.github.Gabriel2Silva.Emendo.svg"

    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
