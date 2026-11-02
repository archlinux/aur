pkgname="recomplauncher-bin"
pkgver=0.90.0
betaver=9
pkgrel=1
pkgdesc="Recompiled games, native on PC."
arch=('x86_64' 'aarch64')
url="https://recomplauncher.com"
license=('custom')
depends=('wget' 'unzip')
optdepends=('zenity: Information/Error message UI')

source=("RecompLauncher.desktop" "https://github.com/elripalda/RecompLauncher/releases/download/v${pkgver}-beta.${betaver}/RecompLauncher_${pkgver}-beta.${betaver}_amd64.AppImage")
sha256sums=('3e775eee4f97fccac2bc634e042ecd0337ff487c49f20a00d758adb9a06e57cd'
            'd49266d59c179aa555433485684c727aadcc3225f8c603998aa2c0cf12d3c831')

package(){
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/lib"
    install -dm755 "$pkgdir/usr/share"

    chmod +x "$srcdir/RecompLauncher_${pkgver}-beta.${betaver}_amd64.AppImage"
    "$srcdir/RecompLauncher_${pkgver}-beta.${betaver}_amd64.AppImage" --appimage-extract

    install -Dm755 "$srcdir/squashfs-root/usr/bin/recomplauncher" "$pkgdir/usr/bin"
    rm -rf "$srcdir/squashfs-root/usr/share/doc" \
           "$srcdir/squashfs-root/usr/share/glib-2.0"
    cp -a "$srcdir/squashfs-root/usr/share/." "$pkgdir/usr/share/"
    find "$pkgdir/usr/share" -type d -exec chmod 755 {} +

    # Desktop Entry
    install -Dm644 "$srcdir/RecompLauncher.desktop" \
        "$pkgdir/usr/share/applications/RecompLauncher.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/RecompLauncher.desktop"
}
