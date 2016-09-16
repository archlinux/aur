pkgname=mingw-w64-stormlib
pkgver=9.20
pkgrel=1
arch=(any)
pkgdesc="A C/C++ API to read and write MPQ files with support for merged archives, patch MPQs and more. (mingw-w64)"
license=("MIT")
depends=(mingw-w64-crt)
makedepends=(mingw-w64-cmake)
options=(staticlibs !strip !buildflags)
url="http://www.zezula.net/en/mpq/stormlib.html"
source=("https://github.com/ladislav-zezula/StormLib/archive/v$pkgver.tar.gz")
sha256sums=('fdfc7d0b444cd5d540c5732155a7c5011c573e90029947198f651aec93db4887')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
	cd StormLib-$pkgver
	for _arch in ${_architectures}; do
    unset LDFLAGS
    
    mkdir "build-${_arch}" && pushd "build-${_arch}"
    ${_arch}-cmake \
      -DCMAKE_BUILD_TYPE=Release \
      -DWITH_STATIC=ON \
      ..
    make
    popd
  done
}

package() {
	for _arch in ${_architectures}; do
    cd "${srcdir}/StormLib-$pkgver/build-${_arch}"
    make DESTDIR="$pkgdir" install
    #find "$pkgdir/usr/${_arch}" -name '*.exe' -exec ${_arch}-strip {} \;
    find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
  done
}
