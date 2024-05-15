pkgname=zeldalttp
_pkgname=Zeldalttp
pkgver=1.0.2
pkgrel=2
pkgdesc="Legend Of Zelda: Link to the Past game powered by the zelda3."
arch=('pentium4' 'i386' 'i686' 'x86_64' 'aarch64')
license=('GPL')
url="https://gitlab.com/linuxbombay/zeldalttp"
depends=('zelda3-bin' 'wget' 'unzip' 'yad')
makedepends=('unzip')
source=("$url/-/archive/$pkgver/zeldalttp-$pkgver.tar.bz2")
sha256sums=('f1ff517eff8223815aea282cddf692fdf8deab42abe0f2d919c43822e4976245')

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm775 "$pkgdir/usr/share/games/$_pkgname"
    install -dm755 "$pkgdir/usr/share/pixmaps"

    # Packaging files
    # Check if zelda3_assets.dat exists so it doesn't redownload the file when it doesn't need to.
    FILE="/usr/share/games/$_pkgname/zelda3_assets.dat"
     if test -f "$FILE"
    then
        echo "$FILE exists skipping download."
        ln -s /usr/share/games/$_pkgname/zelda3_assets.dat "$pkgdir/usr/share/games/$_pkgname/zelda3_assets.dat"
    else
        echo "$FILE does not exist, Starting download.."
        cd $srcdir/$pkgname-$pkgver
        wget "https://archive.org/download/zelda3_assets/zelda3_assets.dat"
    fi    
    cd $srcdir/$pkgname-$pkgver
    install -Dm755 "$pkgname" "$pkgdir/usr/bin"
    cp -r ./ "$pkgdir/usr/share/games/$_pkgname"
    install -Dm755 zelda3.png "$pkgdir/usr/share/pixmaps"

    # Desktop Entry
    install -Dm644 "$_pkgname.desktop" \
    "$pkgdir/usr/share/applications/$_pkgname.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
