# Maintainer: se2crid

pkgbase="plumeimpactor"
pkgname="plumeimpactor-appimage"
pkgver="2.7.0"
pkgrel=1
pkgdesc="Sideloading tool for iOS devices"
url="https://github.com/claration/Impactor"
arch=("x86_64" "aarch64")
license=("MIT")
depends=("fuse2" "hicolor-icon-theme" "usbmuxd" "libayatana-appindicator")
options=("!strip" "!debug")

_appimage="Impactor-linux-$CARCH-$pkgver.appimage"
source=("LICENSE::https://raw.githubusercontent.com/claration/Impactor/main/LICENSE")
source_x86_64=("Impactor-linux-x86_64-$pkgver.appimage::$url/releases/download/v$pkgver/Impactor-linux-x86_64.appimage")
source_aarch64=("Impactor-linux-aarch64-$pkgver.appimage::$url/releases/download/v$pkgver/Impactor-linux-aarch64.appimage")
sha256sums=('6e91aca9b6eacf944ae628db34a60253d917b7ddb411c4748ab6e5105ffe5a3e')
sha256sums_x86_64=('33c0228d9b9d89cd6102c0d3cfa506cd7d43ddd42eff25b753574a406655f621')
sha256sums_aarch64=('50b918ae3ef62173380ea4ae225e1881212880f618c5899feafd57f6fbc3cc8f')

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
