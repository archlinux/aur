# Maintainer: Kyle Keen <keenerd@gmail.com>
pkgname=vicious-orcs
pkgver=001
pkgrel=1
pkgdesc="A Seven Day Roguelike written by Jeff Lait."
arch=('i686' 'x86_64')
url="http://www.zincland.com/7drl/orcs/"
license=('BSD')
depends=('libtcod' 'sdl_mixer')
source=(http://www.zincland.com/7drl/orcs/orcs$pkgver.zip)
md5sums=('7dce0344741f8c05d2459cd0a00b1e21')

build() {
    cd "$srcdir/orcs$pkgver"
    cd src/support/enummaker
    make clean
    make
    cd ../../linux
    ../support/enummaker/enummaker ../source.txt

    # paths
    sed -i 's|../music/|/usr/share/orcs/|' ../orc.cfg
    sed -i 's|../orc.cfg|/etc/orcs.cfg|' ../main.cpp
    sed -i '1609i TCODConsole::setCustomFont("/usr/share/orcs/terminal.png", TCOD_FONT_LAYOUT_ASCII_INCOL | TCOD_FONT_TYPE_GREYSCALE);' ../main.cpp
    sed -i 's|../rooms|/usr/share/orcs/rooms|' ../map.cpp
    sed -i 's|../text.txt|/usr/share/orcs/text.txt|' ../text.cpp

    # use our libs
    sed -i 's|../lib/libtcod-1.5.0/include|/usr/include/libtcod/|' Makefile
    sed -i 's|../lib/libtcod-1.5.0|/usr/lib/|' Makefile

    # stdlib is smaller than you think
    sed -i '28i #include <unistd.h>' ../map.cpp
    sed -i '24i #include <stdio.h>'  ../mob.cpp

    # patches for libtcod 1.5.1
    sed -i 's/setBack/setCharBackground/g' ../{firefly,gfxengine}.cpp
    sed -i 's/setFore/setCharForeground/g' ../gfxengine.cpp
    sed -i 's/getBack/getCharBackground/g' ../gfxengine.cpp
    sed -i 's/getFore/getCharForeground/g' ../gfxengine.cpp

    sed -i '245i myNoise[n]->setType(TCOD_NOISE_WAVELET);' ../firefly.cpp
    sed -i '375i glbPulseNoise->setType(TCOD_NOISE_WAVELET);' ../gfxengine.cpp
    sed -i 's/getTurbulenceWavelet/getTurbulence/g' ../{firefly,gfxengine}.cpp
    sed -i 's/getWavelet(np)/get(np, TCOD_NOISE_WAVELET)/g' ../firefly.cpp

    make clean
    make
    # complaints about undefined references to __sync_fetch_and_add_4 ?
    # make --march=pentium4
}

package() {
    cd "$srcdir/orcs$pkgver"
    cd src/linux
    install -Dm755 orc_bin          "$pkgdir/usr/bin/orcs"
    cd ../rooms
    install -d "$pkgdir/usr/share/orcs/rooms"
    cp *.map   "$pkgdir/usr/share/orcs/rooms"
    cd ..
    install -Dm664 -g games orc.cfg     "$pkgdir/etc/orcs.cfg"
    install -Dm644 text.txt                "$pkgdir/usr/share/orcs/text.txt"
    cd ..
    #install -Dm644 music/azogs_march_2.ogg "$pkgdir/usr/share/kobold/azogs_march_2.ogg"
    install -Dm644 linux/terminal.png    "$pkgdir/usr/share/orcs/terminal.png"
}

