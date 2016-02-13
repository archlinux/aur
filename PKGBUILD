pkgname=mingw-w64-win-iconv
pkgver=0.0.8
pkgrel=1
arch=(any)
pkgdesc="Iconv implementation using Win32 API (mingw-w64)"
depends=(mingw-w64-crt)
makedepends=(mingw-w64-gcc mingw-w64-cmake)
options=(!strip !buildflags staticlibs)
conflicts=(mingw-w64-libiconv)
provides=(mingw-w64-libiconv)
license=("Public Domain")
url="http://code.google.com/p/win-iconv"
source=("https://github.com/win-iconv/win-iconv/archive/v$pkgver.tar.gz")
md5sums=('e4574721c2d9667af32283175c828833')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
	unset LDFLAGS
	
  cd "$srcdir/win-iconv-$pkgver"
  for _arch in ${_architectures}; do
    mkdir "build-${_arch}" && pushd "build-${_arch}"
    ${_arch}-cmake \
      -DCMAKE_BUILD_TYPE=Release \
      -DBUILD_STATIC=ON \
      -DBUILD_EXECUTABLE=OFF \
      ..
    make
    popd
  done
}

package() {
  cd "$srcdir"
  for _arch in ${_architectures}; do
		cd "${srcdir}/${pkgname#mingw-w64-}-$pkgver/build-${_arch}"
    make DESTDIR="$pkgdir" install
    find "$pkgdir/usr/${_arch}" -name '*.exe' -exec rm {} \;
    find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
  done
}
