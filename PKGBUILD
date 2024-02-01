pkgname=spacecadetpinball
_pkgname=SpaceCadetPinball
pkgver=1.0.0
pkgrel=1
pkgdesc="Space Cadet Pinball."
arch=('x86_64' 'aarch64')
arch=('pentium4' 'i386' 'i686' 'x86_64' 'aarch64')
license=('GPL')
depends=('scp-bin' 'wget' 'unzip' 'yad')
makedepends=('unzip')
source=("https://gitlab.com/spacecadetpinball/spacecadetpinball/-/archive/$pkgver-$pkgrel/spacecadetpinball-$pkgver-$pkgrel.tar.bz2")
sha256sums=("SKIP")

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm775 "$pkgdir/usr/share/games/$_pkgname"
    install -dm755 "$pkgdir/usr/share/pixmaps"

    # Packaging files
    for dir in $pkgname-$pkgver-$pkgrel/ ; do mv "${dir}" "$pkgname" ;done
    # Check if SpaceCadetPinball Assets zip exists so it doesn't redownload the file when it doesn't need to.
    FILE="/usr/share/games/$_pkgname/3DPinball.zip"
     if test -f "$FILE"
    then
        echo "$FILE exists skipping download."
        cp -r /usr/share/games/SpaceCadetPinball/3DPinball.zip $pkgdir/usr/share/games/$_pkgname
    else
        echo "$FILE does not exist, Starting download.."
        cd $srcdir/$pkgname
        wget "https://archive.org/download/3DPinball/3DPinball.zip"
    fi
    cd $srcdir/$pkgname
    cp "$srcdir/$pkgname/$pkgname" "$pkgdir/usr/bin"
    cp -r ./ "$pkgdir/usr/share/games/$_pkgname"
    cp $pkgname.png "$pkgdir/usr/share/pixmaps"

    # Desktop Entry
    install -Dm644 "$srcdir/$pkgname/$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$pkgname.desktop"
}
