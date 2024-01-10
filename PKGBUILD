pkgname=supermarioworld
_pkgname=SuperMarioWorld
pkgver=1.0.0
pkgrel=1
pkgdesc="Super Mario World powered by smw"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/smw4"
license=('GPL')
depends=('smw-bin')
makedepends=('unzip')
sha256sums=('SKIP')
source=("https://gitlab.com/smw4/smw/-/archive/$pkgver-$pkgrel/smw-$pkgver-$pkgrel.tar.bz2")

package() {
   install -dm755 "$pkgdir/usr/share/games/$_pkgname"
   install -dm755 "$pkgdir/usr/share/pixmaps"
   install -dm755 "$pkgdir/usr/bin"
   
   for dir in smw-*/ ; do mv "${dir}" "$_pkgname" ;done
    # Check if smw_assets.dat exists so it doesn't redownload the file when it doesn't need to.
    FILE="/usr/share/games/$_pkgname/smw_assets.dat"
     if test -f "$FILE"
    then
        echo "$FILE exists skipping download."
        cp -r "/usr/share/games/$_pkgname/smw_assets.dat" "$pkgdir/usr/share/games/$_pkgname"
    else
        echo "$FILE does not exist, Starting download.."
        cd $srcdir/$_pkgname
        wget "https://archive.org/download/smw_assets/smw_assets.dat"
        cp -r "./smw_assets.dat" "$pkgdir/usr/share/games/$_pkgname"
    fi
   
   cp -r "$srcdir/$_pkgname/smw.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
   cp -r "$srcdir/$_pkgname/." "$pkgdir/usr/share/games/$_pkgname"

   #Binary
   cp -r "$srcdir/$_pkgname/supermarioworld" "$pkgdir/usr/bin"

   # Desktop Entry
   install -Dm644 "$srcdir/$_pkgname/$_pkgname.desktop" \
        "$pkgdir/usr/share/applications/$_pkgname.desktop"
   sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
