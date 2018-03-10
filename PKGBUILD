
pkgname=psp-openal
pkgver=1.14
pkgrel=1
pkgdesc="A cross-platform 3D audio library (psp)"
arch=('any')
url="http://www.openal.org/"
license=('LGPL')
depends=('psp-sdk' 'psp-pthreads-emb')
makedepends=('psp-gcc' 'psp-cmake' 'psp-pkg-config')
options=('staticlibs' '!buildflags' '!strip')
source=("http://kcat.strangesoft.net/openal-releases/openal-soft-$pkgver.tar.bz2")
md5sums=('3d8b86c21a2f87a2a5e60f78f3b3f03d')

prepare() {
  cd "$srcdir"/openal-soft-$pkgver
  # from https://github.com/pspdev/psplibraries/blob/master/scripts/openal.sh
  #sed -i -e "s/memory\.h/string.h/" Alc/*.c Alc/backends/*.c
}

build() {
  cd "$srcdir"/openal-soft-$pkgver 
  mkdir -p build-psp && pushd build-psp
  psp-cmake -DPKG_CONFIG_EXECUTABLE=/usr/psp/bin/pkg-config -DUTILS=OFF ..
  make
}

package() {
  cd "$srcdir"/openal-soft-$pkgver
  install -d "$pkgdir"/usr/psp/{include,lib}
  cp -r include "$pkgdir"/usr/psp/
  install -m644 build-psp/libopenal.a "$pkgdir"/usr/psp/lib/
  install -Dm644 build-psp/openal.pc "$pkgdir"/usr/psp/lib/pkgconfig/openal.pc
}
