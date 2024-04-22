pkgname=rtcw
_pkgname=RTCW
pkgver=1.0.0
pkgrel=1
pkgdesc="Return to Castle Wolfenstein game powered by the iortcw."
arch=('i686' 'x86_64' 'aarch64')
license=('GPL')
depends=('iortcw-bin' 'wget' 'unzip' 'yad' 'aria2')
makedepends=('unzip')
source=("https://gitlab.com/linuxbombay/rtcw/-/archive/$pkgver/rtcw-$pkgver.tar.bz2")
sha256sums=('61173ec992649f8908d1fb5d4a61f4104e3fe9db82327f60f3c642fa19e4ba45')
pkgspname=rtcwsp
pkgmpname=rtcwmp
pkgdedname=rtcwded

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm775 "$pkgdir/usr/share/games/$_pkgname"
    install -dm755 "$pkgdir/usr/share/pixmaps"
    install -dm755 "$pkgdir/usr/share/applications"

   # Packaging files
    for dir in $pkgname-$pkgver ; do mv "${dir}" "$pkgname" ;done
   # Check if pak0.pk3 exists so it doesn't redownload the file when it doesn't need to.
    FILE="/usr/share/games/$_pkgname/main/pak0.pk3"
     if test -f "$FILE"
    then
        echo "$FILE exists skipping download."
        cp -r /usr/share/games/iortcw/main "$pkgdir/usr/share/games/$_pkgname"
        cp -r /usr/share/games/$_pkgname/main "$pkgdir/usr/share/games/$_pkgname"
    else
        echo "$FILE does not exist, Starting download.."
        cd $srcdir
        aria2c -x5 "https://archive.org/download/rtcw-pk3/rtcw-pk3.zip"
        cp -r /usr/share/games/iortcw/main "$pkgdir/usr/share/games/$_pkgname"
        unzip rtcw-pk3.zip -d "$pkgdir/usr/share/games/$_pkgname/main"       
    fi    
    cd $srcdir/$pkgname
    cp -r ./ "$pkgdir/usr/share/games/$_pkgname"
   #Copying Binaries from iortcw to game folder
    cp -r /usr/share/games/iortcw/iowolfsp.* "$pkgdir/usr/share/games/$_pkgname"
    cp -r /usr/share/games/iortcw/iowolfmp.* "$pkgdir/usr/share/games/$_pkgname"
    cp -r /usr/share/games/iortcw/iowolfded.* "$pkgdir/usr/share/games/$_pkgname"
   #Installing launch scripts 
    install -m775 "$srcdir/$pkgname/rtcwsp" "$pkgdir/usr/bin"
    install -m775 "$srcdir/$pkgname/rtcwmp" "$pkgdir/usr/bin"
    install -m775 "$srcdir/$pkgname/rtcwded" "$pkgdir/usr/bin"
   #Symlink lib files
    find /usr/share/games/iortcw/ -name 'renderer_*' -exec cp -r {} "$pkgdir/usr/share/games/$_pkgname" \;
   #icons
    cp -r "$srcdir/$pkgname/rtcwsp.png" "$pkgdir/usr/share/pixmaps"
    cp -r "$srcdir/$pkgname/rtcwmp.png" "$pkgdir/usr/share/pixmaps"
    cp -r "$srcdir/$pkgname/rtcwded.png" "$pkgdir/usr/share/pixmaps"
   # Desktop Entries
    install -Dm644 "$srcdir/$pkgname/rtcwsp.desktop" "$pkgdir/usr/share/applications/"
    install -Dm644 "$srcdir/$pkgname/rtcwmp.desktop" "$pkgdir/usr/share/applications/"
    install -Dm644 "$srcdir/$pkgname/rtcwded.desktop" "$pkgdir/usr/share/applications/"
}
