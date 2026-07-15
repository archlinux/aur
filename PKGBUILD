# Maintainer: J. Rechsteiner <jrechsteiner@bluewin.ch>
pkgname=bookmark-organisator
pkgver=1.05 # Wird beim Bauen automatisch aktualisiert
pkgrel=1
pkgdesc="Ein Tool zum Organisieren von Lesezeichen (Bookmarks)"
arch=('any')
url="https://github.com/wergosam/bookmark-organisator"
license=('GPL-3.0-or-later') # Entsprechend deiner beigefügten GPLv3-Lizenz
depends=('python' 'python-pyqt6') # PyQt6 ist laut deiner main.py eine zwingende Abhängigkeit
makedepends=('git')
provides=('bookmark-organisator')
conflicts=('bookmark-organisator')

source=("${pkgname}::git+https://github.com/wergosam/bookmark-organisator.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    # Generiert die Version basierend auf der Commit-Anzahl und dem letzten Hash
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${pkgname}"

    # 1. Programmverzeichnis erstellen und den Code dorthin kopieren
    install -d "${pkgdir}/usr/share/bookmark-organisator"
    cp -r * "${pkgdir}/usr/share/bookmark-organisator/"

    # 2. Ausführbaren Starter in /usr/bin erstellen
    install -d "${pkgdir}/usr/bin"
    cat <<EOF > "${pkgdir}/usr/bin/bookmark-organisator"
#!/bin/sh
exec python3 /usr/share/bookmark-organisator/main.py "\$@"
EOF
    chmod +x "${pkgdir}/usr/bin/bookmark-organisator"

    # =========================================================================
    # 3. NEU/ANGEPASST: Bilddatei als System-Icon installieren
    # =========================================================================
    install -d "${pkgdir}/usr/share/pixmaps"
    # Hier wird dein Icon aus dem Git-Repo in den System-Icon-Ordner kopiert:
    install -m644 "bookmark-organisator.png" "${pkgdir}/usr/share/pixmaps/bookmark-organisator.png"
    # =========================================================================

    # 4. .desktop-Datei für den Anwendungsstarter erstellen
    install -d "${pkgdir}/usr/share/applications"
    cat <<EOF > "${pkgdir}/usr/share/applications/bookmark-organisator.desktop"
[Desktop Entry]
Type=Application
Name=Bookmark Organisator
Comment=Ein Tool zum Organisieren von Lesezeichen
Exec=bookmark-organisator
Icon=bookmark-organisator
Terminal=false
Categories=Utility;Office;
EOF

    # 5. Lizenzdatei ordnungsgemäß installieren (GPLv3)
    if [ -f LICENSE ]; then
        install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    elif [ -f COPYING ]; then
        install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
    fi
}
