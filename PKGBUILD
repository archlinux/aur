# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

_pkgname=libraw
pkgname=mingw-w64-${_pkgname}
pkgver=0.21.2
pkgrel=1
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
makedepends=('mingw-w64-cmake' 'git')
arch=('any')
options=(!strip !buildflags staticlibs)
optdepends=()
sha256sums=('7ac056e0d9e814d808f6973a950bbf45e71b53283eed07a7ea87117a6c0ced96'
            'SKIP')
source=(
	"$_pkgname-$pkgver.tar.gz::https://github.com/LibRaw/LibRaw/archive/${pkgver}.tar.gz"
	'git+https://github.com/LibRaw/LibRaw-cmake.git'
)

_srcdir="LibRaw-${pkgver}"
_architectures='i686-w64-mingw32 x86_64-w64-mingw32'
_flags=( -Wno-dev -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS_RELEASE='-DNDEBUG' -DENABLE_EXAMPLES=OFF )

prepare() {
	mv -f 'LibRaw-cmake'/* "${_srcdir}/" || true
}

build() {
	for _arch in ${_architectures}; do
		${_arch}-cmake -S "${_srcdir}" -B "build-${_arch}-static" "${_flags[@]}" \
			-DBUILD_SHARED_LIBS=OFF -DCMAKE_INSTALL_PREFIX="/usr/${_arch}/static"
		cmake --build "build-${_arch}-static"
		
		${_arch}-cmake -S "${_srcdir}" -B "build-${_arch}" "${_flags[@]}"
		cmake --build "build-${_arch}"
	done
}

package() {
	for _arch in ${_architectures}; do
		DESTDIR="${pkgdir}" cmake --install "build-${_arch}-static"
		rm -rf "$pkgdir"/usr/${_arch}/static/share
		install -dm755 "$pkgdir/usr/${_arch}/static/lib/cmake/libraw"
		mv -f "$pkgdir/usr/${_arch}/static/lib/cmake"/*.cmake "$pkgdir/usr/${_arch}/static/lib/cmake/libraw"
		${_arch}-strip -g "$pkgdir"/usr/${_arch}/static/lib/*.a
		
		DESTDIR="${pkgdir}" cmake --install "build-${_arch}"
		install -dm755 "$pkgdir/usr/${_arch}/lib/cmake/libraw"
		mv -f "$pkgdir/usr/${_arch}/lib/cmake"/*.cmake "$pkgdir/usr/${_arch}/lib/cmake/libraw"
		${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
		${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
	done
}
