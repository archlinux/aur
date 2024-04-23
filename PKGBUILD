pkgname=diablo
_pkgname=Diablo
pkgver=1.0.1
pkgrel=1
pkgdesc="Diablo is an action role-playing video game developed by Blizzard North and released by Blizzard Entertainment Powered by the Devilution engine"
arch=('x86_64' 'i686' 'pentium4' 'aarch64')
url="https://gitlab.com/linuxbombay/diablo"
license=('GPL')
depends=('devilutionx-bin' 'git' 'aria2' 'yad' 'p7zip')
makedepends=('unzip')
source=("$url/-/archive/$pkgver-$pkgrel/diablo-$pkgver.tar.bz2")
sha256sums=('93a7983256ffe425022293571c5266dbd9b731f987d3325eed0afa811fc88721')

package() {
    install -dm755 "$pkgdir/usr/share/games/$_pkgname"
    install -dm755 "$pkgdir/usr/lib"
    install -dm755 "$pkgdir/usr/share/pixmaps"  
    cd $srcdir
    for dir in diablo-*/ ; do mv "${dir}" "$_pkgname" ;done
  # Check if diabdat.mpq exists so it doesn't redownload the files when it doesn't need to.
    FILE="/usr/share/games/$_pkgname/diabdat.mpq"
     if test -f "$FILE"
    then
        echo "$FILE exists skipping download."
        cp '/usr/share/games/Diablo/'*.mpq $pkgdir/usr/share/games/$_pkgname
    else
        echo "$FILE does not exist, Starting download.."
        cd $srcdir
       #Switching to Archive.org backup instead
        aria2c -x4 https://archive.org/download/diablo-hellfire-mpq/diablo-hellfire-mpq.zip

       unzip diablo-hellfire-mpq.zip
        mv *.mpq "$pkgdir/usr/share/games/$_pkgname"
    fi
        cd $_pkgname  
        cd "$srcdir/$_pkgname"
        chmod +x $pkgname
        cp -r ./ "$pkgdir/usr/share/games/$_pkgname"
        cp -r "$pkgdir/usr/share/games/$_pkgname/$pkgname.png" "$pkgdir/usr/share/pixmaps"

    # Link to binary
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/usr/share/games/$_pkgname/$pkgname" "$pkgdir/usr/bin"

    # Desktop Entry
    install -Dm644 "$srcdir/$_pkgname/$_pkgname.desktop" \
        "$pkgdir/usr/share/applications/$_pkgname.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
