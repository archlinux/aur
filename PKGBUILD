pkgname=supermario64
_pkgname=SuperMario64
pkgver=1.0.1
pkgrel=1
pkgdesc="Super Mario 64 powered by the sm64ex engine."
arch=('x86_64' 'aarch64')
arch=('pentium4' 'i386' 'i686' 'x86_64' 'aarch64')
license=('GPL')
depends=('sm64ex-bin' 'wget' 'unzip' 'yad')
makedepends=('unzip')
source=("https://gitlab.com/supermario64pkg/supermario64/-/archive/$pkgver-$pkgrel/supermario64-$pkgver-$pkgrel.tar.bz2")
sha256sums=("SKIP")

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm775 "$pkgdir/usr/share/games/$_pkgname"
    install -dm755 "$pkgdir/usr/share/pixmaps"

    # Packaging files
    cd $srcdir
    for dir in $pkgname-$pkgver-$pkgrel ; do mv "${dir}" "$pkgname" ;done
    # Check if sm64-US-assets.tar.xz exists so it doesn't redownload the file when it doesn't need to.
    FILE="/usr/share/games/$_pkgname/sm64-US-assets.tar.xz"
     if test -f "$FILE"
    then
        echo "$FILE exists skipping download."
        cp '/usr/share/games/SuperMario64/sm64-US-assets.tar.xz' "$srcdir/$pkgname"
    else
        echo "$FILE does not exist, Starting download.."
        cd $pkgdir/usr/share/games/SuperMario64
        wget "https://archive.org/download/am64-US-assets.tar/sm64-US-assets.tar.xz"
    fi
    cd $srcdir/$pkgname
    cp "$srcdir/$pkgname/$pkgname" "$pkgdir/usr/bin"
    cp -r ./ "$pkgdir/usr/share/games/$_pkgname"
    cp $pkgname.png "$pkgdir/usr/share/pixmaps"

    # Desktop Entry
    install -Dm644 "$srcdir/$pkgname/$_pkgname.desktop" \
    "$pkgdir/usr/share/applications/$_pkgname.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
