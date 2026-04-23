# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

_pkgname=minizip-ng
pkgname=mingw-w64-${_pkgname}
pkgver=4.1.1
pkgrel=1
_7zip_ver='26.00'
pkgdesc='minizip-ng is a zip manipulation library written in C that is supported on Windows, macOS, and Linux. (mingw-w64)'
url='https://github.com/zlib-ng/minizip-ng'
license=('Zlib')
depends=(
	'mingw-w64-openssl'
	'mingw-w64-bzip2'
	'mingw-w64-zstd'
	'mingw-w64-libiconv'
)
makedepends=('mingw-w64-cmake' 'git')
#checkdepends=('mingw-w64-wine' 'mingw-w64-gtest')
arch=('any')
options=(!strip !buildflags staticlibs)
optdepends=()
source=(
	"$_pkgname-$pkgver.tar.gz::https://github.com/zlib-ng/${_pkgname}/archive/refs/tags/${pkgver}.tar.gz"
	"git+https://github.com/ip7z/7zip.git#tag=$_7zip_ver"
	"${pkgname}-iconv.patch")
sha256sums=('ecc1a514f9e455cb627a768e1219369c576a761bc04196941590906c8b622d7e'
            '0b10e9e903447068ce13161b8eb3864642523ee112c36676fe332d6e712a4550'
            'c4203584aed3c670c7aa2cb3774fe513088de3cee54c5b20f7ddea9fc673d1ef')

_srcdir="${_pkgname}-${pkgver}"
_architectures='i686-w64-mingw32 x86_64-w64-mingw32'
_flags=( -Wno-dev -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS_RELEASE='-DNDEBUG'
	-DMZ_FETCH_LIBS=OFF
	-DMZ_OPENSSL=ON
	-DMZ_COMPAT=OFF
	-DMZ_LIB_SUFFIX='-ng' )

prepare() {
	cd "${_srcdir}"
	patch -p1 -i "${srcdir}/${pkgname}-iconv.patch"

	mkdir -p 'third_party'
	ln -s "${srcdir}/7zip" 'third_party/ppmd'

	sed -i 's/cmake_dependent_option(MZ_OPENSSL "Enables OpenSSL for encryption" ON "UNIX" OFF)/option(MZ_OPENSSL "Enables OpenSSL for encryption" ON)/' 'CMakeLists.txt'
	sed -i -E 's|clone_repo\(ppmd .*|set(PPMD_SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/third_party/ppmd")|' 'CMakeLists.txt'
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
#		${_arch}-cmake -S "${_srcdir}" -B "build-${_arch}" "${_flags[@]}" \
#			-DMZ_BUILD_TESTS=ON \
#			-DMZ_BUILD_UNIT_TESTS=ON
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
