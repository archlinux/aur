pkgname=mingw-w64-levmar
pkgver=2.6
pkgrel=1
pkgdesc='Levenberg-Marquardt nonlinear least squares algorithms in C/C++ (mingw-w64)'
url='http://www.ics.forth.gr/~lourakis/levmar'
arch=('any')
license=('GPL')
depends=('mingw-w64-crt' 'mingw-w64-lapack' 'mingw-w64-f2c')
makedepends=('mingw-w64-cmake')
options=('!buildflags' '!strip' 'staticlibs')
source=('http://www.ics.forth.gr/~lourakis/levmar/levmar-2.6.tgz')
md5sums=('16bc34efa1617219f241eef06427f13f')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "$srcdir/levmar-${pkgver}"
  for _arch in ${_architectures}; do
    unset LDFLAGS
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
      -DCMAKE_BUILD_TYPE=Release \
      -DBUILD_SHARED_LIBS=OFF \
      -DBUILD_TESTING=OFF \
      ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/levmar-${pkgver}/build-${_arch}"
    install -Dm644 "$srcdir"/levmar-${pkgver}/levmar.h "$pkgdir"/usr/${_arch}/include/levmar/levmar.h
    install -Dm644 liblevmar.a "$pkgdir"/usr/${_arch}/lib/liblevmar.a
    #${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
