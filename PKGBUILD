pkgname=jazzjackrabbit
_pkgname=JazzJackrabbit
pkgver=1.0.0
pkgrel=1
pkgdesc="Jazz Jackrabbit game powered by the openjazz."
arch=('x86_64' 'aarch64')
license=('GPL')
depends=('openjazz-bin' 'wget' 'unzip' 'yad')
makedepends=('unzip')
url="https://gitlab.com/jazzproject"
source=("https://gitlab.com/jazzproject/jazz-jackrabbit/jazz/-/archive/$pkgver/jazz-$pkgver.tar.bz2")
sha256sums=("SKIP")

prepare() {
   # Check if Sources folder exists so it doesn't redownload the file when it doesn't need to.
    FILE="/usr/share/games/$_pkgname/SPRITES.*"
if [ -f "$FILE" ]; then
    echo "Game files exists, skipping download."
    cp -r "/usr/share/games/$_pkgname/*" "$pkgdir/usr/share/games/$_pkgname"
else
    echo "Game files do not exist, starting download.."
    cd "$srcdir/jazz-$pkgver" || { echo "Failed to change directory"; exit 1; }
   # Deleting any existing downloads
    rm -rf "Jazz Jackrabbit GOG v1.3 + Orbitus 2 fix.zip"
    wget "https://archive.org/download/jazzpack/Jazz%20Jackrabbit%20GOG%20v1.3%20%2B%20Orbitus%202%20fix.zip"
    if [ $? -ne 0 ]; then
        echo "Download failed"
        exit 1
    fi
       mkdir -p "$srcdir/tmp"
       unzip -u "Jazz Jackrabbit GOG v1.3 + Orbitus 2 fix.zip" -d "$srcdir/tmp"
     #Cleanup of uneeded files before packaging
       rm -rf "$srcdir/tmp/cloud_saves"
       rm -rf "$srcdir/tmp/DOSBOX"
       rm -rf "$srcdir/tmp/HH95"
       rm -rf "$srcdir/tmp/dosbox_*"
       rm "$srcdir/tmp/webcache.zip"
       find "$srcdir/tmp" -type f -iname "*unins000.*" -exec rm -- {} +
       find "$srcdir/tmp" -type f -iname "*.exe" -exec rm -- {} +
       find "$srcdir/tmp" -type f -iname "*.ico" -exec rm -- {} +
       find "$srcdir/tmp" -type f -iname "*.lnk" -exec rm -- {} +
       find "$srcdir/tmp" -type f -iname "*.hashdb" -exec rm -- {} +
       find "$srcdir/tmp" -type f -iname "*.doc" -exec rm -- {} +
       find "$srcdir/tmp" -type f -iname "*.unins000" -exec rm -- {} +
fi    
}
package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm775 "$pkgdir/usr/share/games/$_pkgname"
    install -dm755 "$pkgdir/usr/share/pixmaps"
    
    cp -r "$srcdir/jazz-$pkgver/$pkgname" "$pkgdir/usr/bin"
    cp -r "$srcdir/jazz-$pkgver/$pkgname" "$pkgdir/usr/share/games/$_pkgname/"
    cp -r "$srcdir/jazz-$pkgver/$pkgname.png" "$pkgdir/usr/share/games/$_pkgname/"
    cp -r "$srcdir/jazz-$pkgver/$pkgname.png" "$pkgdir/usr/share/pixmaps"
    cp -r "$srcdir/tmp/." "$pkgdir/usr/share/games/$_pkgname/"

    # Desktop Entry
    install -Dm644 "$srcdir/jazz-$pkgver/$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$pkgname.desktop"
}
