
pkgname=psp-sdl_mixer
pkgver=1.2.12
pkgrel=1
pkgdesc="A simple multi-channel audio mixer (psp)"
arch=('any')
url="http://www.libsdl.org/projects/SDL_mixer/"
license=('custom')
depends=('psp-sdk' 'psp-sdl' 'psp-libmikmod')
makedepends=('psp-gcc' 'psp-pkg-config')
options=('staticlibs' '!buildflags' '!strip')
source=("http://www.libsdl.org/projects/SDL_mixer/release/SDL_mixer-1.2.12.tar.gz"
        "SDL_mixer-${pkgver}-PSP.patch")
md5sums=('e03ff73d77a55e3572ad0217131dc4a1'
         '5bbfdf408e8440ad0e52bb79efcffe7e')

prepare() {
  cd SDL_mixer-$pkgver
  rm -f README.PSP
  patch -Np1 -i ../SDL_mixer-${pkgver}-PSP.patch
}

build() {
  cd SDL_mixer-$pkgver
  sh autogen.sh
  export LDFLAGS="-L$(psp-config --pspsdk-path)/lib -L$(psp-config --psp-prefix)/lib -lc -lpspuser"
  export LIBS="-lc -lpspuser"
  mkdir -p build-psp && pushd build-psp
  ../configure --prefix=/usr/psp --host=psp \
    --with-sdl-prefix=$(psp-config --psp-prefix) --enable-music-mod --disable-music-mp3 
  make
}

package() {
  cd SDL_mixer-$pkgver/build-psp
  make DESTDIR="$pkgdir" install
}
