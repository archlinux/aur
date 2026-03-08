# Maintainer: jelly
pkgname=music-tags
pkgver=1.0.0
pkgrel=1
pkgdesc="Desktop app for viewing and editing audio file metadata"
url="https://github.com/Jelly-Fish-Dev/music-tags"
arch=('any')
license=('MIT')
depends=('python' 'tk' 'python-pillow')
makedepends=('python-pip')
source=()
sha256sums=()

package() {
    local appdir="$pkgdir/usr/share/music-tags"
    install -dm755 "$appdir"

    for f in main.py musicbrainz.py tags.py theme.py ui.py; do
        install -m644 "$startdir/$f" "$appdir/"
    done

    # SVG icon — in appdir for runtime use, and in icons for the desktop
    install -m644 "$startdir/Anonymous-Music-Folder-Icon.svg" "$appdir/"
    install -Dm644 "$startdir/Anonymous-Music-Folder-Icon.svg" \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/music-tags.svg"

    # Python deps not in official repos — bundled into the app dir
    pip install --target="$appdir/lib" --no-warn-script-location \
        mutagen musicbrainzngs tkinterdnd2 sv-ttk cairosvg

    # Launcher
    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/music-tags" << 'EOF'
#!/bin/bash
export PYTHONPATH="/usr/share/music-tags/lib${PYTHONPATH:+:$PYTHONPATH}"
exec python /usr/share/music-tags/main.py "$@"
EOF
    chmod 755 "$pkgdir/usr/bin/music-tags"

    # Desktop entry
    install -Dm644 "$startdir/music-tags.desktop" \
        "$pkgdir/usr/share/applications/music-tags.desktop"
}
