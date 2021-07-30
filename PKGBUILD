# Maintainer: Sibren Vasse <arch@sibrenvasse.nl>
# Contributor: Ilya Gulya <ilyagulya@gmail.com>
pkgname="deezer"
pkgver=5.30.30
pkgrel=1
pkgdesc="A proprietary music streaming service"
arch=('any')
url="https://www.deezer.com/"
license=('custom:"Copyright (c) 2006-2018 Deezer S.A."')
depends=('electron')
provides=('deezer')
makedepends=('p7zip' 'asar' 'prettier' 'imagemagick' 'npm' 'nodejs')
source=("$pkgname-$pkgver-setup.exe::https://www.deezer.com/desktop/download/artifact/win32/x86/$pkgver"
    "$pkgname.desktop"
    deezer
    start-hidden-on-tray.patch
    quit.patch)
sha256sums=('582b3df3207f8cd20f92af5917e65f75eab73cbc370244600c6ef872e7837e92'
            'f8a5279239b56082a5c85487b0c261fb332623f27dac3ec8093458b8c55d8d99'
            '8717ba2de9cabc5c0a35780315871329c15bde5ff46c4f0bf859a87e42aa96f5'
            '2254632a03ca2cf7ae6b50a4109b0bec417cf0db6d669a8037125d13488e3b9f'
            'd3f96ae6019abb60aa097919b22b1873f83061ed7453cd251e43b3afe5d54919')

prepare() {
    # Extract app from installer
    7z x -so $pkgname-$pkgver-setup.exe "\$PLUGINSDIR/app-32.7z" >app-32.7z
    # Extract app archive
    7z x -y -bsp0 -bso0 app-32.7z

    # Extract png from ico container
    convert resources/win/app.ico resources/win/deezer.png

    cd resources/
    asar extract app.asar app

    cd "$srcdir/resources/app"
	mkdir -p resources/linux/
    install -Dm644 "$srcdir/resources/win/systray.png" resources/linux/

    prettier --write "build/*.js"
    # Hide to tray (https://github.com/SibrenVasse/deezer/issues/4)
    patch --forward --strip=1 --input="$srcdir/quit.patch"
    # Add start in tray cli option (https://github.com/SibrenVasse/deezer/pull/12)
    patch --forward --strip=1 --input="$srcdir/start-hidden-on-tray.patch"

    cd "$srcdir/resources/"
    asar pack app app.asar
}

package() {
    mkdir -p "$pkgdir/usr/share/deezer"
    mkdir -p "$pkgdir/usr/share/applications"
    mkdir -p "$pkgdir/usr/bin/"
    for size in 16 32 48 64 128 256; do
        mkdir -p "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/"
    done

    install -Dm644 resources/app.asar "$pkgdir/usr/share/deezer/"
    install -Dm644 resources/win/deezer-0.png "$pkgdir/usr/share/icons/hicolor/16x16/apps/deezer.png"
    install -Dm644 resources/win/deezer-1.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/deezer.png"
    install -Dm644 resources/win/deezer-2.png "$pkgdir/usr/share/icons/hicolor/48x48/apps/deezer.png"
    install -Dm644 resources/win/deezer-3.png "$pkgdir/usr/share/icons/hicolor/64x64/apps/deezer.png"
    install -Dm644 resources/win/deezer-4.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/deezer.png"
    install -Dm644 resources/win/deezer-5.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/deezer.png"
    install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/"
    install -Dm755 deezer "$pkgdir/usr/bin/"
}
