# Maintainer: Kyle Keen <keenerd@gmail.com>
pkgname=hyperrogue
pkgver=10.4j
_pkgver=104j
pkgrel=1
pkgdesc="You are a lone outsider in a strange, non-Euclidean hyperbolic world.  Optional music."
arch=('i686' 'x86_64')
url="http://www.roguetemple.com/z/hyper.php"
license=('GPL2')
depends=('sdl_gfx' 'sdl_ttf' 'sdl_mixer' 'mesa' 'ttf-dejavu')
makedepends=('glu')

# set to "" for none or "low" or "full"
_music=""

source=("http://www.roguetemple.com/z/hyper/hyperrogue${_pkgver}-src.tgz")
md5sums=('9d0ab3ea82f4ee336efa743b64e63157')
#echo http://www.roguetemple.com/z/hyper/hyperrogue${_pkgver}-{lq,win}.zip
if [[ "$_music" == "low" ]]; then
    source+=("http://www.roguetemple.com/z/hyper/hyperrogue${_pkgver}-lq.zip")
    md5sums+=('01fa28837bd7e18cbb9939eee6910e01')
fi
if [[ "$_music"  == "full" ]]; then
    source+=("http://www.roguetemple.com/z/hyper/hyperrogue${_pkgver}-win.zip")
    md5sums+=('0b8c73976c9b5cc3de0b31e3ba496516')
fi

prepare() {
    cd "$srcdir/$pkgname${_pkgver}-src"
    sed -i 's|TTF_OpenFont.*;|TTF_OpenFont("/usr/share/fonts/TTF/DejaVuSans-Bold.ttf", siz);|' basegraph.cpp
    #sed -i 's|<SDL.h>|"SDL.h"|' /usr/include/SDL/SDL_gfxPrimitives.h  # todo: confirm bug and open
    sed -i 's|g++ hyper.cpp .*$|& -I/usr/include/SDL/|' Makefile  # remove when above bug is fixed
    sed -i 's|savepng.c|savepng.cpp|' Makefile
}

build() {
    cd "$srcdir/$pkgname${_pkgver}-src"
    make
}

package() {
    cd "$srcdir/$pkgname${_pkgver}-src"
    install -Dm755 hyper "$pkgdir/usr/bin/hyperrogue"
    if [[ -z "$_music" ]]; then
        return
    fi
    install -Dm644 hyperrogue-music.txt "$pkgdir/usr/share/hyperrogue/hyperrogue-music.txt"
    cd "$srcdir/$pkgname${_pkgver}"
    cp *.ogg "$pkgdir/usr/share/hyperrogue/"
}

