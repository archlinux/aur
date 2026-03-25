# Maintainer: jazztickets
pkgname=mingw-w64-sdl3_ttf
pkgver=3.2.2
pkgrel=1
pkgdesc="A library that allows you to use TrueType fonts in your SDL applications (Version 3) (mingw-w64)"
arch=(any)
url="https://github.com/libsdl-org/SDL_ttf"
license=("Zlib")
depends=(mingw-w64-sdl3)
makedepends=(mingw-w64-cmake)
options=(staticlibs !strip !buildflags)
source=("https://github.com/libsdl-org/SDL_ttf/releases/download/release-${pkgver}/SDL3_ttf-${pkgver}.tar.gz")
sha256sums=('63547d58d0185c833213885b635a2c0548201cc8f301e6587c0be1a67e1e045d')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
	cd "${srcdir}/SDL3_ttf-${pkgver}"
	for _arch in ${_architectures}; do
		${_arch}-cmake -B build-${_arch} .
		make -C build-${_arch}
	done
}

package() {
	for _arch in ${_architectures}; do
		cd "${srcdir}/SDL3_ttf-${pkgver}/build-${_arch}"
		make DESTDIR="$pkgdir" install
		${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
		${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
	done
}
