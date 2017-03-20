# Maintainer: Kyle Keen <keenerd@gmail.com>
pkgname=hyperrogue
pkgver=8.3j
_pkgver=83j
pkgrel=1

# set to '' (for full music) or '-nomusic' or '-lo' to choose
_music='-nomusic'
#_music='-lo'
#_music=''

pkgdesc="You are a lone outsider in a strange, non-Euclidean hyperbolic world.  Optional music."
arch=('i686' 'x86_64')
url="http://www.roguetemple.com/z/hyper.php"
license=('GPL2')
depends=('sdl_gfx' 'sdl_ttf' 'sdl_mixer' 'mesa')
makedepends=('glu')
source=("http://www.roguetemple.com/z/hyper/$pkgname-${_pkgver}${_music}.zip")
# echo "http://www.roguetemple.com/z/hyper/hyperrogue-$_pkgver{,-nomusic,-lo}.zip"
md5sums=('3384702edc8e8e8a213ff40ec75d9b9c')
if [[ "$_music" == "" ]]; then
    md5sums=('36b723d3b3ae3d4338b25d39c4388360')
fi
if [[ "$_music"  == "-lo" ]]; then
    md5sums=('1d009127962c9d216e865866aead6aa0')
fi

prepare() {
    cd "$srcdir/$pkgname-${_pkgver}${_music}"
    chmod -x *.*
    chmod -x src/*.*
    sed -i 's|DejaVuSans-Bold.ttf|/usr/share/hyperrogue/&|' src/graph.cpp
}

build() {
    cd "$srcdir/$pkgname-${_pkgver}${_music}/src"
    make
}

package() {
    cd "$srcdir/$pkgname-${_pkgver}${_music}"
    install -Dm755 src/hyper "$pkgdir/usr/bin/hyperrogue"
    install -Dm644 DejaVuSans-Bold.ttf "$pkgdir/usr/share/hyperrogue/DejaVuSans-Bold.ttf"
    if [[ -z "$_music" ]]; then
	install -Dm644 hyperrogue-music.txt "$pkgdir/usr/share/hyperrogue/hyperrogue-music.txt"
	cp *.ogg "$pkgdir/usr/share/hyperrogue/"
    fi
}


