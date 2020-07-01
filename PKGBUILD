# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=mingw-w64-openimageio
pkgver=2.1.17.0
pkgrel=1
pkgdesc="A library for reading and writing images."
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
)
builddepends=("mingw-w64-cmake" "git")
arch=("any")
options=(!strip !buildflags staticlibs)
optdepends=()
sha256sums=(
	"6f20536226f1da4fbf0d522815de47eef60a443f9b67a15705b96c34cc8921a7"
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
}

build() {
	_flags=( -Wno-dev -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS_RELEASE="-O2 -DNDEBUG -fpermissive"
		-DBUILD_DOCS=OFF -DBUILD_MISSING_FMT=OFF -DBUILD_MISSING_ROBINMAP=ON -DBUILD_ROBINMAP_FORCE=ON 
		-DUSE_EXTERNAL_PUGIXML=ON -DBUILD_TESTING=OFF -DCMAKE_CXX_STANDARD=20 -DINSTALL_DOCS=OFF 
		-DOIIO_BUILD_TESTS=OFF -DOIIO_BUILD_TOOLS=OFF -DUSE_PYTHON=OFF -DUSE_QT=OFF -DUSE_CCACHE=OFF 
		-DUSE_SIMD=sse4.2 -DEMBEDPLUGINS=ON -DSTOP_ON_WARNING=OFF -DOPTIONAL_DEPS=""
		-DREQUIRED_DEPS="JPEGTurbo;PNG;TBB;GIF;Webp;Libsquish;Freetype;OpenColorIO;OpenCV;FFmpeg" )
		
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
