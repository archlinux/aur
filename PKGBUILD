# Maintainer: Sean Baggaley <coffeescripter@gmail.com>
pkgname=doomseeker
pkgver=1.0
pkgrel=4
pkgdesc="A cross-platform Doom server browser"
arch=(i686 x86_64)
url="http://doomseeker.drdteam.org/"
license=("GPL2")
depends=('qt4' 'zlib' 'bzip2')
makedepends=('gcc' 'cmake' 'make')
optdepends=('zandronum2: GZDoom fork supporting client/server multiplayer'
    	    'odamex: Classic client/server multiplayer fork'
    	    'chocolate-doom: Doom source port accurately reproducing the original DOS versions of Doom')
source=("https://bitbucket.org/Blzut3/doomseeker/get/1.0.tar.gz"
        "doomseeker.desktop"
        "doomseeker-launch-script.sh")
sha256sums=('96c6b5b4832eae8caf0ab16b9f3fb5d04513f5a637098069b753e627c6f9df05'
            'a66e2ecca5cd32a0480776f6adfd8420d18fa56de1ca574aae61bbea95bd3c2c'
            '96fca72228a50d80b019adf3c82b8800a9d7f03994252e544513537541d011a4')

_bbdir=Blzut3-doomseeker-b1cb0d67f9b9

build() {
    cd $srcdir/$_bbdir
    mkdir -p build
    cd build
    cmake -DCMAKE_BUILD_TYPE=Release .. && \
    make -j$(nproc)
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
