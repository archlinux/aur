# Maintainer: J. Rechsteiner <jrechsteiner@bluewin.ch>
pkgname=verlauf-leeren
pkgver=1.3.0
pkgrel=1
pkgdesc="Ein Tool zum Leeren des Verlaufs"
arch=('any')
url="https://github.com/wergosam/verlauf-leeren"
license=('GPL-3.0-or-later')
depends=('python' 'python-pyqt6')
makedepends=('git')
provides=('verlauf-leeren')
conflicts=('verlauf-leeren')

# Wichtig: Die lokale .desktop-Datei wird hier als relative Quelle hinzugefügt
source=("${pkgname}::git+https://github.com/wergosam/verlauf-leeren.git"
        "verlauf-leeren.desktop")
sha256sums=('SKIP' 'SKIP')

package() {
    cd "${pkgname}"

    # 1. Programmverzeichnis erstellen und den Code dorthin kopieren
    install -d "${pkgdir}/usr/share/verlauf-leeren"
    cp -r * "${pkgdir}/usr/share/verlauf-leeren/"

    # 2. Ausführbaren Starter in /usr/bin erstellen
    install -d "${pkgdir}/usr/bin"
    cat <<EOF > "${pkgdir}/usr/bin/verlauf-leeren"
#!/bin/sh
exec python3 /usr/share/verlauf-leeren/main.py "\$@"
EOF
    chmod +x "${pkgdir}/usr/bin/verlauf-leeren"

    # 3. Icon installieren
    if [ -f "verlauf-leeren.svg" ]; then
        install -Dm644 "verlauf-leeren.svg" \
            "${pkgdir}/usr/share/icons/hicolor/scalable/apps/verlauf-leeren.svg"
    fi

    if [ -f "verlauf-leeren.png" ]; then
        install -Dm644 "verlauf-leeren.png" \
            "${pkgdir}/usr/share/pixmaps/verlauf-leeren.png"
    fi

    # 4. .desktop-Datei korrekt aus dem Quellverzeichnis ($srcdir) installieren
    install -Dm644 "$srcdir/verlauf-leeren.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # 5. Lizenzdatei ordnungsgemäß installieren
    if [ -f LICENSE ]; then
        install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    elif [ -f COPYING ]; then
        install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
    fi
}
