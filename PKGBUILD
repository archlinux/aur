pkgname=sonicthehedgehog2
_pkgname=SonicTheHedgehog2
pkgver=1.0.3
pkgrel=1
pkgdesc="Sonic the Hedgehog 2 game powered by the rsdkv4 engine."
arch=('x86_64' 'aarch64' 'i686')
url="https://gitlab.com/linuxbombay/sonicthehedgehog2"
license=('GPL')
depends=('rsdkv4-bin' 'libogg' 'libvorbis' 'wget' 'sdl2' 'unzip' 'yad')
makedepends=('unzip')
source=("https://gitlab.com/linuxbombay/sonicthehedgehog2/-/archive/$pkgver/sonicthehedgehog2-$pkgver.tar.bz2")
sha256sums=('2918db8ac15f8c42d82dcc08336018a8fcba1671785f1cd95da3f7b0b0987166')

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
        cp -r "/usr/share/games/$_pkgname/Data.rsdk" "$pkgdir/usr/share/games/$_pkgname"
    else
        echo "$FILE does not exist, Starting download.."
        cd $srcdir/sonicthehedgehog2-$pkgver
        wget "https://archive.org/download/data_20231229/Data.rsdk"
    fi
    cd $srcdir/sonicthehedgehog2-$pkgver
    cp "$srcdir/sonicthehedgehog2-$pkgver/sonic2.sh" "$pkgdir/usr/bin/sonic2"
    cp -r ./ "$pkgdir/usr/share/games/$_pkgname"
    cp sonic2.png "$pkgdir/usr/share/pixmaps"

    # Desktop Entry
    install -Dm644 "$srcdir/sonicthehedgehog2-$pkgver/$_pkgname.desktop" \
    "$pkgdir/usr/share/applications/$_pkgname.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
