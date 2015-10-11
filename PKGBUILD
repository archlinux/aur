# Maintainer: Sean Baggaley <coffeescripter at gmail dot com>
pkgname=doomseeker-hg
_dsver=1.1
pkgver=1.1.r1510091830
pkgrel=2
pkgdesc="A cross-platform Doom server browser"
arch=(i686 x86_64)
url="http://doomseeker.drdteam.org/"
license=("GPL2")
depends=('qt5-base' 'qt5-multimedia' 'zlib' 'bzip2')
makedepends=('gcc' 'cmake' 'make' 'mercurial' 'qt5-tools')
optdepends=('zandronum2: GZDoom fork supporting client/server multiplayer'
	    'odamex: Classic client/server multiplayer fork'
	    'chocolate-doom: Doom source port accurately reproducing the original DOS versions of Doom')
source=("doomseeker::hg+https://bitbucket.org/Blzut3/doomseeker"
        "doomseeker.desktop"
        "doomseeker-launch-script.sh")
sha256sums=('SKIP'
            'a66e2ecca5cd32a0480776f6adfd8420d18fa56de1ca574aae61bbea95bd3c2c'
            '96fca72228a50d80b019adf3c82b8800a9d7f03994252e544513537541d011a4')
conflicts=('doomseeker')
provides=('doomseeker')

_bbdir=doomseeker

pkgver() {
    cd $srcdir/$_bbdir

	IFS=' ' read -a split <<< "$(hg log -r. --template "{date|hgdate}" "$PWD")"
	echo "$_dsver.r$(date -d @${split[0]} '+%y%m%d%H%M')"
}

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
