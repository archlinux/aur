pkgname=nzportable-bin
pkgver=2.0.0indev20250115072021
pkgrel=1
scriptver=1.0.6.1
pkgdesc='Nazi Zombies: Portable, a Call of Duty: Zombies "de-make" powered by various enhanced forks of the Quake engine'
arch=('x86_64' 'i686' 'aarch64' 'armv7l')
url="https://gitlab.com/linuxbombay/nzp"
license=('GPL2')
depends=('sdl2' 'yad')
makedepends=('unzip')
sha256sums=('1e12a4017f50ef12c7bf7b5e9603c7608b83fd3690ede4b88bf62d4ef85bd1c2')
                   
source=("https://gitlab.com/linuxbombay/nzp/nzp-packaging/-/archive/$scriptver/nzp-packaging-$scriptver.tar.bz2")

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share/pixmaps"
    install -dm755 "$pkgdir/usr/share/games/NZP"
    install -dm755 "$pkgdir/usr/share/applications"
    
    cd "$srcdir"
    echo "$pkgver" > "$srcdir/version.txt"
    echo "$CARCH"

if [[ "$CARCH" == "x86_64" ]]; then
    filename="nzportable-linux64.zip"
    url="https://gitlab.com/linuxbombay/nzp/binaries/$pkgver/-/raw/main/$filename"

elif [[ "$CARCH" == "aarch64" ]]; then
    filename="nzportable-linuxarm64.zip"
    url="https://gitlab.com/linuxbombay/nzp/binaries/$pkgver/-/raw/main/$filename"

elif [[ "$CARCH" == "armv7l" ]]; then
    filename="nzportable-linuxarmhf.zip"
    url="https://gitlab.com/linuxbombay/nzp/binaries/$pkgver/-/raw/main/$filename"

elif [[ "$CARCH" == "i686" ]]; then
    filename="nzportable-linux32.zip"
    url="https://gitlab.com/linuxbombay/nzp/binaries/$pkgver/-/raw/main/$filename"

else
    echo "Unknown architecture: $CARCH"
    exit 1
fi

# Check if the file already exists before downloading
if [[ -f "$srcdir/$filename" ]]; then
    echo "$filename already exists in $srcdir, skipping download."
else
    # File doesn't exist, proceed with download
    echo "Downloading $filename for $CARCH architecture."
    wget "$url" -P "$srcdir"
fi  
    cp -r "$srcdir/version.txt" "$pkgdir/usr/share/games/NZP"
    cp -r $srcdir/*nzportable-*.zip "$pkgdir/usr/share/games/NZP"
    cp -r "$srcdir/nzp-packaging-$scriptver/nzp.svg" "$pkgdir/usr/share/pixmaps"
    cp -r "$srcdir/nzp-packaging-$scriptver/nzp-title.png" "$pkgdir/usr/share/games/NZP"
    
    # Link to binary
    install -Dm755 "$srcdir/nzp-packaging-$scriptver/nzp.sh" "$pkgdir/usr/bin/nzp"

    # Desktop Entry
    install -Dm644 "$srcdir/nzp-packaging-$scriptver/nzp.desktop" \
        "$pkgdir/usr/share/applications/nzp.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/nzp.desktop"
}
