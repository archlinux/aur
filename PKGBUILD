# Maintainer: Ilya Gulya <ilyagulya@gmail.com>
pkgname="deezer"
pkgver=4.0.5
pkgrel=1
pkgdesc="A proprietary music streaming service"
arch=('x86_64')
url="https://www.deezer.com/"
license=('custom:"Copyright (c) 2006-2018 Deezer S.A."')
depends=('electron>=3.0.10')
provides=('deezer')
options=('!strip')
makedepends=('p7zip')
source=(
"$pkgname-$pkgver-setup.exe::https://www.deezer.com/desktop/download/artifact/win32/x86/$pkgver"
"$pkgname.desktop"
)
md5sums=('cd8d1866cccc821924b37267060c005e'
         '6787e48a44061671e326ababd1a2ea8d')

package() {
    
    mkdir -p "$pkgdir"/usr/share/deezer
    mkdir -p "$pkgdir"/usr/share/applications
    mkdir -p "$pkgdir"/usr/bin/

    # Extract app from installer
    7z x -so $pkgname-$pkgver-setup.exe "\$PLUGINSDIR/app-32.7z" > app-32.7z
    # Extract electron bundle from app archive
    7z x -so app-32.7z "resources/app.asar" > app.asar
    # Extract icon from app archive
    7z x -so app-32.7z "resources/build/win/app.ico" > app.ico

    echo "#!/bin/sh" > deezer
    echo "/usr/bin/electron /usr/share/deezer/app.asar" >> deezer

    install -Dm644 app.asar "$pkgdir"/usr/share/deezer/app.asar
    install -Dm644 app.ico "$pkgdir"/usr/share/deezer/app.ico
    install -Dm644 "$pkgname".desktop "$pkgdir"/usr/share/applications/
    install -Dm755 deezer "$pkgdir"/usr/bin/deezer

}
