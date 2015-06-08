pkgname=mingw-w64-ann
pkgver=1.1.2
pkgrel=1
pkgdesc="Approximate nearest neighbor library. (mingw-w64)"
url="http://www.cs.umd.edu/~mount/ANN/"
arch=('any')
license="LGPL"
depends=('mingw-w64-crt')
makedepends=('mingw-w64-gcc')
options=('!buildflags' '!strip' 'staticlibs')
source=("http://www.cs.umd.edu/~mount/ANN/Files/$pkgver/ann_$pkgver.tar.gz"
        parallel.patch)
md5sums=('7ffaacc7ea79ca39d4958a6378071365'
         'b332924dd27ee8a7fc479f28761a4381')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare () {
  cd "$srcdir/ann_$pkgver"
  patch -p1 < $srcdir/parallel.patch
}

build() {
  cd "$srcdir"
  for _arch in ${_architectures}; do
    cp -r ann_$pkgver build-${_arch} && pushd build-${_arch}
    sed -i "s|C++|CXX|g" src/Makefile
     make ANNLIB=libANN.a CXX=${_arch}-g++ \
      CFLAGS="-O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions --param=ssp-buffer-size=4 -DDLL_EXPORTS" \
      MAKELIB="${_arch}-ar ruv" RANLIB=${_arch}-ranlib targets -C src
    popd
  done
}

package () {
  for _arch in ${_architectures}; do
    cd "$srcdir/build-${_arch}"
    install -d "$pkgdir"/usr/${_arch}/{lib,include/ANN}
    install -m644 lib/libANN.a "$pkgdir"/usr/${_arch}/lib
    install -m644 include/ANN/* "$pkgdir"/usr/${_arch}/include/ANN
#     ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
