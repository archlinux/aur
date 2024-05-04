pkgname=wolf3d
_pkgname=Wolf3D
pkgver=1.0.0
pkgrel=2
pkgdesc="Wolfenstein3D game powered by the wolf4sdl."
arch=('pentium4' 'i386' 'i686' 'x86_64' 'aarch64')
url="https://gitlab.com/linuxbombay/wolfenstein3d"
license=('GPL')
depends=('wolf4sdl-bin' 'wget' 'unzip' 'yad')
makedepends=('unzip')
source=("$url/-/archive/$pkgver-$pkgrel/wolfenstein3d-$pkgver-$pkgrel.tar.bz2")
sha256sums=("SKIP")

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm775 "$pkgdir/usr/share/games/$_pkgname"
    install -dm755 "$pkgdir/usr/share/pixmaps"

    # Packaging files
    #for dir in $_pkgname-$pkgver-$pkgrel-*/ ; do mv "${dir}" "$pkgname-$pkgver-$pkgrel" ;done
    # Check if config.wl6 exists so it doesn't redownload the file when it doesn't need to.
    FILE="/usr/share/games/$_pkgname/config.wl6"
     if test -f "$FILE"
    then
        echo "$FILE exists skipping download."
        cp '/usr/share/games/Wolf3D/'*.wl6 "$pkgdir/usr/share/games/$_pkgname"
    else
        echo "$FILE does not exist, Starting download.."
        cd $srcdir
        wget "https://archive.org/download/wolf3d-datafiles/wolf3d-datafiles.zip"
        unzip wolf3d-datafiles.zip -d "$pkgdir/usr/share/games/$_pkgname"
    fi
    cd $srcdir/wolfenstein3d-$pkgver-$pkgrel
    cp "$srcdir/wolfenstein3d-$pkgver-$pkgrel/$pkgname" "$pkgdir/usr/bin"
    cp -r ./ "$pkgdir/usr/share/games/$_pkgname"
    cp wolf3d.png "$pkgdir/usr/share/pixmaps"

    # Desktop Entry
    install -Dm644 "$srcdir/wolfenstein3d-$pkgver-$pkgrel/$_pkgname.desktop" \
    "$pkgdir/usr/share/applications/$_pkgname.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
