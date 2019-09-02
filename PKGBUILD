# Maintainer: Sibren Vasse <arch@sibrenvasse.nl>
# Contributor: Ilya Gulya <ilyagulya@gmail.com>
pkgname="deezer"
pkgver=4.16.1
pkgrel=1
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
sha256sums=('e62dab034261291d56aa776ebb531f91657049fd337153e0195c55db5b77e0f9'
            'f8a5279239b56082a5c85487b0c261fb332623f27dac3ec8093458b8c55d8d99'
            'c024851f4c87580b4f764c88f630d77a28794338d0b43947e68939afb146bc0a'
            '4a405326e0c93188cc305e196cf69684d9dddde4584c5e5dfe1587c6151d5252'
            'd4fb866b4b58924c830370ecbab6d1b38bbbdb7cc2a803ec4b6baa14c831b716'
            '964d23e5fa473bd1a78bed4213d0a546a253541e0b82337dc5929c3719bbe020'
            '59be8a818eb71220afe16816c013ae794aae974a351775e7945fc45b22d45586'
            '9ea3eb1aadfd3200fe923cb4741fbc1983912911e0468521d769673c9648dbab'
            'b9343921a4896027798597058149b9666f0782eddf8c2436291397ec5631a742')

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
