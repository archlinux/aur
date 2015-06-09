pkgname=mingw-w64-win-iconv
pkgver=0.0.6
pkgrel=5
arch=(any)
pkgdesc="Iconv implementation using Win32 API (mingw-w64)"
depends=(mingw-w64-crt)
makedepends=(mingw-w64-gcc mingw-w64-cmake)
options=(!strip !buildflags staticlibs)
conflicts=(mingw-w64-libiconv)
provides=(mingw-w64-libiconv)
license=("Public Domain")
url="http://code.google.com/p/win-iconv"
source=("http://win-iconv.googlecode.com/files/win-iconv-${pkgver}.tar.bz2")
md5sums=('1e97ed4d9e7379ff0ee22077256e8c58')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "$srcdir/win-iconv-$pkgver"
  for _arch in ${_architectures}; do
		unset LDFLAGS
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
    find "$pkgdir/usr/${_arch}" -name '*.exe' -o -name '*.bat' -o -name '*.def' -o -name '*.exp' | xargs -rtl1 rm
    find "$pkgdir/usr/${_arch}" -name '*.dll' | xargs -rtl1 ${_arch}-strip --strip-unneeded
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs -rtl1 ${_arch}-strip -g
  done
}
