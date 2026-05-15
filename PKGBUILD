# Maintainer: KlapkiSzatana
pkgname=archive-app
pkgver=1.3.0
pkgrel=1
pkgdesc="Zarządzanie Domowymi Dokumentami"
arch=('any')
url="https://github.com/KlapkiSzatana/archive-app"
license=('GPL-3.0')
depends=('python' 'pyside6' 'python-pillow')

# Pobieranie kodu źródłowego bezpośrednio z GitHuba
source=("git+https://github.com/KlapkiSzatana/archive-app.git#tag=v$pkgver")
sha256sums=('SKIP')

package() {
    # Przejście do pobranego katalogu
    cd "$srcdir/$pkgname"

    # 1. Katalog główny aplikacji w systemie
    install -d "${pkgdir}/usr/share/${pkgname}"
    install -m644 archive-app.py "${pkgdir}/usr/share/${pkgname}/"
    install -m644 logic.py "${pkgdir}/usr/share/${pkgname}/"

    # 2. Instalacja wszystkich plików projektu (pomijamy ukryte pliki, np. .git)
    find . -maxdepth 1 ! -name '.' ! -name '.git' -exec cp -r {} "${pkgdir}/usr/share/${pkgname}/" \;

    # 3. Instalacja ikony w odpowiednim katalogu systemowym
    install -Dm644 archive.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -m644 archive.png "${pkgdir}/usr/share/${pkgname}/archive.png"

    # 4. Skrypt startowy (Wrapper)
    install -d "${pkgdir}/usr/bin"
    cat <<EOF > "${pkgdir}/usr/bin/${pkgname}"
#!/bin/sh
exec /usr/bin/python /usr/share/${pkgname}/archive-app.py "\$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/${pkgname}"

    # Plik .desktop
    install -d "${pkgdir}/usr/share/applications"
    cat <<EOF > "${pkgdir}/usr/share/applications/${pkgname}.desktop"
[Desktop Entry]
Name=Home Archive
Name[pl]=Domowe Archiwum
Comment=Management of home documents
Comment[pl]=Zarządzanie Domowymi Dokumentami
Exec=/usr/bin/${pkgname}
Icon=${pkgname}
Terminal=false
Type=Application
Categories=Office;Utility;
StartupWMClass=archive-app
StartupNotify=true
EOF
    chmod 644 "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
