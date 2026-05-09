# Maintainer: KlapkiSzatana
pkgname=budget-app
pkgver=1.6.0
pkgrel=1
pkgdesc="Zarządzanie Budżetem Domowym"
arch=('any')
url="https://github.com/KlapkiSzatana/budget-app"
license=('GPL-3.0')
depends=('python' 'pyside6' 'python-matplotlib' 'python-pypdf' 'python-pillow')

# Pobieranie kodu źródłowego bezpośrednio z GitHuba
source=("git+https://github.com/KlapkiSzatana/budget-app.git#tag=v$pkgver")
sha256sums=('SKIP')

package() {
    # Przejście do pobranego katalogu
    cd "$srcdir/$pkgname"

    # 1. Katalog główny aplikacji w systemie
    install -d "${pkgdir}/usr/share/${pkgname}"

    # 2. Instalacja wszystkich plików projektu (pomijamy ukryte pliki, np. .git)
    find . -maxdepth 1 ! -name '.' ! -name '.git' -exec cp -r {} "${pkgdir}/usr/share/${pkgname}/" \;

    # 3. Instalacja ikony w odpowiednim katalogu systemowym
    install -Dm644 "${pkgdir}/usr/share/${pkgname}/budget.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

    # 4. Skrypt startowy (Wrapper)
    install -d "${pkgdir}/usr/bin"
    cat <<EOF > "${pkgdir}/usr/bin/${pkgname}"
#!/bin/sh
# Przejście do katalogu jest kluczowe, by importy w Pythonie działały
cd /usr/share/${pkgname}
exec /usr/bin/python budget-app.py "\$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/${pkgname}"

    # 5. Plik .desktop
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/${pkgname}.desktop" <<EOF
[Desktop Entry]
Name=Home Budget
Name[pl]=Budżet Domowy
Comment=Home Budget Management
Comment[pl]=Zarządzanie Budżetem Domowym
Exec=${pkgname}
Icon=${pkgname}
Terminal=false
Type=Application
Categories=Office;Finance;
StartupWMClass=budget-app
StartupNotify=false
EOF
}
