# Maintainer: Tosh (tosh <at> t0x0sh <dot> org)

pkgname=landeseternelles
pkgver=1.9.0
pkgrel=6
pkgdesc="Landes Eternelles is a french role playing game (mmorpg), forked from Eternal Lands."
arch=('i686' 'x86_64')
url="http://www.landes-eternelles.com"
license=(custom:'eternal_lands_license')
depends=('sdl_net' 'sdl_image' 'cal3d' 'mesa' 'openal' 'libxslt' 'libvorbis' 'gtk2')
install='landeseternelles.install'

source=(
    http://landes-eternelles.com/client/1900/Client_Sources-1.9.0.tar.bz2
    http://www.landes-eternelles.com/client/1900/Editeur_Sources-1.9.0.tar.bz2
    http://landes-eternelles.com/client/1900/linux/LandesEternellesLinux-1.9.0.tar.bz2
    landeseternelles.desktop
    landeseternelles.png
)

build() {
    cd "$srcdir/client_sources"

    sed -i -r "s/__inline__//g" $srcdir/client_sources/minimap.c
    sed -i -r "s/__inline__//g" $srcdir/client_sources/weather.c
    sed -i -r "s/abs\(last_mod_time - SDL_GetTicks\(\)\)/abs\(\(long int\) SDL_GetTicks\(\) - last_mod_time\)/" $srcdir/client_sources/item_lists.cpp
    sed -i -r "s/abs\(SDL_GetTicks\(\) - last_flash_change\)/abs\(\(long int\) SDL_GetTicks\(\) - last_flash_change\)/" $srcdir/client_sources/icon_window.cpp

    make -f Makefile.linux || return 1

    cd "$srcdir/editeur_sources"
    sed -i -r "s/#define min/\/\/#define min/g" $srcdir/editeur_sources/global.h
    sed -i -r "s/#define max/\/\/#define max/g" $srcdir/editeur_sources/global.h

    make -f Makefile.linux || return 1
}

package() {
    mkdir -p $pkgdir/usr/{bin,share/{$pkgname,licenses/$pkgname,pixmaps,applications}}
    install -m644 $srcdir/landeseternelles.desktop $pkgdir/usr/share/applications/landeseternelles.desktop
    install -m644 $srcdir/landeseternelles.png $pkgdir/usr/share/pixmaps/landeseternelles.png

    if [ $CARCH == "x86_64" ];then
	    cd "$srcdir/client_sources"
	    install -m755 le.x86_64.linux.bin $pkgdir/usr/bin/le.$CARCH.linux.bin
	    cd "$srcdir/editeur_sources"
	    install -m755 mapedit.x86_64.linux.bin $pkgdir/usr/bin/mapedit.$CARCH.linux.bin
    else
	    cd "$srcdir/client_Sources"
	    install -m755 le.x86.linux.bin $pkgdir/usr/bin/le.x86.linux.bin
	    cd "$srcdir/editeur_Sources"
	    install -m755 mapedit.x86.linux.bin $pkgdir/usr/bin/mapedit.x86.linux.bin
    fi

    cd "$srcdir/LandesEternellesLinux"
    rm -f *.bin icon.bmp
    mv -f Licence.txt $pkgdir/usr/share/licenses/$pkgname/
    mv -f * $pkgdir/usr/share/$pkgname/
}

sha256sums=('e00b6b1771698cbac22502afab17b4bd8a0ece8268ec80ee7ba137236ba60010'
            '8cf98ab4d27fa847bc81b371fd29959b1e73e91e29ea5ed080cda0d20007e55b'
            '55aa2a48188fcc38d47dab3c2021439913b0ae716f9c54fb67c48e22e50700b4'
            '1357259d4232d8533d3acdf22c63a9b650472f0ca2cf9841eb03ebd6a514e3f7'
            'f42bb2fdd8b981ca2ed5552110831e349852439b3ea0ead13f7fa328f3a30b72')
