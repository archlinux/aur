# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

_pkgname=openimageio
pkgname=mingw-w64-${_pkgname}
pkgver=2.4.9.0
pkgrel=2
pkgdesc='A library for reading and writing images, including classes, utilities, and applications (mingw-w64)'
url='http://www.openimageio.org/'
license=('BSD-3-Clause')
depends=(
	'mingw-w64-openexr'
	'mingw-w64-libtiff'
	'mingw-w64-libpng'
	'mingw-w64-libjpeg-turbo'
	'mingw-w64-onetbb'
	'mingw-w64-giflib'
	'mingw-w64-libwebp'
	'mingw-w64-pugixml'
	'mingw-w64-fmt'
	'mingw-w64-freetype2'
	'mingw-w64-opencolorio'
	'mingw-w64-opencv'
	'mingw-w64-ffmpeg'
	'mingw-w64-hdf5'
	'mingw-w64-libraw'
	'mingw-w64-libheif'
	'mingw-w64-ptex'
)
makedepends=('mingw-w64-cmake' 'mingw-w64-robin-map' 'mingw-w64-wine' 'mingw-w64-boost')
#checkdepends=('python')
arch=('any')
options=(!strip !buildflags staticlibs)
optdepends=()
source=("$_pkgname-$pkgver.tar.gz::https://github.com/OpenImageIO/oiio/archive/v${pkgver}.tar.gz")
sha256sums=('d04c12575d63d13ed64fc037ea37da616224736213d785de9f50337f6eb5a9ed')

_srcdir="oiio-${pkgver}"
_architectures='i686-w64-mingw32 x86_64-w64-mingw32'
_flags=(
	-Wno-dev -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS_RELEASE='-DNDEBUG -fpermissive'
	-DBUILD_DOCS=OFF
	-DBUILD_MISSING_FMT=OFF
	-DBUILD_MISSING_ROBINMAP=OFF
	-DUSE_EXTERNAL_PUGIXML=ON
	-DCMAKE_CXX_STANDARD=20
	-DINSTALL_DOCS=OFF 
	-DUSE_PYTHON=OFF
	-DUSE_QT=OFF
	-DUSE_CCACHE=OFF 
	-DUSE_SIMD=sse4.2
	-DEMBEDPLUGINS=ON
	-DSTOP_ON_WARNING=OFF
	-DOPTIONAL_DEPS=''
	-DREQUIRED_DEPS='JPEGTurbo;PNG;TBB;GIF;Webp;Libsquish;Freetype;OpenColorIO;OpenCV;FFmpeg;HDF5;LibRaw;Libheif;Ptex' )

build() {
	for _arch in ${_architectures}; do
		${_arch}-cmake -S "${_srcdir}" -B "build-${_arch}-static" "${_flags[@]}" \
			-DBUILD_SHARED_LIBS=OFF \
			-DBUILD_TESTING=OFF -DOIIO_BUILD_TESTS=OFF \
			-DOIIO_DOWNLOAD_MISSING_TESTDATA=OFF \
			-DOIIO_BUILD_TOOLS=OFF \
			-DCMAKE_INSTALL_PREFIX="/usr/${_arch}/static" \
			-DCMAKE_FIND_NO_INSTALL_PREFIX=ON
		cmake --build "build-${_arch}-static"
		
		${_arch}-cmake -S "${_srcdir}" -B "build-${_arch}" "${_flags[@]}" \
			-DBUILD_TESTING=OFF -DOIIO_BUILD_TESTS=OFF \
			-DOIIO_DOWNLOAD_MISSING_TESTDATA=OFF \
			-DOIIO_BUILD_TOOLS=ON
		cmake --build "build-${_arch}"
	done
}

#check() {
#	for _arch in ${_architectures}; do
#		${_arch}-cmake -S "${_srcdir}" -B "build-${_arch}" "${_flags[@]}" -DBUILD_TESTING=ON -DOIIO_BUILD_TESTS=ON -DOIIO_DOWNLOAD_MISSING_TESTDATA=ON
#		cmake --build "build-${_arch}"
#		WINEEXEC=${_arch}-wine cmake --build "build-${_arch}" --target test
#	done
#}

package() {
	for _arch in ${_architectures}; do
		DESTDIR="${pkgdir}" cmake --install "build-${_arch}-static"
		rm -rf "$pkgdir"/usr/${_arch}/static/share
		${_arch}-strip -g "$pkgdir"/usr/${_arch}/static/lib/*.a
		
		DESTDIR="${pkgdir}" cmake --install "build-${_arch}"
		${_arch}-strip "$pkgdir"/usr/${_arch}/bin/*.exe
		${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
		${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
	done
}
