# Maintainer:  Ainola
# Contributor: Sven-Hendrik Haase
# Contributor: Xyne
# Contributor: Rick Chen (stuffcorpse)
# Contributor: Jaroslaw Swierczynski
# Contributor: Roman Kyrylych
# Contributor: Camille Moncelier

pkgname=nexuiz
pkgver=2.5.2
pkgrel=8
arch=('x86_64')
pkgdesc="Fast-paced multiplayer first-person shooter."
url="https://www.alientrap.com/games/nexuiz/"
license=("GPL2")
makedepends=('libicns' 'gendesk')
depends=('libgl' 'alsa-lib' 'libjpeg>=8' 'libxpm' 'libxxf86dga' 'libxxf86vm' 'hicolor-icon-theme' 'sdl')
conflicts=('nexuiz-data')
provides=('nexuiz-data')
source=("http://downloads.sourceforge.net/$pkgname/${pkgname}-${pkgver//./}.zip"
        "libpng14.patch")
sha256sums=('a5e27ebcc9775c4a490d0d3536c32e4a8f8f96b038c0b6a78d1823c37a962000'
            '327c45a56faa1963fa08a590694fd0c23bed448282f9473c2d483447df9a6e1f')
# Prevent compressing final package, otherwise compression time takes an
# eternity for not much gain
PKGEXT='.pkg.tar'

prepare() {
    gendesk -f -n --pkgname="$pkgname-sdl" \
        --name="Nexuiz (SDL)" \
        --pkgdesc="$pkgdesc" \
        --exec=/usr/bin/nexuiz-sdl \
        --categories='Game'
    gendesk -f -n --pkgname="$pkgname-glx" \
        --name="Nexuiz (GLX)" \
        --pkgdesc="$pkgdesc" \
        --exec=/usr/bin/nexuiz-glx \
        --categories='Game'

    # Remove unneeded cruft
    find Nexuiz -name "*_windows.bat" -exec rm {} +
    find Nexuiz -name "*_mac.sh" -exec rm {} +

    cd Nexuiz
    bsdtar -x -f "sources/enginesource20091001.zip"
    cd darkplaces
    patch -p1 < "$srcdir/libpng14.patch"

    cd "$srcdir/Nexuiz/Nexuiz.app/Contents/Resources"
    icns2png -x Nexuiz.icns
}

build(){
    cd Nexuiz/darkplaces
    # Build the binaries separately instead to avoid truncated files
    make CPUOPTIMIZATIONS="$CFLAGS" DP_FS_BASEDIR=/usr/share/nexuiz/ DP_LINK_TO_LIBJPEG=1 cl-nexuiz
    make CPUOPTIMIZATIONS="$CFLAGS" DP_FS_BASEDIR=/usr/share/nexuiz/ DP_LINK_TO_LIBJPEG=1 sdl-nexuiz
    make CPUOPTIMIZATIONS="$CFLAGS" DP_FS_BASEDIR=/usr/share/nexuiz/ DP_LINK_TO_LIBJPEG=1 sv-nexuiz
}

package(){
    install -Dm755 Nexuiz/darkplaces/nexuiz-{dedicated,glx,sdl} -t "$pkgdir/usr/bin/"
    install -Dm644 *.desktop -t "$pkgdir/usr/share/applications/"

    # Documentation
    install -dm755 "$pkgdir/usr/share/doc/nexuiz/"
    mv Nexuiz/Docs/* "$pkgdir/usr/share/doc/nexuiz/"
    find "$pkgdir/usr/share/doc/nexuiz" -type d -exec chmod 755 {} +
    find "$pkgdir/usr/share/doc/nexuiz" -type f -exec chmod 644 {} +

    # Game Data
    install -dm755 "$pkgdir/usr/share/nexuiz"
    mv Nexuiz/{data,havoc,server} "$pkgdir/usr/share/nexuiz/"
    find "$pkgdir/usr/share/nexuiz/$dir" -type d -exec chmod 755 {} +
    find "$pkgdir/usr/share/nexuiz/$dir" -type f -exec chmod 644 {} +

    cd Nexuiz/Nexuiz.app/Contents/Resources
    for size in 16 32 128 256 512; do
        install -Dm644 "Nexuiz_${size}x${size}x32.png" \
            "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/nexuiz.png"
    done
}
