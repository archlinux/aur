# Maintainer: Juerg Rechsteiner <jrechsteiner@bluewin.ch>
# Maintainer homepage: http://computer-experte.ch
# Contributor: wergosam
# URL: https://github.com/wergosam/Pachul

pkgname=pachul
pkgver=2.2.2
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
    'libayatana-appindicator: persistent tray icon for pending updates (pachul-tray)'
)
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/wergosam/Pachul/archive/refs/tags/v$pkgver.tar.gz"
    "io.github.wergosam.pachul.desktop"
    "io.github.wergosam.pachul-tray.desktop"
)
sha256sums=('e48ed00a43bd868d26d1ed8512e11de8cae1efbe9e2becf0a07900f078c4ba2b'
            '355adac78b4a3e16647e50ef819858b36de0831c47d6f874e4a08a7f1bb83da2'
            'eb148625bfb4ad11b897e2c2e80722ebac0d4f34d94e8bda0f95a1169e88b194')

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
        notifier.py styles.py tray.py window.py "$pkgdir/usr/share/$pkgname/"

    # Master-SVG-Icon liegt laut app.py direkt neben den Modulen
    install -m644 io.github.wergosam.pachul.svg "$pkgdir/usr/share/$pkgname/"

    # Launcher
    install -d "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/pachul" <<'EOF'
#!/usr/bin/env bash
exec python3 /usr/share/pachul/app.py "$@"
EOF
    chmod 755 "$pkgdir/usr/bin/pachul"

    # Tray-Launcher (persistentes Update-Icon, siehe tray.py) — erfordert
    # optional libayatana-appindicator, wird bei fehlender Bibliothek von
    # tray.py selbst mit einer klaren Fehlermeldung abgefangen.
    cat > "$pkgdir/usr/bin/pachul-tray" <<'EOF'
#!/usr/bin/env bash
exec python3 /usr/share/pachul/tray.py "$@"
EOF
    chmod 755 "$pkgdir/usr/bin/pachul-tray"

    # Desktop-Datei + hicolor-Icon (für Menü/Dock, unabhängig vom internen
    # .icon-theme-Mechanismus von app.py)
    install -Dm644 "$srcdir/io.github.wergosam.pachul.desktop" \
        "$pkgdir/usr/share/applications/io.github.wergosam.pachul.desktop"
    install -Dm644 io.github.wergosam.pachul.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/io.github.wergosam.pachul.svg"

    # Autostart-Eintrag für das Tray-Icon (system-weit unter /etc/xdg/autostart,
    # wird von KDE Plasma, GNOME und XFCE gleichermassen erkannt; jeder Nutzer
    # kann es über die Autostart-Einstellungen seiner Desktop-Umgebung
    # individuell deaktivieren, ohne das Paket zu berühren).
    install -Dm644 "$srcdir/io.github.wergosam.pachul-tray.desktop" \
        "$pkgdir/etc/xdg/autostart/io.github.wergosam.pachul-tray.desktop"

    # Lizenz
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
