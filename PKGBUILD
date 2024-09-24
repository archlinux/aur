# Maintainer: Jan Fidra <tkmxqrd@gmail.com>
pkgname=chess-electron
pkgver=1.0.0
pkgrel=1
pkgdesc="Chess.com desktop app"
arch=('x86_64')
url="https://github.com/tkmxqrdxddd/chess-electron"
license=('ISC')
depends=('electron')
makedepends=('wget')
source=("https://www.chess.com/favicon.ico")
md5sums=('SKIP')

package() {
    # Create directories
    mkdir -p "$pkgdir/usr/lib/$pkgname"
    mkdir -p "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/usr/share/applications"
    mkdir -p "$pkgdir/usr/share/icons/hicolor/256x256/apps"

    # Convert favicon.ico to PNG
    convert "$srcdir/favicon.ico" -thumbnail 256x256 -alpha on -background none -flatten "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"

    # Create launcher script
    echo '#!/bin/sh' > "$pkgdir/usr/bin/$pkgname"
    echo "exec electron 'https://www.chess.com'" >> "$pkgdir/usr/bin/$pkgname"
    chmod +x "$pkgdir/usr/bin/$pkgname"

    # Create .desktop file
    cat > "$pkgdir/usr/share/applications/$pkgname.desktop" << EOF
[Desktop Entry]
Name=Chess.com Desktop
Exec=$pkgname
Icon=$pkgname
Type=Application
Categories=Game;
EOF
}

# Clean up downloaded files
cleanup() {
    rm -f "$srcdir/favicon.ico"
}

# Run cleanup after package() function
trap cleanup EXIT