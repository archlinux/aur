
pkgname=psp-sdl_ttf
pkgver=2.0.11
pkgrel=1
pkgdesc="A simple library to load ttfs of various formats as SDL surfaces (psp)"
arch=('any')
url="http://www.libsdl.org/projects/SDL_ttf/"
license=('custom')
depends=('psp-sdk' 'psp-sdl' 'psp-freetype2')
makedepends=('psp-gcc' 'psp-pkg-config')
options=('staticlibs' '!buildflags' '!strip')
source=("http://www.libsdl.org/projects/SDL_ttf/release/SDL_ttf-${pkgver}.tar.gz"
        "SDL_ttf-${pkgver}-PSP.patch")
md5sums=('SKIP'
         'SKIP')

prepare() {
  cd "$srcdir/SDL_ttf-$pkgver"
  rm -f README.PSP
  patch -Np1 -i ../SDL_ttf-${pkgver}-PSP.patch
}

build() {
  cd "$srcdir/SDL_ttf-$pkgver"
  sh autogen.sh
  export LDFLAGS="-L$(psp-config --pspsdk-path)/lib -L$(psp-config --psp-prefix)/lib -lc -lpspuser"
  export LIBS="-lc -lpspuser"
  mkdir -p build-psp && pushd build-psp
  ../configure --prefix=/usr/psp --host=psp \
    --with-sdl-prefix=$(psp-config --psp-prefix) --with-freetype-prefix=$(psp-config --psp-prefix) --without-x 
  make
}

package() {
  cd "$srcdir/SDL_ttf-$pkgver/build-psp"
  make DESTDIR="$pkgdir" install
}
