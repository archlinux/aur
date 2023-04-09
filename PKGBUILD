# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

_pkgname=minizip-ng
pkgname=mingw-w64-${_pkgname}
pkgver=3.0.10
pkgrel=1
pkgdesc='minizip-ng is a zip manipulation library written in C that is supported on Windows, macOS, and Linux. (mingw-w64)'
url='https://github.com/zlib-ng/minizip-ng'
license=('custom')
depends=(
	'mingw-w64-openssl'
	'mingw-w64-bzip2'
	'mingw-w64-zstd'
	'mingw-w64-libiconv'
	'mingw-w64-openssl'
)
makedepends=('mingw-w64-cmake')
#checkdepends=('mingw-w64-wine')
arch=('any')
options=(!strip !buildflags staticlibs)
optdepends=()
source=(
	"$_pkgname-$pkgver.tar.gz::https://github.com/zlib-ng/${_pkgname}/archive/refs/tags/${pkgver}.tar.gz"
	"${pkgname}-iconv.patch")
sha256sums=('d4a549731d8c7074e421dbab6d8b8ad0a93067752fe767c464f0f40fa5f0a80d'
            'c4203584aed3c670c7aa2cb3774fe513088de3cee54c5b20f7ddea9fc673d1ef')

_srcdir="${_pkgname}-${pkgver}"
_architectures='i686-w64-mingw32 x86_64-w64-mingw32'
_flags=( -Wno-dev -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS_RELEASE='-DNDEBUG'
	-DMZ_FETCH_LIBS=OFF -DMZ_OPENSSL=ON -DMZ_COMPAT=OFF )

prepare() {
	cd "${_srcdir}"
	patch -p1 -i "${srcdir}/${pkgname}-iconv.patch"
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

#check() {
#	for _arch in ${_architectures}; do
#		${_arch}-cmake -S "${_srcdir}" -B "build-${_arch}" "${_flags[@]}" -DMZ_BUILD_TESTS=ON -DMZ_BUILD_UNIT_TESTS=ON \
#			-DMZ_BUILD_FUZZ_TESTS=ON
#		cmake --build "build-${_arch}"
#		cmake --build "build-${_arch}" --target test
#	done
#}

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
