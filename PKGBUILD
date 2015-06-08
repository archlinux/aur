
pkgname=psp-sdl_gfx
pkgver=2.0.25
pkgrel=1
pkgdesc="SDL Graphic Primitives (psp)"
arch=('any')
url="http://www.ferzkopp.net/joomla/software-mainmenu-14/4-ferzkopps-linux-software/19-sdlgfx"
license=('LGPL')
depends=('psp-sdk' 'psp-sdl')
makedepends=('psp-gcc')
options=('staticlibs' '!buildflags' '!strip')
source=(http://sourceforge.net/projects/sdlgfx/files/SDL_gfx-${pkgver}.tar.gz
        SDL_gfx-${pkgver}-PSP.patch)
md5sums=('ea24ed4b82ff1304809c363494fa8e16'
         'ce83717bf7014358698d408dd5dceff6')

prepare() {
  cd SDL_gfx-$pkgver
  rm -f README.PSP
  patch -Np1 -i ../SDL_gfx-${pkgver}-PSP.patch
}

build() {
  cd SDL_gfx-$pkgver
  autoreconf -vi
  export LDFLAGS="-L$(psp-config --pspsdk-path)/lib -L$(psp-config --psp-prefix)/lib -lc -lpspuser"
  export LIBS="-lc -lpspuser"
  mkdir -p build-psp && pushd build-psp
  ../configure --prefix=/usr/psp --host=psp --disable-mmx --disable-shared 
  make
}

package() {
  cd SDL_gfx-$pkgver/build-psp
  make DESTDIR="$pkgdir" install
}
