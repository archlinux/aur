# Maintainer:  Ainola
# Contributor: Sven-Hendrik Haase
# Contributor: Xyne
# Contributor: Rick Chen (stuffcorpse)
# Contributor: Jaroslaw Swierczynski
# Contributor: Roman Kyrylych
# Contributor: Camille Moncelier

pkgname=nexuiz
pkgver=2.5.2
pkgrel=7
arch=('x86_64')
pkgdesc="Fast-paced multiplayer first-person shooter."
url="http://www.alientrap.com/games/nexuiz/"
license=("GPL2")
depends=('libgl' 'alsa-lib' 'libjpeg>=8' 'libxpm' 'libxxf86dga' 'libxxf86vm' 'hicolor-icon-theme' 'sdl')
conflicts=('nexuiz-data')
provides=('nexuiz-data')
source=("http://downloads.sourceforge.net/$pkgname/${pkgname}-${pkgver//./}.zip"
        "nexuiz-glx.desktop"
        "nexuiz-sdl.desktop"
        "libpng14.patch"
        "nex-icons.tar.gz")
sha256sums=('a5e27ebcc9775c4a490d0d3536c32e4a8f8f96b038c0b6a78d1823c37a962000'
            '277ace303189dc25403a1a7c03b66d033e6aed52c98adb4ecfb5f627b101fff3'
            '50ad2bf51a291635d7d3195745f9536b7182c0ed548259c0a8627ea951e3da7f'
            '327c45a56faa1963fa08a590694fd0c23bed448282f9473c2d483447df9a6e1f'
            '25e478b783bb7f8cff04b7c3e538a82e8ab852d72930277e83d00777d2a7186e')
# Prevent compressing final package, otherwise compression time takes an
# eternity for not much gain
PKGEXT='.pkg.tar'

prepare() {
    # Remove unneeded cruft
    find Nexuiz -name "*_windows.bat" -exec rm {} \;
    find Nexuiz -name "*_mac.sh" -exec rm {} \;
}

build(){
    cd Nexuiz
    bsdtar -x -f "sources/enginesource20091001.zip"
    cd darkplaces
    patch -p1 < "$srcdir/libpng14.patch"

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
    find "$pkgdir/usr/share/doc/nexuiz" -type d -exec chmod 755 {} \;
    find "$pkgdir/usr/share/doc/nexuiz" -type f -exec chmod 644 {} \;

    # Game Data
    install -dm755 "$pkgdir/usr/share/nexuiz"
    mv Nexuiz/{data,havoc,server} "$pkgdir/usr/share/nexuiz/"
    find "$pkgdir/usr/share/nexuiz/$dir" -type d -exec chmod 755 {} \;
    find "$pkgdir/usr/share/nexuiz/$dir" -type f -exec chmod 644 {} \;

    for size in 16 22 24 32 48 64 128 256 512; do
        install -Dm644 "nex${size}.png" \
            "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/nexuiz.png"
    done
}
