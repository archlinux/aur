# Maintainer: Sibren Vasse <arch@sibrenvasse.nl>
# Contributor: Ilya Gulya <ilyagulya@gmail.com>
pkgname="deezer"
pkgver=4.15.0
pkgrel=1
pkgdesc="A proprietary music streaming service"
arch=('any')
url="https://www.deezer.com/"
license=('custom:"Copyright (c) 2006-2018 Deezer S.A."')
depends=('electron')
provides=('deezer')
options=('!strip')
makedepends=('p7zip' 'asar')
source=(
"$pkgname-$pkgver-setup.exe::https://www.deezer.com/desktop/download/artifact/win32/x86/$pkgver"
"$pkgname.desktop"
)
md5sums=('208423389ef47f1c70d60d6e591202e0'
         'bb851102d63a9cb396b42d7a61c5104c')

package() {
    
    mkdir -p "$pkgdir"/usr/share/deezer
    mkdir -p "$pkgdir"/usr/share/applications
    mkdir -p "$pkgdir"/usr/share/icons/hicolor/256x256/apps/
    mkdir -p "$pkgdir"/usr/bin/

    # Extract app from installer
    7z x -so $pkgname-$pkgver-setup.exe "\$PLUGINSDIR/app-32.7z" > app-32.7z
    # Extract app archive
    7z x -y -bsp0 -bso0 app-32.7z

    cd resources/
    asar extract app.asar app
    # Fix crash on startup since 4.14.1 (patch systray icon path)
    sed -i 's/build\/linux\/systray.png/..\/..\/..\/share\/deezer\/systray.png/g' app/app/js/main/Utils/index.js
    # Remove NodeRT from package (-205.72 MiB)
    rm -r app/node_modules/@nodert
    # Fix electron 5 incompatibility
    sed -i 's/webPreferences:{dev/webPreferences:{nodeIntegration:true,dev/g' app/app/js/main/App/index.js
    sed -i 's/nodeIntegration:!1/nodeIntegration:true/g' app/app/js/main/App/index.js
    # Fix startup error electron 6.0.1 (https://github.com/electron/electron/pull/19570
    sed -i 's|urls:\[\"\*\.\"+r.tld\]|urls:\["\*://\*/\*\"\]|g' app/app/js/main/App/index.js
    sed -i 's|urls:\[\"\*\.\*\"\]|urls:\["\*://\*/\*\"\]|g' app/app/js/main/App/index.js
    asar pack app app.asar

    cd "${srcdir}"

    echo "#!/bin/sh" > deezer
    echo "exec electron /usr/share/deezer/app.asar \"\$@\"" >> deezer

    install -Dm644 resources/app.asar "$pkgdir"/usr/share/deezer/
    install -Dm644 resources/build/win/app.ico "$pkgdir"/usr/share/icons/hicolor/256x256/apps/deezer.png
    install -Dm644 resources/build/win/systray.png "$pkgdir"/usr/share/deezer/
    install -Dm644 "$pkgname".desktop "$pkgdir"/usr/share/applications/
    install -Dm755 deezer "$pkgdir"/usr/bin/

}
