pkgname=mingw-w64-soundtouch
pkgver=2.3.1
pkgrel=1
pkgdesc='An audio processing library (mingw-w64)'
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=('!buildflags' '!strip' 'staticlibs')
arch=('any')
url='https://www.surina.net/soundtouch/'
license=('LGPL2.1')
source=(https://codeberg.org/soundtouch/soundtouch/archive/${pkgver}.tar.gz)
sha256sums=('42633774f372d8cb0a33333a0ea3b30f357c548626526ac9f6ce018c94042692')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare () {
  cd "$srcdir"/soundtouch
}

build() {
  cd "$srcdir"/soundtouch
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    CXXFLAGS="-msse2" ${_arch}-cmake ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir"/soundtouch/build-${_arch}
    make install DESTDIR="${pkgdir}"
    rm "$pkgdir"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

