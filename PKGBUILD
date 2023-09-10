# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Andrew Sun <adsun701 at gmail dot com>

_pkgname=snappy
pkgname=mingw-w64-${_pkgname}
pkgver=1.1.10
pkgrel=1
pkgdesc="A fast compressor/decompressor library (mingw-w64)"
arch=('any')
url="https://google.github.io/snappy/"
license=('BSD')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake' 'git')
options=('!strip' '!buildflags' 'staticlibs')
source=("git+https://github.com/google/snappy.git#tag=${pkgver}"
        'git+https://github.com/google/googletest.git')
sha256sums=('SKIP'
            'SKIP')

_srcdir="${_pkgname}"
_architectures='i686-w64-mingw32 x86_64-w64-mingw32'
_flags=( -Wno-dev -DCMAKE_BUILD_TYPE='Release'
	-DCMAKE_C_FLAGS_RELEASE='-DNDEBUG'
	-DCMAKE_CXX_FLAGS_RELEASE='-DNDEBUG'
	-DSNAPPY_BUILD_BENCHMARKS=OFF )

prepare() {
	cd "${_srcdir}"
	git config --file=.gitmodules submodule.third_party/googletest.url "$srcdir/googletest"
	git -c protocol.file.allow=always submodule update --init
	
	sed -i 's|COMMAND "${PROJECT_BINARY_DIR}/snappy_unittest"|COMMAND snappy_unittest|' 'CMakeLists.txt'
}

build() {
	for _arch in ${_architectures}; do
		${_arch}-cmake -S "${_srcdir}" -B "build-${_arch}-static" "${_flags[@]}" \
			-DSNAPPY_BUILD_TESTS=OFF \
			-DBUILD_SHARED_LIBS=OFF \
			-DCMAKE_INSTALL_PREFIX="/usr/${_arch}/static"
		cmake --build "build-${_arch}-static"
		
		${_arch}-cmake -S "${_srcdir}" -B "build-${_arch}" "${_flags[@]}" \
			-DSNAPPY_BUILD_TESTS=OFF
		cmake --build "build-${_arch}"
	done
}

check() {
	for _arch in ${_architectures}; do
		${_arch}-cmake -S "${_srcdir}" -B "build-${_arch}" "${_flags[@]}" \
			-DSNAPPY_BUILD_TESTS=ON
		cmake --build "build-${_arch}"
		cmake --build "build-${_arch}" --target test
	done
}

package () {
	for _arch in ${_architectures}; do
		DESTDIR="${pkgdir}" cmake --install "build-${_arch}-static"
		${_arch}-strip -g "$pkgdir"/usr/${_arch}/static/lib/*.a
		
		DESTDIR="${pkgdir}" cmake --install "build-${_arch}"
		${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
		${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
	done
}
