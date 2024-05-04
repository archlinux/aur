pkgname=icytower
_pkgname=IcyTower
pkgver=1.0.2
pkgrel=1
pkgdesc="Harold the Homeboy and his friends have decided to climb a huge tower they found the other day. It's up to you to help them get as high as possible without falling down, and collect extra points by doing cool moves on the way."
arch=('pentium4' 'x86_64')
url="https://gitlab.com/linuxbombay/icytower"
license=('GPL')
depends=('wget' 'wine' 'lib32-libpulse' 'unzip' 'yad')
makedepends=('unzip')
source=("$url/icytower/-/archive/$pkgver-$pkgrel/icytower-$pkgver-$pkgrel.tar.bz2")
sha256sums=('b9a900c533acf3c937115675cb16b044e71438f46f069e91087d93fd5ebfc275')
package() {
    install -d -m755 "$pkgdir/usr/share/games/$_pkgname"
    install -d -m755 "$pkgdir/usr/bin"
    install -d -m755 "$pkgdir/usr/share/pixmaps"

    # Check if the source directory exists
DIR="/usr/share/games/IcyTower"
if [ -d "$DIR" ]; then
    echo "Source directory exists."
    # Copy all files from the source directory to the destination directory
    cp -r "$DIR"/* "$pkgdir/usr/share/games/$_pkgname"
    echo "Files copied successfully."
else
    cd "$srcdir"
    # Deleting any existing downloads
    rm -rf "IcyTower.tar.gz"
    wget "$url/Binaries/1.3.1/-/raw/main/IcyTower.tar.gz"
    tar -xf IcyTower.tar.gz -C "$pkgdir/usr/share/games/$_pkgname"
    if [ $? -ne 0 ]; then
        echo "Download failed"
        exit 1
    fi
fi
    cd "$srcdir/icytower-$pkgver-$pkgrel"
    cp -r ./ "$pkgdir/usr/share/games/$_pkgname"
    cp -r "$pkgdir/usr/share/games/$_pkgname/$pkgname.png" "$pkgdir/usr/share/pixmaps"

    # Link to binary
    cp -r "$pkgdir/usr/share/games/$_pkgname/icytower" "$pkgdir/usr/bin"

    # Desktop Entry
    install -Dm644 "$pkgdir/usr/share/games/$_pkgname/$_pkgname.desktop" \
    "$pkgdir/usr/share/applications/$_pkgname.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$_pkgname.desktop"
}

