# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=mingw-w64-libraw
pkgver=0.20.0
pkgrel=4
pkgdesc='A library for reading RAW files obtained from digital photo cameras (CRW/CR2, NEF, RAF, DNG, and others) (mingw-w64)'
url='https://www.libraw.org/'
license=('LGPL')
depends=(
	'mingw-w64-crt'
	'mingw-w64-lcms2'
	'mingw-w64-libjpeg-turbo'
	'mingw-w64-jasper'
	'mingw-w64-zlib'
)
makedepends=('mingw-w64-make' 'git')
arch=('any')
options=(!strip !buildflags staticlibs)
optdepends=()
sha256sums=(
	'f38cd2620d5adc32d2c9f51cd0dc66d72c75671f1c81dfd13d30c45c6be80d40'
	'SKIP'
)
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/LibRaw/LibRaw/archive/${pkgver}.tar.gz"
	'git+https://github.com/LibRaw/LibRaw-cmake'
)

_architectures='i686-w64-mingw32 x86_64-w64-mingw32'

prepare() {
	mv -f 'LibRaw-cmake'/* "LibRaw-${pkgver}/" || true
}

build() {
	_flags=( -Wno-dev -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS_RELEASE='-O2 -DNDEBUG' -DENABLE_EXAMPLES=OFF )
	
	for _arch in ${_architectures}; do
		${_arch}-cmake -S "LibRaw-${pkgver}" -B "build-${_arch}-static" "${_flags[@]}" -DBUILD_SHARED_LIBS=OFF -DCMAKE_INSTALL_PREFIX="/usr/${_arch}/static"
		cmake --build "build-${_arch}-static"
		
		${_arch}-cmake -S "LibRaw-${pkgver}" -B "build-${_arch}" "${_flags[@]}"
		cmake --build "build-${_arch}"
	done
}

package() {
	for _arch in ${_architectures}; do
		DESTDIR="${pkgdir}" cmake --install "build-${_arch}-static"
		rm -rf "$pkgdir"/usr/${_arch}/static/share
		${_arch}-strip -g "$pkgdir"/usr/${_arch}/static/lib/*.a
		
		DESTDIR="${pkgdir}" cmake --install "build-${_arch}"
		${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
		${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
	done
}
