pkgname=mingw-w64-tinyobjloader
pkgver=2.0.0rc7
pkgrel=1
pkgdesc="Tiny but powerful single file wavefront obj loader (mingw-w64)"
arch=('any')
url="https://github.com/tinyobjloader/tinyobjloader"
license=('MIT')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=('!buildflags' 'staticlibs' '!strip')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('f0246420235933d23715dd7d61e08d8b92ca896b5476dbef556d8b6270a275a3')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "$srcdir/tinyobjloader-$pkgver"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do  
    cd "$srcdir/tinyobjloader-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
