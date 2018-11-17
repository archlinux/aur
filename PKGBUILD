# Maintainer: Kyle Keen <keenerd@gmail.com>
pkgname=hyperrogue
pkgver=10.4z
_pkgver=104z
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
md5sums=('cae0d8e0933fc7af12853b4676b989a8')
#echo http://www.roguetemple.com/z/hyper/hyperrogue${_pkgver}-{lq,win}.zip
if [[ "$_music" == "low" ]]; then
    source+=("http://www.roguetemple.com/z/hyper/hyperrogue${_pkgver}-lq.zip")
    md5sums+=('46a908216afefd6cb199442af7a33d52')
fi
if [[ "$_music"  == "full" ]]; then
    source+=("http://www.roguetemple.com/z/hyper/hyperrogue${_pkgver}-win.zip")
    md5sums+=('8b928f7108ae068fe521e3d27f48c357')
fi

prepare() {
    cd "$srcdir/$pkgname${_pkgver}-src"
    sed -i 's|TTF_OpenFont.*;|TTF_OpenFont("/usr/share/fonts/TTF/DejaVuSans-Bold.ttf", siz);|' basegraph.cpp
    #sed -i 's|<SDL.h>|"SDL.h"|' /usr/include/SDL/SDL_gfxPrimitives.h  # todo: confirm bug and open
    sed -i 's|-c hyper.cpp|& -I/usr/include/SDL/|' Makefile  # remove when above bug is fixed
    sed -i 's|savepng.c|savepng.cpp|' Makefile
    sed -i 's|-Werror||' Makefile
}

build() {
    cd "$srcdir/$pkgname${_pkgver}-src"
    make
}

package() {
    cd "$srcdir/$pkgname${_pkgver}-src"
    install -Dm755 hyperrogue "$pkgdir/usr/bin/hyperrogue"
    if [[ -z "$_music" ]]; then
        return
    fi
    install -Dm644 hyperrogue-music.txt "$pkgdir/usr/share/hyperrogue/hyperrogue-music.txt"
    cd "$srcdir/$pkgname${_pkgver}"
    cp *.ogg "$pkgdir/usr/share/hyperrogue/"
}

