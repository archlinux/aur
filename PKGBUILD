
pkgname=psp-sdl_image
pkgver=1.2.12
pkgrel=1
pkgdesc="A simple library to load images of various formats as SDL surfaces (psp)"
arch=('any')
url="http://www.libsdl.org/projects/SDL_image/"
license=('custom')
depends=('psp-sdk' 'psp-sdl' 'psp-libpng' 'psp-libjpeg')
makedepends=('psp-gcc' 'psp-pkg-config')
options=('staticlibs' '!buildflags' '!strip')
source=(http://www.libsdl.org/projects/SDL_image/release/SDL_image-1.2.12.tar.gz
        SDL_image-${pkgver}-PSP.patch)
md5sums=('SKIP'
         'SKIP')

prepare() {
  cd SDL_image-$pkgver
  rm -f README.PSP
  patch -Np1 -i ../SDL_image-${pkgver}-PSP.patch
}

build() {
  cd SDL_image-$pkgver
  sh autogen.sh
  export LDFLAGS="-L$(psp-config --pspsdk-path)/lib -L$(psp-config --psp-prefix)/lib -lc -lpspuser"
  export LIBS="-lc -lpspuser"
  mkdir -p build-psp && pushd build-psp
  ../configure --prefix=/usr/psp --host=psp --with-sdl-prefix=$(psp-config --psp-prefix) 
  make
}

package() {
  cd SDL_image-$pkgver/build-psp
  make DESTDIR="$pkgdir" install
}
