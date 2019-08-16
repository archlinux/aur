# Maintainer: Sibren Vasse <arch@sibrenvasse.nl>
# Contributor: Ilya Gulya <ilyagulya@gmail.com>
pkgname="deezer"
pkgver=4.15.0
pkgrel=2
pkgdesc="A proprietary music streaming service"
arch=('any')
url="https://www.deezer.com/"
license=('custom:"Copyright (c) 2006-2018 Deezer S.A."')
depends=('electron')
provides=('deezer')
makedepends=('p7zip' 'asar' 'prettier')
source=(
         "$pkgname-$pkgver-setup.exe::https://www.deezer.com/desktop/download/artifact/win32/x86/$pkgver"
         "$pkgname.desktop"
         systray.patch
         nodeIntegration.patch
         urls.patch
         frameless.patch
)
md5sums=('208423389ef47f1c70d60d6e591202e0'
         'bb851102d63a9cb396b42d7a61c5104c'
         '4a491cdf76afeffb7680d3abdc3f4b89'
         '199ce71cc60dd7feb84ee36a8580639d'
         '7ee49aab9514e5a4df00fbd7da982688'
         '3ffc8aa66157da1088eeeaa4b3f05587')

prepare() {
    # Extract app from installer
    7z x -so $pkgname-$pkgver-setup.exe "\$PLUGINSDIR/app-32.7z" > app-32.7z
    # Extract app archive
    7z x -y -bsp0 -bso0 app-32.7z

    cd resources/
    rm -r app || true
    asar extract app.asar app
    # Remove NodeRT from package (-205.72 MiB)
    rm -r app/node_modules/@nodert

    cd app
    prettier --write "app/js/**/*.js"
    # Fix crash on startup since 4.14.1 (patch systray icon path)
    patch -p1 < "$srcdir/systray.patch"
    # Fix electron 5 incompatibility
    patch -p1 < "$srcdir/nodeIntegration.patch"
    # Fix startup error electron 6.0.1 (https://github.com/electron/electron/pull/19570
    patch -p1 < "$srcdir/urls.patch"
    # Disable menu bar
    patch -p1 < "$srcdir/frameless.patch"

    cd ..
    asar pack app app.asar
}

package() {
    mkdir -p "$pkgdir"/usr/share/deezer
    mkdir -p "$pkgdir"/usr/share/applications
    mkdir -p "$pkgdir"/usr/share/icons/hicolor/256x256/apps/
    mkdir -p "$pkgdir"/usr/bin/

    echo "#!/bin/sh" > deezer
    echo "exec electron /usr/share/deezer/app.asar \"\$@\"" >> deezer

    install -Dm644 resources/app.asar "$pkgdir"/usr/share/deezer/
    install -Dm644 resources/build/win/app.ico "$pkgdir"/usr/share/icons/hicolor/256x256/apps/deezer.png
    install -Dm644 resources/build/win/systray.png "$pkgdir"/usr/share/deezer/
    install -Dm644 "$pkgname".desktop "$pkgdir"/usr/share/applications/
    install -Dm755 deezer "$pkgdir"/usr/bin/
}
