# Maintainer: Juerg Rechsteiner <jrechsteiner@bluewin.ch>
# Maintainer homepage: http://computer-experte.ch
# Contributor: wergosam
# URL: https://github.com/wergosam/Pachul

pkgname=pachul
pkgver=2.2.1
pkgrel=1
pkgdesc="A modern, graphical Pacman/AUR front end for Arch Linux built with GTK4 and libadwaita"
arch=('any')
url="https://github.com/wergosam/Pachul"
license=('GPL-2.0-only')
depends=(
    'python'
    'gtk4'
    'libadwaita'
    'python-gobject'
    'pacman-contrib'
    'libnotify'
)
optdepends=(
    'timeshift: snapshot integration (before/after transactions)'
    'snapper: snapshot integration (before/after transactions)'
)
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/wergosam/Pachul/archive/refs/tags/v$pkgver.tar.gz"
    "io.github.wergosam.pachul.desktop"
)
sha256sums=('42437ad25cdabe6f6b7d3bee42cf911a4ee61d3502230b2fd8494d6573792717'
            '355adac78b4a3e16647e50ef819858b36de0831c47d6f874e4a08a7f1bb83da2')

prepare() {
    cd "Pachul-$pkgver"

    # ─────────────────────────────────────────────────────────────────────
    # Wichtig für die Paketierung: app.py legt sein privates GTK-Icon-Theme
    # standardmässig NEBEN den eigenen Programmdateien an
    # (APP_DIR/.icon-theme/...). Bei einer System-Installation liegen die
    # Programmdateien aber unter /usr/share/pachul und gehören root -
    # ein normaler User kann dort zur Laufzeit keine Symlinks/Dateien mehr
    # anlegen. Wir biegen das hier auf ein User-Cache-Verzeichnis um, damit
    # das Icon-Theme beim ersten Start pro Benutzer in ~/.cache/pachul
    # aufgebaut wird, statt einen PermissionError zu werfen.
    # ─────────────────────────────────────────────────────────────────────
    sed -i \
        's|^ICON_THEME_DIR = os.path.join(APP_DIR, "\.icon-theme")|ICON_THEME_DIR = os.path.join(os.path.expanduser("~/.cache/pachul"), "icon-theme")|' \
        app.py
}

package() {
    cd "Pachul-$pkgver"

    # Python-Module
    install -d "$pkgdir/usr/share/$pkgname"
    install -m644 app.py backend.py dialogs.py i18n.py icons.py models.py \
        notifier.py styles.py window.py "$pkgdir/usr/share/$pkgname/"

    # Master-SVG-Icon liegt laut app.py direkt neben den Modulen
    install -m644 io.github.wergosam.pachul.svg "$pkgdir/usr/share/$pkgname/"

    # Launcher
    install -d "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/pachul" <<'EOF'
#!/usr/bin/env bash
exec python3 /usr/share/pachul/app.py "$@"
EOF
    chmod 755 "$pkgdir/usr/bin/pachul"

    # Desktop-Datei + hicolor-Icon (für Menü/Dock, unabhängig vom internen
    # .icon-theme-Mechanismus von app.py)
    install -Dm644 "$srcdir/io.github.wergosam.pachul.desktop" \
        "$pkgdir/usr/share/applications/io.github.wergosam.pachul.desktop"
    install -Dm644 io.github.wergosam.pachul.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/io.github.wergosam.pachul.svg"

    # Lizenz
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
