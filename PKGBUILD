# Maintainer: Sibren Vasse <arch@sibrenvasse.nl>
# Contributor: Ilya Gulya <ilyagulya@gmail.com>
pkgname="deezer"
pkgver=4.17.21
pkgrel=1
pkgdesc="A proprietary music streaming service"
arch=('any')
url="https://www.deezer.com/"
license=('custom:"Copyright (c) 2006-2018 Deezer S.A."')
depends=('electron6')
provides=('deezer')
makedepends=('p7zip' 'asar' 'prettier' 'imagemagick')
source=("$pkgname-$pkgver-setup.exe::https://www.deezer.com/desktop/download/artifact/win32/x86/$pkgver"
        "$pkgname.desktop"
        systray.patch
        menu-bar.patch
        oauth.patch
        0001-MPRIS-interface.patch
        https://github.com/SibrenVasse/deezer/raw/mpris/node_modules.tar.xz)
sha256sums=('433fe36ee19c4b13eb715bd740a6ae325199b00da15c4ea376b03944cb57b0fe'
            'f8a5279239b56082a5c85487b0c261fb332623f27dac3ec8093458b8c55d8d99'
            'f7df7ba3dd91d8d327c3bfe69c65d3969b3f7a80ca253c29bad316e09f65ab8b'
            '9c1a1c809f813646f14355af03670f6c10a5ad47c606b0ef45e1b66b6aa559b5'
            '5cbe1696d5f948cdda1fdd5ef9f8d94d5e14d8594558e35472517fa659057add'
            '7cd2ba25d61bbd86d49ca99be96366e72fc6e6a57d50bdbeacf1a6a5535c3e76'
            '8a8a42fd38c6fc5a5f9523620ce7e794355ceec5d71c93a7cee378c9a5b3d8ec')

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

    prettier --write "build/*.js"
    # Fix crash on startup since 4.14.1 (patch systray icon path)
    patch -p1 < "$srcdir/systray.patch"
    # Disable menu bar
    patch -p1 < "$srcdir/menu-bar.patch"
    # Fix oauth login
    patch -p1 < "$srcdir/oauth.patch"

    # Monkeypatch MPRIS D-Bus interface
    patch -p1 < "$srcdir/0001-MPRIS-interface.patch"
    tar -xvf "$srcdir/node_modules.tar.xz"

    cd ..
    asar pack app app.asar
}

package() {
    mkdir -p "$pkgdir"/usr/share/deezer
    mkdir -p "$pkgdir"/usr/share/applications
    mkdir -p "$pkgdir"/usr/share/icons/hicolor/256x256/apps/
    mkdir -p "$pkgdir"/usr/bin/

    echo "#!/bin/sh" > deezer
    echo "exec electron6 /usr/share/deezer/app.asar \"\$@\"" >> deezer

    install -Dm644 resources/app.asar "$pkgdir"/usr/share/deezer/
    install -Dm644 resources/win/deezer.png "$pkgdir"/usr/share/icons/hicolor/256x256/apps/
    install -Dm644 resources/win/systray.png "$pkgdir"/usr/share/deezer/
    install -Dm644 "$pkgname".desktop "$pkgdir"/usr/share/applications/
    install -Dm755 deezer "$pkgdir"/usr/bin/
}
