# Maintainer: jazztickets
pkgname=mingw-w64-sdl3_mixer
pkgver=3.2.2
pkgrel=1
pkgdesc="A simple multi-channel audio mixer (Version 3) (mingw-w64)"
arch=(any)
url="https://github.com/libsdl-org/SDL_mixer"
license=("Zlib")
depends=(mingw-w64-sdl3)
makedepends=(mingw-w64-cmake)
options=(staticlibs !strip !buildflags)
source=("https://github.com/libsdl-org/SDL_mixer/releases/download/release-${pkgver}/SDL3_mixer-${pkgver}.tar.gz")
sha256sums=('cdb6d2a9f01bb3c1b98c957ee12109dd6ec1a1157682c9bc8523b0fe8ab2da1e')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
	cd "${srcdir}/SDL3_mixer-${pkgver}"
	for _arch in ${_architectures}; do
		${_arch}-cmake -B build-${_arch} .
		make -C build-${_arch}
	done
}

package() {
	for _arch in ${_architectures}; do
		cd "${srcdir}/SDL3_mixer-${pkgver}/build-${_arch}"
		make DESTDIR="$pkgdir" install
		${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
		${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
	done
}
