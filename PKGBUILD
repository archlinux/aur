# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

_pkgname=libheif
pkgname=mingw-w64-${_pkgname}
pkgver=1.20.2
pkgrel=1
pkgdesc='HEIF file format decoder and encoder (mingw-w64)'
url='https://github.com/strukturag/libheif'
license=('LGPL-3.0-or-later')
depends=(
	'mingw-w64-crt'
	'mingw-w64-libpng'
	'mingw-w64-aom'
	'mingw-w64-x265'
	'mingw-w64-libde265'
	'mingw-w64-rav1e'
	'mingw-w64-dav1d'
	'mingw-w64-zlib'
	'mingw-w64-libwebp'
	'mingw-w64-svt-av1' # Only for x86_64
	'mingw-w64-openjpeg2'
	'mingw-w64-ffmpeg'
	'mingw-w64-kvazaar'
	'mingw-w64-openh264'
)
makedepends=('mingw-w64-cmake' 'ninja')
arch=('any')
options=(!strip !buildflags staticlibs)
optdepends=()
sha256sums=('b70340395d84184bb8dfc833dd51c95ae049435f7ff9abc7b505a08b5ee2bd2a')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/strukturag/${_pkgname}/archive/v${pkgver}.tar.gz")

_srcdir="${_pkgname}-${pkgver}"
_architectures='i686-w64-mingw32 x86_64-w64-mingw32'
_flags=(
	-Wno-dev
	-DCMAKE_BUILD_TYPE=Release
	-DCMAKE_CXX_FLAGS_RELEASE='-DNDEBUG -Wno-error=stringop-overflow'
	-DWITH_RAV1E=ON
	-DWITH_RAV1E_PLUGIN=OFF
	-DWITH_SvtEnc=ON # Only supported on 64 bits platforms
	-DWITH_SvtEnc_PLUGIN=OFF
	-DWITH_EXAMPLES=OFF
	-DWITH_REDUCED_VISIBILITY=OFF
	-DWITH_DAV1D=ON
	-DWITH_DAV1D_PLUGIN=OFF
	-DWITH_FFMPEG_DECODER=ON
	-DWITH_FFMPEG_DECODER_PLUGIN=OFF
	-DWITH_OpenJPEG_DECODER=ON
	-DWITH_OpenJPEG_DECODER_PLUGIN=OFF
	-DWITH_OpenJPEG_ENCODER_PLUGIN=OFF
	-DWITH_KVAZAAR=ON
	-DWITH_KVAZAAR_PLUGIN=OFF
	-DWITH_OpenH264_DECODER=ON
	-DWITH_OpenH264_DECODER_PLUGIN=OFF )

prepare() {
	cd "${_srcdir}"

	(cat << EOF
include(LibFindMacros)
libfind_pkg_check_modules(RAV1E rav1e)
message(STATUS \${RAV1E_LDFLAGS})
EOF
	) > 'cmake/modules/FindRAV1E.cmake'

  sed -i 's/${${varName}_INCLUDE_DIR}/${${varName}_INCLUDE_DIRS}/' 'libheif/plugins/CMakeLists.txt'
  sed -i 's|./${TEST_NAME}|${TEST_NAME}|g' 'tests/CMakeLists.txt'
  sed -i \
		-e 's/__declspec(dllexport)/__attribute__((__dllexport__))/' \
		-e 's/__declspec(dllimport)/__attribute__((__dllimport__))/' \
		'libheif/api/libheif/heif.h'
	sed -i '/#include <err.h>/d' 'libheif/plugins/decoder_openjpeg.cc'
}

build() {
	for _arch in ${_architectures}; do
		${_arch}-cmake -G Ninja -S "${_srcdir}" -B "build-${_arch}-static" "${_flags[@]}" \
			-DBUILD_SHARED_LIBS=OFF \
			-DBUILD_TESTING=OFF \
			-DCMAKE_INSTALL_PREFIX="/usr/${_arch}/static"
		cmake --build "build-${_arch}-static"

		${_arch}-cmake -G Ninja -S "${_srcdir}" -B "build-${_arch}" "${_flags[@]}" \
			-DBUILD_TESTING=OFF
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
		${_arch}-strip -g "$pkgdir"/usr/${_arch}/static/lib/*.a

		DESTDIR="${pkgdir}" cmake --install "build-${_arch}"
		${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
		${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
	done
}
