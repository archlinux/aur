# Maintainer: blindcrone <blindcrone@tuta.io>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: otreblan <otreblain@gmail.com>
pkgname=mingw-w64-sfml-static
pkgver=2.6.0
pkgrel=1
pkgdesc="A simple, fast, cross-platform, and object-oriented multimedia API (mingw-w64)"
arch=(any)
url="https://www.sfml-dev.org"
license=("zlib")
depends=(mingw-w64-libsndfile mingw-w64-libjpeg-turbo mingw-w64-openal mingw-w64-glew mingw-w64-freetype2)
makedepends=(mingw-w64-cmake)
conflicts=(mingw-w64-sfml)
provides=(mingw-w64-sfml)
options=(staticlibs !strip !buildflags)
source=("https://github.com/SFML/SFML/archive/${pkgver}.tar.gz")
md5sums=('cb866afcd46a2febcc44ad375d5644f4')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "$srcdir"/SFML-${pkgver}

  unset LDFLAGS
  for _arch in ${_architectures}; do
    mkdir -p "build-${_arch}" && pushd "build-${_arch}"
    ${_arch}-cmake --no-warn-unused-cli \
      -DCMAKE_BUILD_TYPE=Release \
      -DBUILD_SHARED_LIBS=0\
      -DSFML_USE_STATIC_STD_LIBS=1\
      -DFREETYPE_LIBRARY=/usr/${_arch}/lib/libfreetype.dll.a \
      -DGLEW_LIBRARY=/usr/${_arch}/lib/libglew32.dll.a \
      -DJPEG_LIBRARY=/usr/${_arch}/lib/libjpeg.dll.a \
      -DOPENAL_LIBRARY=/usr/${_arch}/lib/libOpenAL32.dll.a \
      -DSNDFILE_LIBRARY=/usr/${_arch}/lib/libsndfile.dll.a \
      -DSFML_INSTALL_PKGCONFIG_FILES=1\
      ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/SFML-${pkgver}/build-$_arch"
    make DESTDIR="$pkgdir" install
    find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' -exec ${_arch}-strip -g {} \;
    find "$pkgdir/usr/${_arch}" -name '*.txt' -delete
    rm "$pkgdir/usr/$_arch/bin/openal32.dll"
    rm "$pkgdir/usr/$_arch/lib/lib"{FLAC,freetype,ogg,openal32,vorbis,vorbisenc,vorbisfile}.a
  done
}
