# Maintainer: KlapkiSzatana
pkgname=archive-app
pkgver=1.1.2
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

    # 2. Instalacja wszystkich plików projektu (pomijamy ukryte pliki, np. .git)
    find . -maxdepth 1 ! -name '.' ! -name '.git' -exec cp -r {} "${pkgdir}/usr/share/${pkgname}/" \;

    # 3. Instalacja ikony w odpowiednim katalogu systemowym
    install -Dm644 "${pkgdir}/usr/share/${pkgname}/archive.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

    # 4. Skrypt startowy (Wrapper)
    install -d "${pkgdir}/usr/bin"
    cat <<EOF > "${pkgdir}/usr/bin/${pkgname}"

#!/bin/sh
exec /usr/bin/python /usr/share/${pkgname}/archive-app.py "\$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/${pkgname}"

    # 5. Plik .desktop
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/${pkgname}.desktop" <<EOF
[Desktop Entry]
Name=Home Archive
Name[pl]=Domowe Archiwum
Comment=Management Of Home Documents
Comment[pl]=Zarządzanie Domowymi Dokumentami
Exec=${pkgname}
Icon=${pkgname}
Terminal=false
Type=Application
Categories=Office;Utility;
StartupWMClass=archive-app
StartupNotify=false
EOF
}
