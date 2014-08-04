# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>

pkgname=mingw-w64-sfml
_commit=4a300547f3
pkgver=2.1.0.$_commit
pkgrel=2
pkgdesc="A simple, fast, cross-platform, and object-oriented multimedia API (mingw-w64)"
arch=(any)
url="http://www.sfml-dev.org"
license=("zlib")
makedepends=(mingw-w64-gcc cmake mingw-w64-cmake)
depends=(mingw-w64-crt mingw-w64-libsndfile mingw-w64-libjpeg-turbo mingw-w64-openal mingw-w64-glew mingw-w64-freetype)
conflicts=(mingw-w64-sfml-static)
provides=(mingw-w64-sfml-static)
options=(staticlibs !strip !buildflags)
source=("git+https://github.com/LaurentGomila/SFML.git#commit=${_commit}")
md5sums=('SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "$srcdir/SFML"
  unset LDFLAGS
  for _arch in ${_architectures}; do
    mkdir -p "build-${_arch}" && pushd "build-${_arch}"
    ${_arch}-cmake \
			-DCMAKE_BUILD_TYPE=Release \
			-DFREETYPE_LIBRARY=/usr/${_arch}/lib/libfreetype.dll.a \
			-DGLEW_LIBRARY=/usr/${_arch}/lib/libglew32.dll.a \
			-DJPEG_LIBRARY=/usr/${_arch}/lib/libjpeg.dll.a \
			-DOPENAL_LIBRARY=/usr/${_arch}/lib/libOpenAL32.dll.a \
			-DSNDFILE_LIBRARY=/usr/${_arch}/lib/libsndfile.dll.a \
			..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/SFML/build-$_arch"
    make DESTDIR="$pkgdir" install
    find "$pkgdir/usr/${_arch}" -name '*.dll' | xargs -rtl1 ${_arch}-strip --strip-unneeded
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs -rtl1 ${_arch}-strip -g
    find "$pkgdir/usr/${_arch}" -name '*.txt' | xargs -rtl1 rm
    rm -f "$pkgdir/usr/$_arch/bin/"{libsndfile-1,openal32}.dll
    rm -f "$pkgdir/usr/$_arch/lib/"{libglew32,libfreetype,libjpeg,libsndfile}.a
  done
}
