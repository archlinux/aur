# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=mingw-w64-openimageio
pkgver=2.1.16.0
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
)
builddepends=("mingw-w64-cmake")
arch=("any")
options=(!strip !buildflags staticlibs)
optdepends=(
	"mingw-w64-intel-tbb"
	"mingw-w64-giflib"
	"mingw-w64-libwebp"
	"mingw-w64-freetype2: install mingw-w64-freetype2-bootstrap and mingw-w64-cairo-bootstrap first."
	"mingw-w64-opencolorio"
	"mingw-w64-opencv"
	"mingw-w64-ffmpeg"
	"mingw-w64-libsquish: DDS file support"
)
sha256sums=(
	"f44e3b3cffe9a8f47395da1ae59e972ecb26adf65f17581e6a489fdcce0cb116"
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
	for _arch in ${_architectures}; do
		${_arch}-cmake -S "oiio-Release-${pkgver}" -B "build-${_arch}" -DBUILD_DOCS=OFF -DBUILD_MISSING_FMT=ON \
			-DBUILD_MISSING_ROBINMAP=ON -DBUILD_TESTING=OFF -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_STANDARD=20 \
			-DINSTALL_DOCS=OFF -DOIIO_BUILD_TESTS=OFF -DOIIO_BUILD_TOOLS=OFF -DUSE_PYTHON=OFF -DUSE_QT=OFF \
			-DUSE_CCACHE=OFF -DUSE_SIMD=sse4.2 -DEMBEDPLUGINS=ON -DSTOP_ON_WARNING=OFF \
			-DCMAKE_CXX_FLAGS="-fpermissive"
		make -C "build-${_arch}"
	done
}

package() {
	for _arch in ${_architectures}; do
		make DESTDIR="${pkgdir}" -C "build-${_arch}" install
		${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
	done
}
