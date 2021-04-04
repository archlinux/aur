# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=mingw-w64-openimageio
pkgver=2.2.13.0
pkgrel=1
pkgdesc="A library for reading and writing images. (mingw-w64)"
url="http://www.openimageio.org/"
license=("BSD-3-Clause")
depends=(
	"mingw-w64-boost"
	"mingw-w64-openexr"
	"mingw-w64-libtiff"
	"mingw-w64-libpng"
	"mingw-w64-libjpeg-turbo"
	"mingw-w64-tbb"
	"mingw-w64-giflib"
	"mingw-w64-libwebp"
	"mingw-w64-libsquish"
	"mingw-w64-pugixml"
	"mingw-w64-fmt"
	"mingw-w64-freetype2"
	"mingw-w64-opencolorio"
	"mingw-w64-opencv"
	"mingw-w64-ffmpeg"
	"mingw-w64-hdf5"
	"mingw-w64-libraw"
	"mingw-w64-libheif"
)
makedepends=("mingw-w64-cmake" "mingw-w64-robin-map")
arch=("any")
options=(!strip !buildflags staticlibs)
optdepends=()
sha256sums=(
	'fcb938d7d0060816bad18f62ebed6e5a1d959555db2e9d282543b46519237755'
	'9afbed7e3f989dba04a8bb784af24dda26b362f13d4b5933c56bed68289ee352'
)
source=(
	"https://github.com/OpenImageIO/oiio/archive/Release-${pkgver}.tar.gz"
	"mingw-dependency-fix.patch"
)

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"
_flags=( -Wno-dev -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS_RELEASE="-O2 -DNDEBUG -fpermissive"
	-DBUILD_DOCS=OFF -DBUILD_MISSING_FMT=OFF -DBUILD_MISSING_ROBINMAP=OFF
	-DUSE_EXTERNAL_PUGIXML=ON -DCMAKE_CXX_STANDARD=20 -DINSTALL_DOCS=OFF 
	-DOIIO_BUILD_TESTS=OFF -DOIIO_BUILD_TOOLS=ON -DUSE_PYTHON=OFF -DUSE_QT=OFF -DUSE_CCACHE=OFF 
	-DUSE_SIMD=sse4.2 -DEMBEDPLUGINS=ON -DSTOP_ON_WARNING=OFF -DOPTIONAL_DEPS=""
	-DUSE_EMBEDDED_LIBSQUISH=OFF
	-DREQUIRED_DEPS="JPEGTurbo;PNG;TBB;GIF;Webp;Libsquish;Freetype;OpenColorIO;OpenCV;FFmpeg;HDF5;LibRaw;Libheif" )

prepare() {
	cd "oiio-Release-${pkgver}"
	patch -uNp1 < "../mingw-dependency-fix.patch"
	rm -f "src/cmake/modules/FindOpenCV.cmake"
	
	#sed -i -r 's/set \(_runtest \$\{Python_EXECUTABLE\} "\$\{CMAKE_SOURCE_DIR\}\/testsuite\/runtest\.py" \$\{_testdir\}\)/set \(_runtest \$\{Python_EXECUTABLE\} "\$\{CMAKE_SOURCE_DIR\}\/testsuite\/runtest\.py" \$\{_testdir\} --cross-compiling-emulator " \$\{CMAKE_CROSSCOMPILING_EMULATOR\}"\)/' 'src/cmake/testing.cmake'
}

build() {
	for _arch in ${_architectures}; do
		${_arch}-cmake -S "oiio-Release-${pkgver}" -B "build-${_arch}" "${_flags[@]}" -DBUILD_TESTING=OFF
		make -C "build-${_arch}"
	done
}

#check() {
#	for _arch in ${_architectures}; do
#		${_arch}-cmake -S "oiio-Release-${pkgver}" -B "build-${_arch}" "${_flags[@]}" -DBUILD_TESTING=ON
#		make -C "build-${_arch}"
#		make -C "build-${_arch}" test
#	done
#}

package() {
	for _arch in ${_architectures}; do
		make DESTDIR="${pkgdir}" -C "build-${_arch}" install
		${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
	done
}
