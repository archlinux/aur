# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

_pkgname=libssh2
pkgname=mingw-w64-${_pkgname}
pkgver=1.10.0
pkgrel=4
pkgdesc="A library implementing the SSH2 protocol as defined by Internet Drafts (mingw-w64)"
arch=(any)
url="http://www.libssh2.org"
license=("BSD")
makedepends=('mingw-w64-cmake')
depends=('mingw-w64-crt' 'mingw-w64-openssl' 'mingw-w64-zlib')
#checkdepends=('mingw-w64-wine')
options=(staticlibs !strip !buildflags)
source=("$url/download/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('2d64e90f3ded394b91d3a2e774ca203a4179f69aebee03003e5a6fa621e41d51')

_srcdir="${_pkgname}-${pkgver}"
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"
_flags=( -Wno-dev -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS_RELEASE='-O2 -DNDEBUG' -DBUILD_EXAMPLES=OFF 
	-DENABLE_ZLIB_COMPRESSION=ON )

prepare() {
	cd "${_srcdir}"
	sed -i 's/check_symbol_exists(snprintf stdio.h HAVE_SNPRINTF)/set(HAVE_SNPRINTF ON CACHE BOOL "fix")/' 'src/CMakeLists.txt'
	#sed -i 's/$<TARGET_FILE:test_${test}>/test_${test}/' 'tests/CMakeLists.txt'
}

build() {
	for _arch in ${_architectures}; do
		${_arch}-cmake -S "${_srcdir}" -B "build-${_arch}-static" "${_flags[@]}" -DBUILD_SHARED_LIBS=OFF -DBUILD_TESTING=OFF -DCMAKE_INSTALL_PREFIX="/usr/${_arch}/static"
		cmake --build "build-${_arch}-static"
		
		${_arch}-cmake -S "${_srcdir}" -B "build-${_arch}" "${_flags[@]}" -DBUILD_SHARED_LIBS=ON -DBUILD_TESTING=OFF
		cmake --build "build-${_arch}"
	done
}

#check() {
#	for _arch in ${_architectures}; do
#		${_arch}-cmake -S "${_srcdir}" -B "build-${_arch}" "${_flags[@]}" -DBUILD_TESTING=ON
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
		rm -rf "$pkgdir"/usr/${_arch}/share
		mv -f "$pkgdir"/usr/${_arch}/lib/{liblibssh2,libssh2}.dll.a
		sed -i 's/liblibssh2.dll.a/libssh2.dll.a/g' "$pkgdir/usr/${_arch}/lib/cmake/libssh2/Libssh2Config-release.cmake"
		${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
		${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
	done
}
