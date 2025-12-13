# Maintainer: Spoorloos <mick.negenman@icloud.com>

pkgbase="iloader"
pkgname="iloader-appimage"
pkgver="1.1.5"
pkgrel=2
pkgdesc="User-friendly sideloader"
url="https://github.com/nab138/iloader"
arch=("x86_64")
license=("MIT")
depends=("fuse3" "hicolor-icon-theme")
conflicts=("iloader-bin")
options=("!strip" "!debug")

_appimage="iloader-linux-amd64.AppImage"
source=("$_appimage::$url/releases/download/v$pkgver/$_appimage"
        "LICENSE::$url/raw/refs/tags/v$pkgver/LICENSE")
sha256sums=("2e5d85da7716ebff0e05ffde80ea218621debbcdf412884b054e4b0aea6b2c77"
            "c6e929e3490b6475e382b4f74aaddd068deb3bf27cca2109821591e692dfcb3b")

prepare() {
    # Extract AppImage
    chmod +x "$srcdir/$_appimage"

    "$srcdir/$_appimage" --appimage-extract
}

package() {
    # Install AppImage
    install -Dm755 "$srcdir/$_appimage" "$pkgdir/opt/$pkgname/$_appimage"

    # Create a symlink for AppImage in /usr/bin/
    install -d "$pkgdir/usr/bin"
    ln -s "/opt/$pkgname/$_appimage" "$pkgdir/usr/bin/iloader"

    # Install desktop file
    install -Dm644 "$srcdir/squashfs-root/usr/share/applications/iloader.desktop" \
        "$pkgdir/usr/share/applications/iloader.desktop"

    # Install icons
    for path in "$srcdir"/squashfs-root/usr/share/icons/hicolor/*/apps/iloader.*; do
        install -Dm644 "$path" "$pkgdir/${path#$srcdir/squashfs-root}"
    done

    # Install license
    install -Dm644 "$srcdir/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
