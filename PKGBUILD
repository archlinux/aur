# Maintainer: Kyle Keen <keenerd@gmail.com>
pkgname=smart-kobold
pkgver=002
pkgrel=1
pkgdesc="Kobolds in this roguelike are smarter than your average kobold."
arch=('i686' 'x86_64')
url="http://www.zincland.com/7drl/kobold/"
license=('BSD')
depends=('libtcod' 'sdl_mixer')
source=(http://www.zincland.com/7drl/kobold/kobold$pkgver.zip)
md5sums=('c2feb1e7202fdd8cf4e740f47faac301')

build() {
    cd "$srcdir/kobold$pkgver"
    cd src/support/enummaker
    make
    cd ../../linux
    ../support/enummaker/enummaker ../source.txt

    # paths
    sed -i 's|../music/|/usr/share/kobold/|' ../kobold.cfg
    sed -i 's|../kobold.cfg|/etc/kobold.cfg|' ../main.cpp
    sed -i '1073i TCODConsole::setCustomFont("/usr/share/kobold/terminal.png", TCOD_FONT_LAYOUT_ASCII_INCOL | TCOD_FONT_TYPE_GREYSCALE);' ../main.cpp
    sed -i 's|../rooms|/usr/share/kobold/rooms|' ../map.cpp
    sed -i 's|../text.txt|/usr/share/kobold/text.txt|' ../text.cpp

    # use our libs
    sed -i 's|../lib/libtcod-1.5.0/include|/usr/include/libtcod/|' Makefile
    sed -i 's|../lib/libtcod-1.5.0|/usr/lib/|' Makefile

    # stdlib is smaller than you think
    sed -i '28i #include <unistd.h>' ../map.cpp
    sed -i '24i #include <stdio.h>'  ../mob.cpp

    # patches for libtcod 1.5.1
    sed -i 's/setBack/setCharBackground/g' ../{firefly,gfxengine}.cpp
    sed -i 's/setFore/setCharForeground/g' ../gfxengine.cpp

    sed -i '197i myNoise[n]->setType(TCOD_NOISE_WAVELET);' ../firefly.cpp
    sed -i '375i glbPulseNoise->setType(TCOD_NOISE_WAVELET);' ../gfxengine.cpp
    sed -i 's/getTurbulenceWavelet/getTurbulence/g' ../{firefly,gfxengine}.cpp
    sed -i 's/getWavelet(np)/get(np, TCOD_NOISE_WAVELET)/g' ../firefly.cpp

    make
    # complaints about undefined references to __sync_fetch_and_add_4 ?
    # make --march=pentium4
}

package() {
    cd "$srcdir/kobold$pkgver"
    cd src/linux
    install -Dm755 kobold_bin          "$pkgdir/usr/bin/kobold"
    cd ../rooms
    install -d "$pkgdir/usr/share/kobold/rooms"
    cp *.map   "$pkgdir/usr/share/kobold/rooms"
    cd ..
    install -Dm664 -g games kobold.cfg     "$pkgdir/etc/kobold.cfg"
    install -Dm644 text.txt                "$pkgdir/usr/share/kobold/text.txt"
    cd ..
    install -Dm644 music/azogs_march_2.ogg "$pkgdir/usr/share/kobold/azogs_march_2.ogg"
    install -Dm644 windows/terminal.png    "$pkgdir/usr/share/kobold/terminal.png"
}

