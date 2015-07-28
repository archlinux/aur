# Maintainer: Tosh (tosh <at> t0x0sh <dot> org)

pkgname=landeseternelles
pkgver=1.9.0
pkgrel=2
pkgdesc="Landes Eternelles is a frensh role playing game (mmorpg), forked from Eternal Lands."
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

    make -f Makefile.linux || return 1

    cd "$srcdir/editeur_sources"

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

sha256sums=('49914957704e043dc38b9b18d5b4a027ef061aafb2d068c7d4f6d3ce421e52a3'
                '8cf98ab4d27fa847bc81b371fd29959b1e73e91e29ea5ed080cda0d20007e55b'
                '55aa2a48188fcc38d47dab3c2021439913b0ae716f9c54fb67c48e22e50700b4'
                '9451f0745d72d37ecabe8230e849b24801ba70c55cb11d45c15b09dcf2acf930'
                'f42bb2fdd8b981ca2ed5552110831e349852439b3ea0ead13f7fa328f3a30b72')