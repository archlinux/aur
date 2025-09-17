# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Andrew Sun <adsun701@gmail.com>

_pkgname=kvazaar
pkgname=mingw-w64-${_pkgname}
pkgver=2.3.2
pkgrel=1
pkgdesc="An open-source HEVC encoder (mingw-w64)"
arch=('any')
url='http://ultravideo.cs.tut.fi/#encoder'
license=('BSD-3-Clause')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake' 'mingw-w64-crypto++' 'ninja')
options=('!strip' '!buildflags' 'staticlibs')
source=("${_pkgname}-${pkgver}.tar.gz"::"https://github.com/ultravideo/kvazaar/archive/v${pkgver}.tar.gz")
sha256sums=('ddd0038696631ca5368d8e40efee36d2bbb805854b9b1dda8b12ea9b397ea951')

_srcdir="${_pkgname}-${pkgver}"
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"
_flags=(
	-Wno-dev
	-DCMAKE_BUILD_TYPE=Release
	-DCMAKE_CXX_FLAGS_RELEASE='-DNDEBUG'
	-DUSE_CRYPTO=ON
)

prepare() {
	cd "${_srcdir}"

	sed -i \
		-e 's|include(FetchContent)|find_package(cryptopp REQUIRED)|' 'CMakeLists.txt' \
		-e 's|if (NOT CRYPTOPP_FOUND)|if (0)|' \
		-e 's|set(BUILD_SHARED_LIBS OFF)||' \
		-e 's|set(EXTRA_LIBS ${EXTRA_LIBS} ${CMAKE_BINARY_DIR}/lib/libcryptopp.a)|target_link_libraries(kvazaar PRIVATE cryptopp::cryptopp)|' \
		'CMakeLists.txt'
}

build() {
	for _arch in ${_architectures}; do
		${_arch}-cmake -G Ninja -S "${_srcdir}" -B "build-${_arch}-static" "${_flags[@]}" \
			-DBUILD_SHARED_LIBS=OFF \
			-DBUILD_TESTS=OFF \
			-DCMAKE_INSTALL_PREFIX="/usr/${_arch}/static"
		cmake --build "build-${_arch}-static"

		${_arch}-cmake -G Ninja -S "${_srcdir}" -B "build-${_arch}" "${_flags[@]}" \
			-DBUILD_TESTS=OFF
		cmake --build "build-${_arch}"
	done
}

package() {
	for _arch in ${_architectures}; do
		DESTDIR="${pkgdir}" cmake --install "build-${_arch}-static"
		${_arch}-strip -g "$pkgdir"/usr/${_arch}/static/lib/*.a
		rm -rf "$pkgdir/usr/${_arch}/static/bin"
		rm -rf "$pkgdir/usr/${_arch}/static/share"

		DESTDIR="${pkgdir}" cmake --install "build-${_arch}"
		${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
		${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
		rm -rf "$pkgdir/usr/${_arch}/share"
	done
}
