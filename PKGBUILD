# Maintainer: KlapkiSzatana
pkgname=serwis-app
pkgver=2.3.2
pkgrel=1
pkgdesc="Proste Prowadzenie Serwisu"
arch=('any')
url="https://github.com/KlapkiSzatana/serwis-app"
license=('GPL-3.0')

depends=('python' 'pyside6' 'python-cryptography' 'python-pillow' 'python-requests')
optdepends=('python-barcode: obsługa kodów kreskowych na wydrukach')

# Pobieranie kodu źródłowego bezpośrednio z GitHuba
source=("git+https://github.com/KlapkiSzatana/serwis-app.git#tag=v$pkgver")
sha256sums=('SKIP')

package() {
    # Przejście do pobranego katalogu
    cd "$srcdir/$pkgname"

    install -d "${pkgdir}/usr/share/${pkgname}"

    # 1. Instalacja wszystkich plików i katalogów projektu (pomijamy metadane .git)
    find . -maxdepth 1 ! -name '.' ! -name '.git' -exec cp -r {} "${pkgdir}/usr/share/${pkgname}/" \;

    # 2. Czyszczenie i uprawnienia
    find "${pkgdir}/usr/share/${pkgname}" -type d -name '__pycache__' -prune -exec rm -r {} +
    find "${pkgdir}/usr/share/${pkgname}" -type d -exec chmod 755 {} +
    find "${pkgdir}/usr/share/${pkgname}" -type f -exec chmod 644 {} +

    # 3. Ikona systemowa
    install -Dm644 "${pkgdir}/usr/share/${pkgname}/serwisapp.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

    # 4. Skrypt startowy
    install -d "${pkgdir}/usr/bin"
    cat <<EOF > "${pkgdir}/usr/bin/${pkgname}"
#!/bin/sh
cd /usr/share/${pkgname}
exec /usr/bin/python serwis-app.py "\$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/${pkgname}"

    # 5. Desktop file
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/${pkgname}.desktop" <<EOF
[Desktop Entry]
Name=SerwisApp
GenericName=Proste Prowadzenie Serwisu
Exec=/usr/bin/${pkgname}
Icon=${pkgname}
Terminal=false
Type=Application
Categories=Office;Utility;
StartupWMClass=serwis-app
StartupNotify=true
EOF
}
