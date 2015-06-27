# Maintainer: Mikołaj Milej <mikolajmm@gmail.com>

pkgname=mingw-w64-chipmunk6
pkgver=6.2.2
pkgrel=1
pkgdesc="A high-performance 2D rigid body physics library (mingw-w64)"
arch=(any)
url="http://chipmunk-physics.net/"
license=('MIT')
depends=('mingw-w64-crt')
conflicts=('mingw-w64-chipmunk')
makedepends=('mingw-w64-gcc' 'mingw-w64-cmake')
options=('!strip' '!buildflags' 'staticlibs')
source=(http://files.slembcke.net/chipmunk/release/Chipmunk-${pkgver%%.*}.x/Chipmunk-$pkgver.tgz)
sha256sums=('790cf62d65820610ab352052bf2c76436600197337b1511be5f4423dc46ecdeb')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  unset LDFLAGS

  for _arch in ${_architectures}; do
      mkdir -p ${srcdir}/build-${_arch} && cd ${srcdir}/build-${_arch}
      ${_arch}-cmake \
          -DCMAKE_BUILD_TYPE=Release \
          -DBUILD_DEMOS=OFF \
          -DCMAKE_C_FLAGS="-DCHIPMUNK_FFI" \
          ../Chipmunk-$pkgver
      make
  done
}

package() {
  for _arch in ${_architectures}; do
      cd ${srcdir}/build-${_arch}
      make DESTDIR=${pkgdir} install
      
      mkdir "$pkgdir"/usr/${_arch}/bin
      mv "$pkgdir"/usr/${_arch}/lib/*.dll "$pkgdir"/usr/${_arch}/bin/
      
      ${_arch}-strip -x -g "$pkgdir"/usr/${_arch}/bin/*.dll
      ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
