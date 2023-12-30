pkgname=zeldalttp
_pkgname=Zeldalttp
pkgver=1.0.1
pkgrel=1
pkgdesc="Legend Of Zelda: Link to the Past game powered by the zelda3."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/zelda3pkg/Zeldalttp"
license=('GPL')
depends=('zelda3-bin' 'wget' 'unzip' 'yad')
makedepends=('unzip')
source=("https://gitlab.com/zelda3pkg/$_pkgname/-/archive/$pkgver-$pkgrel/$pkgname-$pkgver-$pkgrel.tar.bz2")
sha256sums=("SKIP")

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm775 "$pkgdir/usr/share/games/$_pkgname"
    install -dm755 "$pkgdir/usr/share/pixmaps"

    # Packaging files
    for dir in $_pkgname-$pkgver-$pkgrel-*/ ; do mv "${dir}" "$pkgname-$pkgver-$pkgrel" ;done
    # Check if zelda3_assets.dat exists so it doesn't redownload the file when it doesn't need to.
    FILE="/usr/share/games/$_pkgname/zelda3_assets.dat"
     if test -f "$FILE"
    then
        echo "$FILE exists skipping download."
    else
        echo "$FILE does not exist, Starting download.."
        cd $srcdir/$pkgname-$pkgver-$pkgrel
        wget "https://archive.org/download/zelda3_assets/zelda3_assets.dat"
    fi    
    cd $srcdir/$pkgname-$pkgver-$pkgrel
    cp "$srcdir/$pkgname-$pkgver-$pkgrel/$pkgname" "$pkgdir/usr/bin"
    cp -r ./ "$pkgdir/usr/share/games/$_pkgname"
    cp zelda3.png "$pkgdir/usr/share/pixmaps"

    # Desktop Entry
    install -Dm644 "$srcdir/$pkgname-$pkgver-$pkgrel/$_pkgname.desktop" \
    "$pkgdir/usr/share/applications/$_pkgname.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$_pkgname.desktop"
}