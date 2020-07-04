## Maintainer's note:
## The 'mouse.p' is a small ZX81 program I wrote in 1983. See 'mouse.txt' for details.

# Maintainer: Jouni Rinne <l33tmmx at gmail dot com>
pkgname=z81
pkgver=2.1
pkgrel=1
pkgdesc="Sinclair ZX80/ZX81 emulator"
arch=('x86_64' 'armv6h' 'armv7h')
url="http://www.svgalib.org/rus/z81.html"
license=('GPL2')
depends=('libxext')
optdepends=('alsa-oss: sound support')
source=("ftp://ftp.ibiblio.org/pub/Linux/system/emulators/zx/${pkgname}-${pkgver}.tar.gz"
        "ftp://ftp.nvg.ntnu.no/pub/sinclair/roms/zx80.rom"
        "ftp://ftp.nvg.ntnu.no/pub/sinclair/roms/zx81.rom"
        "Makefile.patch"
        "mouse.p"
        "mouse.txt")
noextract=('zx80.rom' 'zx81.rom')
sha256sums=('212a824a4af9ec345b77085af98c266d4e993ccdf2152eb74c1037d28efa1984'
            '9374711cb6a5fd53c1c98d1d20ecb444d01d621a322f3d066ef216d515ac5161'
            '14ad84f4243efcd41587ff46ab932d11087043e8d455a1ed2a227b9657828dfa'
            '01176ad810fc84c959469ff6b1cdb27064cfed6fb8bcddb4ba0e3827a7a917e3'
            '9bcea64e347b6841d3c4c1c2d6dadb93306ece65d5d88550da162a636cee20e6'
            '51da6a8dc7d4a9dd30f0cef0ea8bebfe1d31c8857f9bfce8a5d18940d7df14cd')

prepare() {
    cd ${pkgname}-${pkgver}
    cp ../*.rom .
    patch -p0 -i ../Makefile.patch
}

build() {
	cd ${pkgname}-${pkgver}
	make xz81 zx81get
}

package() {
	cd ${pkgname}-${pkgver}
	make PREFIX=${pkgdir}/usr install
    mkdir -p ${pkgdir}/usr/share/doc/z81
    chmod 644 {README,GAMENOTES}
    cp {README,GAMENOTES} ${pkgdir}/usr/share/doc/z81/
    mkdir -p ${pkgdir}/usr/share/z81/games
    chmod 644 games-etc/*
    cp games-etc/{*.p,*.txt} ${pkgdir}/usr/share/z81/games/
    cp ../mouse.{p,txt} ${pkgdir}/usr/share/z81/games/
}
