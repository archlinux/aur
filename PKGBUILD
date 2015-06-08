
pkgname=psp-sdl
pkgver=1.2.15
pkgrel=1
pkgdesc="A library for portable low-level access to a video framebuffer, audio output, mouse, and keyboard (psp)"
arch=('any')
url="http://www.libsdl.org"
license=('LGPL')
depends=('psp-sdk' 'psp-pspirkeyb')
makedepends=('psp-gcc')
options=('staticlibs' '!buildflags' '!strip')
source=("http://www.libsdl.org/release/SDL-${pkgver}.tar.gz"
        "SDL-${pkgver}-PSP.patch")
md5sums=('9d96df8417572a2afb781a7c4c811a85'
         'SKIP')

prepare() {
  cd SDL-$pkgver
  rm -f src/*/psp/*.[hc]
  rm -f README.PSP
  patch -Np1 -i ../SDL-1.2.15-PSP.patch
}

build() {
  cd SDL-$pkgver
  sh autogen.sh
  export LDFLAGS="-L$(psp-config --pspsdk-path)/lib -L$(psp-config --psp-prefix)/lib -lc -lpspuser"
  export LIBS="-lc -lpspuser"
  mkdir -p build-psp && pushd build-psp
  ../configure --prefix=/usr/psp --host=psp \
    --enable-pspirkeyb
  make
}

package() {
  cd SDL-$pkgver/build-psp
  make DESTDIR="$pkgdir" install
  rm -r "$pkgdir"/usr/psp/share/man
}
