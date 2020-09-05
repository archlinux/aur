# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=mingw-w64-openimageio
pkgver=2.2.6.1
pkgrel=3
pkgdesc="A library for reading and writing images (mingw-w64)"
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
	"mingw-w64-robinmap"
	"mingw-w64-libraw"
)
makedepends=("mingw-w64-cmake")
arch=("any")
options=(!strip !buildflags staticlibs)
optdepends=()
sha256sums=(
	"adc245c9b2fa2bce1dd2decbdd1d03974e1e9818219d267d1da3dd1bd91216df"
	"87e13ccaf0359ad86713721448f14073d9e4b8904fb1353b259c351482c326a7"
)
source=(
	"https://github.com/OpenImageIO/oiio/archive/Release-${pkgver}.tar.gz"
	"mingw-compile-fix.patch"
)

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
	cd "oiio-Release-${pkgver}"
	patch -uNp1 < "../mingw-compile-fix.patch"
	rm -f src/cmake/modules/FindOpenCV.cmake
	sed -i -r 's/set \(REQUIED_DEPS/set \(REQUIRED_DEPS/' "src/cmake/externalpackages.cmake"
	sed -i -r 's/target_link_libraries \(OpenImageIO PRIVATE \$\{PUGIXML_LIBRARIES\}\)/target_link_libraries \(OpenImageIO PRIVATE pugixml\)/' "src/libOpenImageIO/CMakeLists.txt"
}

build() {
	_flags=( -Wno-dev -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS_RELEASE="-O2 -DNDEBUG -fpermissive"
		-DBUILD_DOCS=OFF -DBUILD_MISSING_FMT=OFF -DBUILD_MISSING_ROBINMAP=OFF
		-DUSE_EXTERNAL_PUGIXML=ON -DBUILD_TESTING=OFF -DCMAKE_CXX_STANDARD=20 -DINSTALL_DOCS=OFF 
		-DOIIO_BUILD_TESTS=OFF -DOIIO_BUILD_TOOLS=OFF -DUSE_PYTHON=OFF -DUSE_QT=OFF -DUSE_CCACHE=OFF 
		-DUSE_SIMD=sse4.2 -DEMBEDPLUGINS=ON -DSTOP_ON_WARNING=OFF -DOPTIONAL_DEPS=""
		-DUSE_EMBEDDED_LIBSQUISH=OFF
		-DREQUIRED_DEPS="JPEGTurbo;PNG;TBB;GIF;Webp;Libsquish;Freetype;OpenColorIO;OpenCV;FFmpeg;HDF5;LibRaw" )
		
	for _arch in ${_architectures}; do
		${_arch}-cmake -S "oiio-Release-${pkgver}" -B "build-${_arch}-static" "${_flags[@]}" -DBUILD_SHARED_LIBS=FALSE
		make -C "build-${_arch}-static"
		${_arch}-cmake -S "oiio-Release-${pkgver}" -B "build-${_arch}" "${_flags[@]}"
		make -C "build-${_arch}"
	done
}

package() {
	for _arch in ${_architectures}; do
		make DESTDIR="${pkgdir}" -C "build-${_arch}-static" install
		make DESTDIR="${pkgdir}" -C "build-${_arch}" install
		${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
	done
}
