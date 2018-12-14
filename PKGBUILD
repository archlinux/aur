# Maintainer: Tosh (tosh <at> t0x0sh <dot> org)

pkgname=landeseternelles
pkgver=1.9.3
pkgrel=1
pkgdesc="Landes Eternelles is a french role playing game (mmorpg), forked from Eternal Lands."
arch=('i686' 'x86_64')
url="http://www.landes-eternelles.com"
license=(custom:'eternal_lands_license')
depends=('sdl_net' 'sdl_image' 'cal3d' 'mesa' 'openal' 'libxslt' 'libvorbis' 'gtk2')
install='landeseternelles.install'

client_sources="Client_Sources-1.9.3"
editeur_sources="Editeur_Sources-1.9.3"
datas="LandesEternellesLinux-1.9.3"


source=(
    http://landes-eternelles.com/client/1930/$client_sources.zip
    http://www.landes-eternelles.com/client/1930/$editeur_sources.zip
    http://landes-eternelles.com/client/1930/linux/$datas.zip
    landeseternelles.desktop
    landeseternelles.png
)

noextract=(
   $client_sources.zip
   $editeur_sources.zip
)

prepare() {
          mkdir -p client_sources editeur_sources
          (cd client_sources && bsdtar -x -f ../$client_sources.zip)
          (cd editeur_sources && bsdtar -x -f ../$editeur_sources.zip)
}

build() {
    cd "$srcdir/client_sources"

    sed -i -r "s/abs\(last_mod_time - SDL_GetTicks\(\)\)/abs\(\(long int\) SDL_GetTicks\(\) - last_mod_time\)/" $srcdir/client_sources/item_lists.cpp
    sed -i -r "s/abs\(SDL_GetTicks\(\) - last_flash_change\)/abs\(\(long int\) SDL_GetTicks\(\) - last_flash_change\)/" $srcdir/client_sources/icon_window.cpp

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
	    cd "$srcdir/client_sources"
	    install -m755 le.x86.linux.bin $pkgdir/usr/bin/le.x86.linux.bin
	    cd "$srcdir/editeur_Sources"
	    install -m755 mapedit.x86.linux.bin $pkgdir/usr/bin/mapedit.x86.linux.bin
    fi

    cd "$srcdir/$datas"
    rm -f *.bin icon.bmp
    mv -f Licence.txt $pkgdir/usr/share/licenses/$pkgname/
    mv -f * $pkgdir/usr/share/$pkgname/
}

sha256sums=('e622b57d1a62a9ddf8d1574ac89f0deb482d89d6045073020f470c608b835858'
            'ed33675c87723656544e63dabe59ad8ecf37576dacebf5a01d0ac0ad9a079390'
            'efe94668e121a87717d850a14379797927730c9962a673cc1613e1c89addd8d0'
            '1357259d4232d8533d3acdf22c63a9b650472f0ca2cf9841eb03ebd6a514e3f7'
            'f42bb2fdd8b981ca2ed5552110831e349852439b3ea0ead13f7fa328f3a30b72')
