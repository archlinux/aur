pkgname=jazzjackrabbit2
_pkgname=JazzJackrabbit2
pkgver=1.0.0
pkgrel=1
pkgdesc="Jazz Jackrabbit 2 game powered by the jazz2."
arch=('x86_64' 'aarch64')
license=('GPL')
depends=('jazz2-native-bin' 'wget' 'unzip' 'yad')
makedepends=('unzip')
#source=("https://gitlab.com/jazz2-bin/jazz2/-/archive/$pkgver/jazz2-$pkgver.tar.bz2")
source=("./jazz2-$pkgver.tar.bz2")
sha256sums=("SKIP")

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm775 "$pkgdir/usr/share/games/$_pkgname"
    install -dm755 "$pkgdir/usr/share/pixmaps"

    # Packaging files
    # Check if Sources folder exists so it doesn't redownload the file when it doesn't need to.
    DIR="/usr/share/games/$_pkgname/Source"
if [ -d "$DIR" ]; then
    echo "$DIR exists, skipping download."
else
    echo "$DIR does not exist, starting download.."
    cd "$srcdir/jazz2-$pkgver" || { echo "Failed to change directory"; exit 1; }
    # Deleting any existing downloads
    rm -rf Jazz2-source.zip
    wget "https://archive.org/download/jazz-2-source/Jazz2-source.zip"
    if [ $? -ne 0 ]; then
        echo "Download failed"
        exit 1
    fi
       unzip Jazz2-source.zip -d "$pkgdir/usr/share/games/$_pkgname"
fi    
    cp "$srcdir/jazz2-$pkgver/$pkgname" "$pkgdir/usr/bin"
    cp -r jazzjackrabbit2 jazz2.png "$pkgdir/usr/share/games/$_pkgname/"
    cp "$srcdir/jazz2-$pkgver/jazz2.png" "$pkgdir/usr/share/pixmaps"

    # Desktop Entry
    install -Dm644 "$srcdir/jazz2-$pkgver/jazz2.desktop" \
    "$pkgdir/usr/share/applications/jazz2.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/jazz2.desktop"
}
