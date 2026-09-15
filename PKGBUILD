# Maintainer: Juerg Rechsteiner <jrechsteiner@bluewin.ch>
# Maintainer homepage: http://computer-experte.ch
# Contributor: wergosam
# URL: https://github.com/wergosam/Pachul

pkgname=pachul
pkgver=2.2.10
pkgrel=3
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
    "pachuli.py"
)
sha256sums=('6dee67a4c7ed8d49c8e3fd12e5f0d092430c2f09fe0c4a0a7941e207d85cea1e'
            '355adac78b4a3e16647e50ef819858b36de0831c47d6f874e4a08a7f1bb83da2'
            'eb148625bfb4ad11b897e2c2e80722ebac0d4f34d94e8bda0f95a1169e88b194'
            '7d1edf9ecdf9af5fbf0e612f0256095d243be90aa8079898a762e9176e408814')
# pachuli.py is a local file, not fetched via URL — it must sit next to this
# PKGBUILD in the AUR git repo (same as the two .desktop files above).
# Checksum intentionally SKIP: unlike the tarball above (a remote download,
# where the checksum guards against tampering/corruption in transit),
# pachuli.py is maintained directly in this same git repo, so SKIP avoids
# having to recompute and update a checksum by hand on every change.
#
# uninstall.sh and the Polkit policy file (io.github.wergosam.pachul.policy)
# are NOT listed here as separate sources either — both already ship inside
# the GitHub source tarball above (top-level files in the repo), so they
# land in "$srcdir"/*/ automatically once the tarball is extracted.
# package() below picks them up from there.

prepare() {
    cd "$srcdir"/*/

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
    cd "$srcdir"/*/

    # Python-Module
    install -d "$pkgdir/usr/share/$pkgname"
    install -m644 app.py backend.py dialogs.py distro.py i18n.py icons.py \
        models.py notifier.py pkgmanager.py pkgmanager_native.py styles.py \
        tray.py window.py "$pkgdir/usr/share/$pkgname/"

    # Master-SVG-Icon liegt laut app.py direkt neben den Modulen
    install -m644 io.github.wergosam.pachul.svg "$pkgdir/usr/share/$pkgname/"

    # Schwarz-weisses Tray-Icon (tray.py / backend.py's Notify- und
    # Autostart-Icon-Pfade erwarten es direkt neben den Modulen, analog
    # zum Master-Icon oben).
    install -m644 io_github_wergosam_pachul_bw.svg "$pkgdir/usr/share/$pkgname/"

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

    # pachuli — eigener AUR-Helper (separates Projekt, siehe pachuli.py),
    # wird von Pachul bevorzugt vor yay/paru genutzt, falls vorhanden. Landet
    # hier direkt neben dem pachul-Launcher in /usr/bin, ist also ohne
    # weiteres Zutun sofort im PATH.
    install -Dm755 "$srcdir/pachuli.py" "$pkgdir/usr/bin/pachuli"

    # Uninstaller für eine ältere install.sh-Installation (siehe README,
    # Abschnitt "failed to commit transaction (conflicting files)"). Kommt
    # aus dem Source-Tarball (kein eigener source=-Eintrag nötig, siehe
    # Kommentar oben bei sha256sums) und wird unter /usr/bin/pachul-uninstall
    # bereitgestellt, damit er auch ohne separaten Git-Checkout griffbereit
    # ist, sobald Pachul einmal installiert wurde bzw. weiterhin im PATH
    # bleibt, falls install.sh und die AUR-Version abwechselnd genutzt werden.
    install -Dm755 uninstall.sh "$pkgdir/usr/bin/pachul-uninstall"

    # Polkit-Policy (optional, siehe io.github.wergosam.pachul.policy: nur
    # eine freundlichere Text-Meldung im pkexec-Dialog statt Polkits
    # generischem Fallback-Text — kein Neustart von polkitd nötig, die Datei
    # wird beim nächsten pkexec-Aufruf automatisch erkannt).
    install -Dm644 io.github.wergosam.pachul.policy \
        "$pkgdir/usr/share/polkit-1/actions/io.github.wergosam.pachul.policy"

    # Desktop-Datei + hicolor-Icon (für Menü/Dock, unabhängig vom internen
    # .icon-theme-Mechanismus von app.py)
    install -Dm644 "$srcdir/io.github.wergosam.pachul.desktop" \
        "$pkgdir/usr/share/applications/io.github.wergosam.pachul.desktop"
    install -Dm644 io.github.wergosam.pachul.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/io.github.wergosam.pachul.svg"
    install -Dm644 io_github_wergosam_pachul_bw.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/io_github_wergosam_pachul_bw.svg"

    # Autostart-Eintrag für das Tray-Icon (system-weit unter /etc/xdg/autostart,
    # wird von KDE Plasma, GNOME und XFCE gleichermassen erkannt; jeder Nutzer
    # kann es über die Autostart-Einstellungen seiner Desktop-Umgebung
    # individuell deaktivieren, ohne das Paket zu berühren).
    install -Dm644 "$srcdir/io.github.wergosam.pachul-tray.desktop" \
        "$pkgdir/etc/xdg/autostart/io.github.wergosam.pachul-tray.desktop"

    # Lizenz
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
