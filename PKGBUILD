# Maintainer: Sibren Vasse <arch@sibrenvasse.nl>
# Contributor: Ilya Gulya <ilyagulya@gmail.com>
pkgname="deezer"
pkgver=4.17.10
pkgrel=4
pkgdesc="A proprietary music streaming service"
arch=('any')
url="https://www.deezer.com/"
license=('custom:"Copyright (c) 2006-2018 Deezer S.A."')
depends=('electron5')
provides=('deezer')
makedepends=('p7zip' 'asar' 'prettier' 'imagemagick')
source=("$pkgname-$pkgver-setup.exe::https://www.deezer.com/desktop/download/artifact/win32/x86/$pkgver"
        "$pkgname.desktop"
        systray.patch
        menu-bar.patch
        oauth.patch
        nav-buttons.patch
        0001-MPRIS-interface.patch
        https://github.com/SibrenVasse/deezer/raw/mpris/node_modules.tar.xz)
sha256sums=('4fea147de6cfa4ee083a1cecf24a13230045cbca816667df6f5674a654da0b7b'
            'f8a5279239b56082a5c85487b0c261fb332623f27dac3ec8093458b8c55d8d99'
            'c024851f4c87580b4f764c88f630d77a28794338d0b43947e68939afb146bc0a'
            '964d23e5fa473bd1a78bed4213d0a546a253541e0b82337dc5929c3719bbe020'
            'bcb546b71c94fcec80cdde9a4c56df6b35f17ce3619db1bd051f446a3b5adaf0'
            '7384fbec4e6e4e5dc3b003614ac8068fe30e7fa7e3072846fc3d15a58f88be19'
            '54794e94142aa509313ffa9d53cf795cc16f9cb2483b3652825ab837d5dfb425'
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
    prettier --write "app/*.js"
    prettier --write "app/assets/cache/js/route-naboo*ads*.js"
    # Fix crash on startup since 4.14.1 (patch systray icon path)
    patch -p1 < "$srcdir/systray.patch"
    # Disable menu bar
    patch -p1 < "$srcdir/menu-bar.patch"
    # Fix oauth login
    patch -p1 < "$srcdir/oauth.patch"
    # Force enable nav buttons
    patch -p1 < "$srcdir/nav-buttons.patch"

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
    echo "exec electron5 /usr/share/deezer/app.asar \"\$@\"" >> deezer

    install -Dm644 resources/app.asar "$pkgdir"/usr/share/deezer/
    install -Dm644 resources/win/deezer.png "$pkgdir"/usr/share/icons/hicolor/256x256/apps/
    install -Dm644 resources/win/systray.png "$pkgdir"/usr/share/deezer/
    install -Dm644 "$pkgname".desktop "$pkgdir"/usr/share/applications/
    install -Dm755 deezer "$pkgdir"/usr/bin/
}
