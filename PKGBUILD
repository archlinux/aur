pkgname=mingw-w64-mixmod
pkgver=3.1.0
pkgrel=1
pkgdesc="Model-Based supervised and unsupervised classification on qualitative and quantitative data. (mingw-w64)"
arch=('any')
url="http://www.mixmod.org"
license=(GPL)
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=(!buildflags !strip staticlibs)
source=("http://www.mixmod.org/IMG/tgz/mixmod_3-1-0_src.tgz"
        'mixmod3.patch' mixmod-uint.patch)
md5sums=('SKIP'
         '480c9e761c74f0218fc439ba924227f1' 'SKIP')
_architecture="i686-w64-mingw32 x86_64-w64-mingw32"

prepare () {
  cd "$srcdir/mixmodLib_3_1_0"
  rm -f UseMixmod.cmake MixmodConfig.cmake.in
  patch -p1 -i "$srcdir"/mixmod3.patch
  sed -i "s| SHARED | |g" SRC/CMakeLists.txt
  patch -p1 -i "$srcdir"/mixmod-uint.patch
}

build () {
  cd "$srcdir/mixmodLib_3_1_0"
  for _arch in $_architecture; do
    unset LDFLAGS
    mkdir -p build-${_arch}-static && pushd build-${_arch}-static
    ${_arch}-cmake \
      -DBUILD_SHARED_LIBS=OFF ..
    make
    popd
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake ..
    make
    popd
  done
}

package () {
  cd "$srcdir/mixmodLib_3_1_0"
  for _arch in $_architecture; do
    cd "$srcdir/mixmodLib_3_1_0/build-${_arch}-static"
    make install DESTDIR="$pkgdir"
    cd "$srcdir/mixmodLib_3_1_0/build-${_arch}"
    make install DESTDIR="$pkgdir"
    rm -r "$pkgdir"/usr/${_arch}/share 
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

