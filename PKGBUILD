
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
  
  # FIXME: -lc should be put after -lm, and libm is not detected
  sed -i "s|CHECK_LIBRARY_EXISTS(m pow|set(HAVE_LIBM TRUE)#CHECK_LIBRARY_EXISTS(m pow|g" CMakeLists.txt

  # from https://github.com/pspdev/psplibraries/blob/master/scripts/openal.sh
  sed -i -e "s/memory\.h/string.h/" Alc/*.c Alc/backends/*.c

  # find pthread in pthread-psp
  sed -i "s|CHECK_LIBRARY_EXISTS(pthread|CHECK_LIBRARY_EXISTS(pthread-psp|g" CMakeLists.txt
  sed -i "s|SET(EXTRA_LIBS pthread|SET(EXTRA_LIBS pthread-psp|g" CMakeLists.txt

  # need to link these
  sed -i "346iset(CMAKE_REQUIRED_LIBRARIES pspdebug pspdisplay pspge pspsdk c pspuser)" CMakeLists.txt
  sed -i "346iset(EXTRA_LIBS \${EXTRA_LIBS} pspdebug pspdisplay pspge pspsdk c pspuser)" CMakeLists.txt
}

build() {
  cd "$srcdir"/openal-soft-$pkgver 
  mkdir -p build-psp && pushd build-psp
  psp-cmake -DPKG_CONFIG_EXECUTABLE=/usr/psp/bin/pkg-config -DCMAKE_VERBOSE_MAKEFILE=1 ..
  make
}

package() {
  cd "$srcdir"/openal-soft-$pkgver
  install -d "$pkgdir"/usr/psp/{include,lib}
  cp -r include "$pkgdir"/usr/psp/
  install -m644 build-psp/libopenal.a "$pkgdir"/usr/psp/lib/
  install -Dm644 build-psp/openal.pc "$pkgdir"/usr/psp/lib/pkgconfig/openal.pc
}
