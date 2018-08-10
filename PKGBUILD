pkgname=mingw-w64-allegro
pkgver=5.2.4.0
pkgrel=0
arch=(any)
pkgdesc="Portable library mainly aimed at video game and multimedia programming (mingw-w64)"
license=("custom")
depends=(mingw-w64-crt)
makedepends=(mingw-w64-cmake git mingw-w64-libtheora mingw-w64-physfs mingw-w64-freetype2 mingw-w64-flac mingw-w64-openal mingw-w64-opusfile mingw-w64-libwebp)
options=(staticlibs !strip !buildflags)
url="https://liballeg.org/"
source=("git://github.com/liballeg/allegro${pkgver%%.*}.git#tag=$pkgver")
md5sums=('SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
	cd allegro${pkgver%%.*}
	for _arch in ${_architectures}; do
    unset LDFLAGS
    mkdir "build-${_arch}" && pushd "build-${_arch}"
    ${_arch}-cmake \
      -DCMAKE_BUILD_TYPE=Release \
      -DWANT_DOCS=OFF \
      -DPHYSFS_LIBRARY=/usr/${_arch}/lib/libphysfs.dll.a \
      -DWANT_ACODEC_DYNAMIC_LOAD=ON \
      -DWANT_DEMO=OFF \
      -DWANT_DOCS_HTML=OFF \
      -DWANT_DOCS_MAN=OFF \
      -DWANT_EXAMPLES=OFF \
      -DWANT_TESTS=OFF \
      -DOPENAL_LIBRARY=/usr/${_arch}/lib/libOpenAL32.dll.a \
      ..
    make
    popd
  done
}

package() {
	for _arch in ${_architectures}; do
    cd "${srcdir}/${pkgname#mingw-w64-}${pkgver%%.*}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
  done
}
