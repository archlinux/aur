pkgname=zeldamm
_pkgname=Zeldamm
pkgver=1.0.1
pkgrel=1
pkgdesc="The Legend of Zelda: Majora's Mask game powered by the 2s2h."
arch=('x86_64' 'aarch64' '1686')
license=('GPL')
depends=('2s2h-bin' 'wget' 'unzip' 'yad')
makedepends=('unzip')
source=("https://gitlab.com/linuxbombay/zeldamm/-/archive/$pkgver/$pkgname-$pkgver.tar.bz2")
sha256sums=('4f95fda696a795d22165dbcad807f8edae23dc2a326a7a615f28cc9f072c8394')

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm775 "$pkgdir/usr/share/games/$_pkgname"
    install -dm755 "$pkgdir/usr/share/pixmaps"

    # Packaging files
    # Check if otr files exists so it doesn't redownload the files when it doesn't need to.
        FILE="/usr/share/games/$_pkgname/mm.otr"
     if test -f "$FILE"
    then
        echo "$FILE exists skipping download."
        cp -rf "/usr/share/games/2s2h/2ship.o2r" "$srcdir/$pkgname-$pkgver"
        cp -rf "/usr/share/games/$_pkgname/mm.o2r" "$srcdir/$pkgname-$pkgver"
    else
        echo "$file does not exist, starting download.."
        cd $srcdir/$pkgname-$pkgver
       #Deleting any existing downloads
        rm -rf mm.o2r
        wget "https://archive.org/download/mm_20240527/mm.o2r"
        cp -rf "/usr/share/games/2s2h/2ship.o2r" "$srcdir/$pkgname-$pkgver"
    fi
    cp -rf "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin"
    cp -rf "$srcdir/$pkgname-$pkgver/2ship.o2r" "$pkgdir/usr/share/games/$_pkgname"
    cp -rf "$srcdir/$pkgname-$pkgver/mm.o2r" "$pkgdir/usr/share/games/$_pkgname"
    cp -rf "$srcdir/$pkgname-$pkgver/$pkgname.png" "$pkgdir/usr/share/games/$_pkgname"
    cp -rf "$srcdir/$pkgname-$pkgver/$pkgname.png" "$pkgdir/usr/share/pixmaps"
    
    # Desktop Entry
    install -Dm644 "$srcdir/$pkgname-$pkgver/$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$pkgname.desktop"
}
