# Maintainer: Sean Baggaley <coffeescripter@gmail.com>
pkgname=doomseeker-hg
pkgver=1.1.1509131620
pkgrel=1
pkgdesc="A cross-platform Doom server browser"
arch=(i686 x86_64)
url="http://doomseeker.drdteam.org/"
license=("GPL2")
depends=('qt5-base' 'qt5-multimedia' 'zlib' 'bzip2')
makedepends=('gcc' 'cmake' 'make' 'mercurial')
source=("doomseeker::hg+https://bitbucket.org/Blzut3/doomseeker"
        "doomseeker.desktop"
        "doomseeker-launch-script.sh")
sha256sums=('SKIP'
            '799f4e9a2a9c538c0f4e342d4d947d2a31af99461675a55e52eefc0641388a4a'
            '96fca72228a50d80b019adf3c82b8800a9d7f03994252e544513537541d011a4')

_bbdir=doomseeker

build() {
    cd $srcdir/$_bbdir
    mkdir -p build
    cd build
    cmake -DCMAKE_BUILD_TYPE=Release .. && \
    make
}

package() {
    mkdir -p $pkgdir/usr/games/doomseeker/engines/
    cd $srcdir/$_bbdir/build
    install -Dm755 doomseeker "$pkgdir/usr/games/doomseeker"
    install -Dm755 libwadseeker.so "$pkgdir/usr/games/doomseeker"
    cd engines
    for f in *.so; do
        install -Dm755 $f "$pkgdir/usr/games/doomseeker/engines/$f"
    done
    cd ../../
    install -Dm644 media/icon.png "$pkgdir/usr/share/pixmaps/doomseeker.png"
    install -Dm755 $srcdir/../doomseeker-launch-script.sh "$pkgdir/usr/bin/doomseeker"
    install -Dm644 "$srcdir/../doomseeker.desktop" "$pkgdir/usr/share/applications/doomseeker.desktop"
}
