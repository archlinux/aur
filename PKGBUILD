# Maintainer: maz-1 <loveayawaka at gmail dot com>
_pkgname=onscripter-jh
pkgname=${_pkgname}-hg
pkgver=85+
pkgrel=1
pkgdesc="onscripter fork with custom improvements."
arch=('i686' 'x86_64')
url="https://bitbucket.org/jh10001/onscripter-jh"
license=('GPL3')
depends=('sdl2' 'sdl2_mixer' 'sdl2_ttf' 'sdl2_image' 'smpeg' 'libjpeg-turbo' 'bzip2' 'libvorbis' 'lua51')
makedepends=('mercurial')
conflicts=('onscripter-jh')
provides=('onscripter-jh')
source=("hg+https://bitbucket.org/jh10001/${_pkgname}" lua_include.patch)
md5sums=('SKIP' '20381fb167dce476414230c7f1ecd1e3')
pkgver() {
  cd $srcdir/$_pkgname
  hg id -n
}

prepare() {
    cd $srcdir/$_pkgname
    hg update SDL2
    echo 'LIBS = `sdl2-config --libs` `smpeg-config --libs` -lSDL2_ttf -lSDL2_image -lSDL2_mixer -lbz2 -ljpeg -lm -logg -lvorbis -lvorbisfile -llua5.1
CFLAGS += -c `sdl2-config --cflags` `smpeg-config --cflags` -DLINUX -DUSE_OGG_VORBIS -std=c++11 -DUSE_SDL_RENDERER -DUSE_LUA -DUTF8_CAPTION
OBJSUFFIX = .o
EXT_OBJS += LUAHandler$(OBJSUFFIX)
CC = g++
LD = g++ -o
TARGET = onscripter 
#sardec nsadec sarconv nsaconv
include Makefile.onscripter' > Makefile
    patch -p1 < "$srcdir/lua_include.patch"
}

build() {
    cd $srcdir/$_pkgname
    make
}

package() {
	cd $srcdir/$_pkgname
	install -Dm 755 ${srcdir}/$_pkgname/onscripter ${pkgdir}/usr/bin/onscripter-jh
}
