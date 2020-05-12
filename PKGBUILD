pkgname=mingw-w64-sdl2_mixer
pkgver=2.0.4
pkgrel=3
pkgdesc="A simple multi-channel audio mixer (mingw-w64)"
arch=(any)
url="http://www.libsdl.org/projects/SDL_mixer"
license=("zlib")
depends=(mingw-w64-crt mingw-w64-sdl2 mingw-w64-libmodplug mingw-w64-libvorbis mingw-w64-flac mingw-w64-mpg123)
makedepends=(sed mingw-w64-gcc mingw-w64-configure)
options=(staticlibs !strip !buildflags)
source=("http://www.libsdl.org/projects/SDL_mixer/release/SDL2_mixer-$pkgver.tar.gz")
md5sums=('a36e8410cac46b00a4d01752b32c3eb1')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
	cd "${srcdir}/SDL2_mixer-${pkgver}"

	# link ssp (needed because mingw env's -fstack-protection)
	export LDFLAGS="-lssp"

	sed -i 's/"modplug\.h"/"libmodplug\/modplug.h"/' music_modplug.h
	for _arch in ${_architectures}; do
		mkdir -p build-${_arch} && pushd build-${_arch}
		${_arch}-configure
		make
		popd
	done
}

package() {
	for _arch in ${_architectures}; do
		cd "${srcdir}/SDL2_mixer-${pkgver}/build-${_arch}"
		make DESTDIR="$pkgdir" install
		${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
		${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
	done
}
