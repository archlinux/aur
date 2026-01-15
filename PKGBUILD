# Maintainer: se2crid

pkgbase="plumeimpactor"
pkgname="plumeimpactor-appimage"
pkgver="1.4.1"
pkgrel=1
pkgdesc="Sideloading tool for iOS devices"
url="https://github.com/khcrysalis/PlumeImpactor"
arch=("x86_64")
license=("MIT")
depends=("fuse3" "hicolor-icon-theme" "usbmuxd")
options=("!strip" "!debug")

_appimage="Impactor-linux-x86_64.AppImage"
source=("$_appimage::$url/releases/download/v$pkgver/$_appimage"
        "LICENSE::https://raw.githubusercontent.com/khcrysalis/PlumeImpactor/main/LICENSE")
sha256sums=('47247b365947169a67f48622ada358847b97fc0c8580d650e2996b4b77f093a3'
            '6e91aca9b6eacf944ae628db34a60253d917b7ddb411c4748ab6e5105ffe5a3e')

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
    ln -s "/opt/$pkgname/$_appimage" "$pkgdir/usr/bin/plumeimpactor"

    # Install desktop file
    install -Dm644 "$srcdir/squashfs-root/usr/share/applications/dev.khcrysalis.PlumeImpactor.desktop" \
        "$pkgdir/usr/share/applications/plumeimpactor.desktop"

    # Install icons
    for path in "$srcdir"/squashfs-root/usr/share/icons/hicolor/*/apps/dev.khcrysalis.PlumeImpactor.*; do
        install -Dm644 "$path" "$pkgdir/${path#$srcdir/squashfs-root/}"
    done

    # Install license
    install -Dm644 "$srcdir/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
