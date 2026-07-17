# Maintainer: J. Rechsteiner <jrechsteiner@bluewin.ch>
pkgname=bookmark-organisator
pkgver=1.0.5
pkgrel=1
pkgdesc="Ein Tool zum Organisieren von Lesezeichen (Bookmarks)"
arch=('any')
url="https://github.com/wergosam/bookmark-organisator"
license=('GPL-3.0-or-later') # Entsprechend deiner beigefügten GPLv3-Lizenz
depends=('python' 'python-pyqt6') # PyQt6 ist laut deiner main.py eine zwingende Abhängigkeit
makedepends=('git')
provides=('bookmark-organisator')
conflicts=('bookmark-organisator')
install=bookmark-organisator.install

source=("${pkgname}::git+https://github.com/wergosam/bookmark-organisator.git")
sha256sums=('SKIP')

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
    # 3. Icon korrekt installieren
    #    WICHTIG: KDE/Plasma sucht Taskleisten- und Fenster-Header-Icons primär
    #    im hicolor-Icon-Theme (/usr/share/icons/hicolor/...), NICHT nur in
    #    /usr/share/pixmaps. Deshalb wird die SVG zusätzlich dort installiert.
    #    /usr/share/pixmaps bleibt als Fallback für ältere Anwendungen erhalten.
    # =========================================================================
    if [ -f "bookmark-organisator.svg" ]; then
        install -Dm644 "bookmark-organisator.svg" \
            "${pkgdir}/usr/share/icons/hicolor/scalable/apps/bookmark-organisator.svg"
    fi

    install -Dm644 "bookmark-organisator.png" \
        "${pkgdir}/usr/share/pixmaps/bookmark-organisator.png"
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
