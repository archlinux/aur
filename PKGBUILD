# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

_pkgname=openvdb
pkgname=mingw-w64-${_pkgname}
pkgver=14.0.0
pkgrel=1
pkgdesc='A large suite of tools for the efficient storage and manipulation of sparse volumetric data discretized on three-dimensional grids (mingw-w64)'
url='https://github.com/AcademySoftwareFoundation/openvdb'
license=('Apache-2.0')
depends=(
	'mingw-w64-zlib'
	'mingw-w64-zstd'
	'mingw-w64-openexr'
	'mingw-w64-onetbb'
	'mingw-w64-libpng'
	'mingw-w64-llvm'
)
makedepends=('mingw-w64-cmake')
#checkdepends=('mingw-w64-wine' 'mingw-w64-gtest')
arch=('any')
options=(!strip !buildflags staticlibs)
source=("$_pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('d237d36f5dd361c2a8e8ce8c12bde9876e7519b1fada87a3c0424a52a1845a4ef0e0175f84e6c51eb8349ac2dc9b42cf870fa430e809572f8811134717ea6829')

_srcdir="${_pkgname}-${pkgver}"
_architectures="${MINGW_W64_ARCHS:-x86_64-w64-mingw32}"
_flags=( -Wno-dev -DCMAKE_BUILD_TYPE=Release
	-DCMAKE_CXX_FLAGS_RELEASE='-DNDEBUG -Wa,-mbig-obj'
	-DOPENVDB_BUILD_PYTHON_MODULE=OFF
	-DOPENVDB_BUILD_DOCS=OFF
	-DOPENVDB_SIMD=SSE42
	-DUSE_PNG=ON
	-DUSE_AX=OFF
	-DUSE_NANOVDB=ON
	-DUSE_CCACHE=OFF )

build() {
	for _arch in ${_architectures}; do
		${_arch}-cmake -S "${_srcdir}" -B "build-${_arch}" "${_flags[@]}" \
			-DOPENVDB_BUILD_UNITTESTS=OFF
		cmake --build "build-${_arch}"
	done
}

#check() {
#	for _arch in ${_architectures}; do
#		${_arch}-cmake -S "${_srcdir}" -B "build-${_arch}" "${_flags[@]}" \
#			-DOPENVDB_BUILD_UNITTESTS=ON
#		cmake --build "build-${_arch}"
#		cmake --build "build-${_arch}" --target test
#	done
#}

package() {
	for _arch in ${_architectures}; do
		DESTDIR="${pkgdir}" cmake --install "build-${_arch}"
		${_arch}-strip "$pkgdir"/usr/${_arch}/bin/*.exe
		${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
		${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
	done
}
