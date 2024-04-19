pkgname=perfectdark
_pkgname=PerfectDark
pkgver=1.0.0
pkgrel=1
pkgdesc="Perfect Dark powered by perfect_dark reimplimentation engine"
arch=('x86_64')
url="https://gitlab.com/linuxbombay/perfectdark"
license=('GPL')
depends=('pd-bin')
makedepends=('unzip')
sha256sums=('d74c0d242b91ae79dfacfb449b88c7fc07f17b2d822332fb54ec50c754a00352')
source=("https://gitlab.com/linuxbombay/perfectdark/perfectdark/-/archive/$pkgver/perfectdark-$pkgver.tar.bz2")

package() {
   install -dm755 "$pkgdir/usr/share/games/$_pkgname"
   install -dm755 "$pkgdir/usr/share/pixmaps"
   install -dm755 "$pkgdir/usr/bin"
   
   for dir in perfectdark-*/ ; do mv "${dir}" "$_pkgname" ;done
    # Check if smw_assets.dat exists so it doesn't redownload the file when it doesn't need to.
    FILE="/usr/share/games/$_pkgname/pd.ntsc-final.z64"
     if test -f "$FILE"
    then
        echo "$FILE exists skipping download."
        cp -r "/usr/share/games/$_pkgname/pd.ntsc-final.z64" "$pkgdir/usr/share/games/$_pkgname"
    else
        echo "$FILE does not exist, Starting download.."
        cd $srcdir/$_pkgname
        wget "https://archive.org/download/pd.ntsc-final/pd.ntsc-final.z64"
        cp -r "./pd.ntsc-final.z64" "$pkgdir/usr/share/games/$_pkgname"
    fi
   
   cp -r "$srcdir/$_pkgname/perfectdark.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
   cp -r "$srcdir/$_pkgname/." "$pkgdir/usr/share/games/$_pkgname"

   #Binary
   cp -r "$srcdir/$_pkgname/perfectdark" "$pkgdir/usr/bin"

   # Desktop Entry
   install -Dm644 "$srcdir/$_pkgname/$pkgname.desktop" \
        "$pkgdir/usr/share/applications/$pkgname.desktop"
   sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$pkgname.desktop"
}
