# Maintainer: Kyle Keen <keenerd@gmail.com>
pkgname=hyperrogue
pkgver=11.3o
_pkgver=113o
_musicver=113a
pkgrel=1
pkgdesc="You are a lone outsider in a strange, non-Euclidean hyperbolic world.  Optional music."
arch=('i686' 'x86_64')
url="http://www.roguetemple.com/z/hyper.php"
license=('GPL2')
depends=('sdl_gfx' 'sdl_ttf' 'sdl_mixer' 'mesa' 'ttf-dejavu')
makedepends=('glu')

# set to "" for none or "low" or "full"
_music=""

#source=("http://www.roguetemple.com/z/hyper/hyperrogue${_pkgver}-src.tgz")
source=("hyperrogue-$pkgver.tgz::https://github.com/zenorogue/hyperrogue/archive/v${pkgver}.tar.gz")
md5sums=('6bf9dc99e905da19ba8a36192545252d')
#echo http://www.roguetemple.com/z/hyper/hyperrogue${_pkgver}-{lq,win}.zip
if [[ "$_music" == "low" ]]; then
    source+=("http://www.roguetemple.com/z/hyper/hyperrogue${_musicver}-lq.zip")
    md5sums+=('589c7d72fa1caae7fdf383a32289387c')
fi
if [[ "$_music"  == "full" ]]; then
    source+=("http://www.roguetemple.com/z/hyper/hyperrogue${_musicver}-win.zip")
    md5sums+=('eda71cad345933f2cf42830a2eae6b6b')
fi

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    ./autogen.sh
    sed -i 's|TTF_OpenFont.*;|TTF_OpenFont("/usr/share/fonts/TTF/DejaVuSans-Bold.ttf", siz);|' basegraph.cpp
    #sed -i 's|<SDL.h>|"SDL.h"|' /usr/include/SDL/SDL_gfxPrimitives.h  # todo: confirm bug and open
    sed -i 's|-c hyper.cpp|& -I/usr/include/SDL/|' Makefile  # remove when above bug is fixed
    sed -i 's|DEFAULT_INCLUDES = -I.$|& -I/usr/include/SDL/|'  Makefile  # ditto
    sed -i 's|savepng.c|savepng.cpp|' Makefile
    sed -i 's|savepng.cpppp|savepng.cpp|' Makefile
    sed -i 's|-Werror||' Makefile
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 hyperrogue "$pkgdir/usr/bin/hyperrogue"
    if [[ -z "$_music" ]]; then
        return
    fi
    install -Dm644 hyperrogue-music.txt "$pkgdir/usr/share/hyperrogue/hyperrogue-music.txt"
    cd "$srcdir/$pkgname-$pkgver"
    cp *.ogg "$pkgdir/usr/share/hyperrogue/"
}

