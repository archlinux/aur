# Maintainer: Samuobe samuobe@ik.me

pkgname=arch-store-git
pkgver=2.0.2.26.g224ca52
pkgrel=1
pkgdesc="A graphical app for managing your programs with pacman, AUR, flatpak, and appimage"
arch=('any')
url="https://github.com/Samuobe/Arch-Store"
license=('GPL3')
depends=('python' 'python-pyqt6')
makedepends=('git' 'python-setuptools')
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
    cd Arch-Store
    git describe --tags --always | sed 's/^v//;s/-/./g'
}

package() {
    # Copia tutto il progetto in /usr/share/arch-store
    install -d "$pkgdir/usr/share/arch-store"
    cp -r "$srcdir/Arch-Store/"* "$pkgdir/usr/share/arch-store/"

    # Crea la cartella dati globale con permessi corretti
    install -dm1777 "$pkgdir/var/lib/arch-store"
    

    # Crea un wrapper in /usr/bin
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/arch-store" <<EOF
#!/bin/sh
exec python3 /usr/share/arch-store/main.py "\$@"
EOF

    # Icona
    install -Dm644 "$srcdir/Arch-Store/icon.png" "$pkgdir/usr/share/pixmaps/arch-store.png"

    # File .desktop
    install -Dm644 "$srcdir/Arch-Store/arch-store.desktop" "$pkgdir/usr/share/applications/arch-store.desktop"

    install -Dm644 /dev/null "$pkgdir/usr/share/arch-store/AUR"
}

