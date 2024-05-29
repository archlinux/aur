pkgname=supermarioworld
_pkgname=SuperMarioWorld
pkgver=1.0.0
pkgrel=2
pkgdesc="Super Mario World powered by smw"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/linuxbombay/supermarioworld"
license=('GPL')
depends=('smw-bin' 'yad')
makedepends=('unzip')
sha256sums=('d5a57f96406eece546b29735c9bf29ff10f7f43c27a4656b8b8881a388292565')
source=("$url/-/archive/$pkgver/supermarioworld-$pkgver.tar.bz2")
 
package() {
   install -dm755 "$pkgdir/usr/share/games/$_pkgname"
   install -dm755 "$pkgdir/usr/share/pixmaps"
   install -dm755 "$pkgdir/usr/bin"
   
   for dir in supermarioworld-*/ ; do mv "${dir}" "$_pkgname" ;done
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
   install -Dm755 "$srcdir/$_pkgname/supermarioworld" "$pkgdir/usr/bin"

   # Desktop Entry
   install -Dm644 "$srcdir/$_pkgname/$_pkgname.desktop" \
        "$pkgdir/usr/share/applications/$_pkgname.desktop"
   sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
