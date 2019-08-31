# Maintainer: Sibren Vasse <arch@sibrenvasse.nl>
# Contributor: Ilya Gulya <ilyagulya@gmail.com>
pkgname="deezer"
pkgver=4.16.0
pkgrel=3
pkgdesc="A proprietary music streaming service"
arch=('any')
url="https://www.deezer.com/"
license=('custom:"Copyright (c) 2006-2018 Deezer S.A."')
depends=('electron')
provides=('deezer')
makedepends=('p7zip' 'asar' 'prettier' 'imagemagick')
source=("$pkgname-$pkgver-setup.exe::https://www.deezer.com/desktop/download/artifact/win32/x86/$pkgver"
        "$pkgname.desktop"
        systray.patch
        nodeIntegration.patch
        urls.patch
        menu-bar.patch
        oauth.patch
        0001-MPRIS-interface.patch
        https://github.com/SibrenVasse/deezer/raw/mpris/extra_node_modules.tar.xz)
md5sums=('5dd856378377ddc944ae99d3ca958016'
         '36d184ea3ad5a0fccd71bebeed0ade27'
         '2a0a5dd017a7a302cf927f01c9fdbe85'
         'c68c0f0a44afc016da5ac2a692bc48ca'
         '0bab4bf4a6802757b84efbb552a7875b'
         '2d7b015bfc85fe13174ba434da6bd1c1'
         'fe75d3ae80ff12165400364c8bf6c9f0'
         '5c05a84c9436e3c8db74df3db821944c'
         'bf0abe1b196068808543a86f3e8bb2b0')

prepare() {
    # Extract app from installer
    7z x -so $pkgname-$pkgver-setup.exe "\$PLUGINSDIR/app-32.7z" > app-32.7z
    # Extract app archive
    7z x -y -bsp0 -bso0 app-32.7z

    # Extract png from ico container
    convert resources/win/app.ico resources/win/deezer.png

    cd resources/
    rm -r app || true
    asar extract app.asar app
    # Remove NodeRT from package (-205.72 MiB)
    rm -r app/node_modules/@nodert

    cd app
    prettier --write "app/*.js"
    # Fix crash on startup since 4.14.1 (patch systray icon path)
    patch -p1 < "$srcdir/systray.patch"
    # Fix electron 5 incompatibility
    patch -p1 < "$srcdir/nodeIntegration.patch"
    # Fix startup error electron 6.0.1 (https://github.com/electron/electron/pull/19570)
    patch -p1 < "$srcdir/urls.patch"
    # Disable menu bar
    patch -p1 < "$srcdir/menu-bar.patch"
    # Fix oauth login
    patch -p1 < "$srcdir/oauth.patch"

    # Monkeypatch MPRIS D-Bus interface
    patch -p1 < "$srcdir/0001-MPRIS-interface.patch"
    tar -xvf "$srcdir/extra_node_modules.tar.xz"

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
    install -Dm644 resources/win/deezer.png "$pkgdir"/usr/share/icons/hicolor/256x256/apps/
    install -Dm644 resources/win/systray.png "$pkgdir"/usr/share/deezer/
    install -Dm644 "$pkgname".desktop "$pkgdir"/usr/share/applications/
    install -Dm755 deezer "$pkgdir"/usr/bin/
}
