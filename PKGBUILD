pkgname=spacecadetpinball-bin
_pkgname=SpaceCadetPinball-bin
rpkgname=spacecadetpinball
_rpkgname=SpaceCadetPinball
pkgver=2.1.0
pkgrel=2
scriptver=1.0.0
_pkgrel_x86_64=1
_pkgrel_i386=1
_pkgrel_i686=1
_pkgrel_aarch64=1
pkgdesc='Reverse engineered port of "3D Pinball for Windows – Space Cadet" to Linux'
arch=('pentium4' 'i386' 'i686' 'x86_64' 'aarch64')
url="https://gitlab.com/linuxbombay/spacecadetpinball"
license=('GPL')
depends=('sdl2' 'sdl2_mixer' 'wget' 'unzip' 'yad')
makedepends=('unzip')
sha256sums_i386=('22691f50626242e88f2a7c7165774271b3fa96cdfa39bc9edaa1cd615eb3b411'
                 'c8942dc85637f4a1b3a5bda00be247dbcb6f7047487649f9f532079bf6e0952d')
sha256sums_i686=('22691f50626242e88f2a7c7165774271b3fa96cdfa39bc9edaa1cd615eb3b411'
                 'c8942dc85637f4a1b3a5bda00be247dbcb6f7047487649f9f532079bf6e0952d')
sha256sums_x86_64=('22691f50626242e88f2a7c7165774271b3fa96cdfa39bc9edaa1cd615eb3b411'
                   '6ee764f7d51a7d7d32bdb8463feb78fd1447a821a46e2a6e70a2dec5e2d2d54f')
sha256sums_aarch64=('22691f50626242e88f2a7c7165774271b3fa96cdfa39bc9edaa1cd615eb3b411'
                    '127ea73d8ac6651792ba6707efb65b2204e9f4b55fa59ca5f61ee80568cb071e')
source_x86_64=("$url/spacecadetpinball/-/archive/$scriptver/spacecadetpinball-$scriptver.tar.bz2" "$url/binaries/$pkgver/-/raw/main/SpaceCadetPinball-Linux-x64.tar.xz")
source_i386=("$url/spacecadetpinball/-/archive/$scriptver/spacecadetpinball-$scriptver.tar.bz2" "$url/binaries/$pkgver/-/raw/main/SpaceCadetPinball-Linux-i686.tar.xz")
source_i686=("$url/spacecadetpinball/-/archive/$scriptver/spacecadetpinball-$scriptver.tar.bz2" "$url/binaries/$pkgver/-/raw/main/SpaceCadetPinball-Linux-i686.tar.xz")
source_aarch64=("$url/spacecadetpinball/-/archive/$scriptver/spacecadetpinball-$scriptver.tar.bz2" "$url/binaries/$pkgver/-/raw/main/SpaceCadetPinball-Linux-arm64.tar.xz")


package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm775 "$pkgdir/usr/share/games/$_rpkgname"
    install -dm755 "$pkgdir/usr/share/pixmaps"

    # Packaging files
    for dir in $rpkgname-$scriptver/ ; do mv "${dir}" "$rpkgname" ;done
    # Check if SpaceCadetPinball Assets zip exists so it doesn't redownload the file when it doesn't need to.
    FILE="/usr/share/games/$_rpkgname/3DPinball.zip"
     if test -f "$FILE"
    then
        echo "$FILE exists skipping download."
        cp -r /usr/share/games/SpaceCadetPinball/3DPinball.zip $pkgdir/usr/share/games/$_rpkgname
    else
        echo "$FILE does not exist, Starting download.."
        cd $srcdir/$rpkgname
        wget "https://archive.org/download/3DPinball/3DPinball.zip"
    fi
    install -Dm755 "$srcdir/$_rpkgname" "$pkgdir/usr/bin"
    cd $srcdir/$rpkgname
    cp "$srcdir/$rpkgname/$rpkgname" "$pkgdir/usr/bin"
    cp -r ./ "$pkgdir/usr/share/games/$_rpkgname"
    cp $rpkgname.png "$pkgdir/usr/share/pixmaps"

    # Desktop Entry
    install -Dm644 "$srcdir/$rpkgname/$rpkgname.desktop" \
    "$pkgdir/usr/share/applications/$rpkgname.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$rpkgname.desktop"
}
