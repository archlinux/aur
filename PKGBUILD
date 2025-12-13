# Maintainer: Spoorloos <mick.negenman@icloud.com>

pkgbase='iloader'
pkgname='iloader-appimage'
pkgver='1.1.4'
pkgrel=3
pkgdesc='User-friendly sideloader'
url='https://github.com/nab138/iloader'
arch=('x86_64')
license=('MIT')
depends=('fuse3')
conflicts=('iloader-bin')
options=(!strip !debug)
_appimage='iloader-linux-amd64.AppImage'
source=("$url/releases/download/v$pkgver/$_appimage"
        "LICENSE::$url/raw/refs/heads/main/LICENSE")
sha256sums=('3bf27878516de1488e30cdb2a049c7094efccc9c3c8bee464481f754f9033c87'
            'c6e929e3490b6475e382b4f74aaddd068deb3bf27cca2109821591e692dfcb3b')

prepare() {
    # Extract appimage
    chmod +x "$srcdir/$_appimage"

    "$srcdir/$_appimage" --appimage-extract
}

package() {
    # Install appimage
    install -Dm755 "$srcdir/$_appimage" "$pkgdir/opt/$pkgname/$_appimage"

    # Create a symlink for appimage in /usr/bin/
    mkdir -p "$pkgdir/usr/bin"
    ln -s "/opt/$pkgname/$_appimage" "$pkgdir/usr/bin/iloader"

    # Install desktop file
    install -Dm644 "$srcdir/squashfs-root/iloader.desktop" \
        "$pkgdir/usr/share/applications/iloader.desktop"

    # Install icon
    install -Dm644 "$srcdir/squashfs-root/iloader.png" \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/iloader.png"

    # Install license
    install -Dm644 "$srcdir/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
