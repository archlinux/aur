# Maintainer: Spoorloos <mick.negenman@icloud.com>

pkgbase='iloader'
pkgname='iloader-appimage'
pkgver='1.1.5'
pkgrel=1
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
sha256sums=('2e5d85da7716ebff0e05ffde80ea218621debbcdf412884b054e4b0aea6b2c77'
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
        "$pkgdir/usr/share/icons/iloader.png"

    # Install license
    install -Dm644 "$srcdir/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
