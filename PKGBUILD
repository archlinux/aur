pkgname=sonicthehedgehog2
_pkgname=SonicTheHedgehog2
pkgver=1.0.2
pkgrel=1
pkgdesc="Sonic the Hedgehog 2 game powered by the rsdkv4 engine."
arch=('x86_64' 'aarch64' 'i686')
url="https://gitlab.com/SonicRSDK/sonicthehedgehog2"
license=('GPL')
depends=('rsdkv4-bin' 'libogg' 'libvorbis' 'wget' 'sdl2' 'unzip' 'yad')
makedepends=('unzip')
source=("https://gitlab.com/linuxbombay/sonicthehedgehog2/-/archive/$pkgver-$pkgrel/sonicthehedgehog2-$pkgver-$pkgrel.tar.bz2")
sha256sums=('8c119dd65746c8ae1a6fc43beb9b3f9a7277bb9837b28a13aac0e5a32a3f85ae')

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm775 "$pkgdir/usr/share/games/$_pkgname"
    install -dm755 "$pkgdir/usr/share/pixmaps"

    # Packaging files
    
    # Check if Data.rsdk exists so it doesn't redownload the file when it doesn't need to.
    FILE="/usr/share/games/$_pkgname/Data.rsdk"
     if test -f "$FILE"
    then
        echo "$FILE exists skipping download."
    else
        echo "$FILE does not exist, Starting download.."
        cd $srcdir/sonicthehedgehog2-$pkgver-$pkgrel
        wget "https://archive.org/download/data_20231229/Data.rsdk"
    fi
    cd $srcdir/sonicthehedgehog2-$pkgver-$pkgrel
    cp "$srcdir/sonicthehedgehog2-$pkgver-$pkgrel/sonic2.sh" "$pkgdir/usr/bin/sonic2"
    cp -r ./ "$pkgdir/usr/share/games/$_pkgname"
    cp sonic2.png "$pkgdir/usr/share/pixmaps"

    # Desktop Entry
    install -Dm644 "$srcdir/sonicthehedgehog2-$pkgver-$pkgrel/$_pkgname.desktop" \
    "$pkgdir/usr/share/applications/$_pkgname.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
