pkgname=doom
_pkgname=Doom
pkgver=1.0.0
pkgrel=1
pkgdesc="Original Doom first person shooter powered by GZDoom."
arch=('x86_64' 'aarch64')
license=('GPL')
depends=('gzdoom-bin' 'wget' 'unzip' 'yad')
makedepends=('unzip')
source=("https://gitlab.com/gzdoom-bin/doom/-/archive/$pkgver/$pkgname-$pkgver.tar.bz2")
sha256sums=("SKIP")

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm775 "$pkgdir/usr/share/games/$_pkgname"
    install -dm755 "$pkgdir/usr/share/pixmaps"

    # Packaging files
    # Check if zelda3_assets.dat exists so it doesn't redownload the file when it doesn't need to.
    FILE="/usr/share/games/$_pkgname/doom.wad"
     if test -f "$FILE"
    then
        echo "$FILE exists skipping download."
        cp -r /usr/share/games/$_pkgname/doom.wad "$pkgdir/usr/share/games/$_pkgname"
    else
        echo "$FILE does not exist, Starting download.."
        cd $srcdir
        wget "https://archive.org/download/2020_03_22_DOOM/DOOM%20WADs/Doom%20%28v1.9%29.zip"
        unzip "Doom (v1.9).zip"
        mv DOOM.WAD doom.wad
        cp -r doom.wad "$pkgdir/usr/share/games/$_pkgname/doom.wad"
    fi    
    cd $srcdir/$pkgname-$pkgver
    cp "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin"
    cp -r ./ "$pkgdir/usr/share/games/$_pkgname"
    cp -r doom.svg "$pkgdir/usr/share/pixmaps"

    # Desktop Entry
    install -Dm644 "$srcdir/$pkgname-$pkgver/$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$pkgname.desktop"
}
