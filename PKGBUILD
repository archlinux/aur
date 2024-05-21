pkgname=zeldaoot
_pkgname=Zeldaoot
pkgver=1.0.0
pkgrel=1
pkgdesc="The Legend of Zelda: Ocarina of Time game powered by the soh."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/linuxbombay/zeldaoot"
license=('GPL')
depends=('soh-bin' 'wget' 'unzip' 'yad')
makedepends=('unzip')
source=("$url/-/archive/$pkgver/$pkgname-$pkgver.tar.bz2")
sha256sums=('7e7bd07952b787f028eea53513d0624a3ecf51d9c0459f9352c7a77c8ebd1952')

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm775 "$pkgdir/usr/share/games/$_pkgname"
    install -dm755 "$pkgdir/usr/share/pixmaps"

    # Packaging files
    # Check if otr files exists so it doesn't redownload the files when it doesn't need to.
        FILE="/usr/share/games/$_pkgname/soh.otr"
     if test -f "$FILE"
    then
        echo "$FILE exists skipping download."
        cp -rf "/usr/share/games/$_pkgname/soh.otr" "$srcdir/$pkgname-$pkgver/soh.otr"
        cp -rf "/usr/share/games/$_pkgname/oot.otr" "$srcdir/$pkgname-$pkgver/oot.otr"
    else
        echo "$file does not exist, starting download.."
        cd $srcdir/$pkgname-$pkgver
       #Deleting any existing downloads
        rm -rf soh-assets.zip
        wget "https://archive.org/download/soh-assets/soh-assets.zip"
        unzip soh-assets.zip -d $srcdir/$pkgname-$pkgver
    fi
    cp -rf "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin"
    cp -rf "$srcdir/$pkgname-$pkgver/soh.otr" "$pkgdir/usr/share/games/$_pkgname"
    cp -rf "$srcdir/$pkgname-$pkgver/oot.otr" "$pkgdir/usr/share/games/$_pkgname"
    cp -rf "$srcdir/$pkgname-$pkgver/$pkgname.png" "$pkgdir/usr/share/games/$_pkgname"
    cp -rf "$srcdir/$pkgname-$pkgver/$pkgname.png" "$pkgdir/usr/share/pixmaps"
    
    # Desktop Entry
    install -Dm644 "$srcdir/$pkgname-$pkgver/$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$pkgname.desktop"
}
