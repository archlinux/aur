pkgname="recomplauncher-bin"
pkgver=0.90.0.24
pkgrel=1
pkgdesc="Recompiled games, native on PC."
arch=('x86_64')
url="https://github.com/elripalda/RecompStore"
license=('GPL 3.0')

source=("RecompLauncher.desktop" "https://github.com/elripalda/RecompLauncher/releases/download/v${pkgver%.*}-beta.${pkgver##*.}/RecompLauncher_${pkgver%.*}-beta.${pkgver##*.}_amd64.AppImage")
sha256sums=('3e775eee4f97fccac2bc634e042ecd0337ff487c49f20a00d758adb9a06e57cd'
            '5a26b13a83ec276e778b52caccf9ca4a9cb164a50ae045c568d081773eddbaff')

package(){
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/lib"
    install -dm755 "$pkgdir/usr/share"

    chmod +x "$srcdir/RecompLauncher_${pkgver%.*}-beta.${pkgver##*.}_amd64.AppImage"
    "$srcdir/RecompLauncher_${pkgver%.*}-beta.${pkgver##*.}_amd64.AppImage" --appimage-extract

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
