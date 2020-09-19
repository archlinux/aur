# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=mingw-w64-libheif
pkgver=1.8.0
pkgrel=1
pkgdesc="HEIF file format decoder and encoder."
url="https://github.com/strukturag/libheif"
license=("LGPL")
depends=(
	"mingw-w64-crt"
	"mingw-w64-libpng"
	"mingw-w64-libjpeg-turbo"
	"mingw-w64-aom"
	"mingw-w64-rav1e"
	#"mingw-w64-x265"
)
makedepends=("mingw-w64-make")
arch=("any")
options=(!strip !buildflags staticlibs)
optdepends=()
sha256sums=(
	"d0da9db71f9e835b5afb6364749a52ed97bc31ffd886d36ce1ad8b0a50c6ceb3"
)
source=(
	"https://github.com/strukturag/libheif/archive/v${pkgver}.tar.gz"
)

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
	cd "libheif-${pkgver}"
	sed -r -i 's/AC_INIT\(\[libheif\], \[1.8.0\], \[opensource@struktur.de\]/AC_INIT\(\[libheif\], \[1.8.0\], \[opensource@struktur.de\], \[win32-dll\]/' "configure.ac"
	autoreconf -fi
}

build() {
	cd "libheif-${pkgver}"
	for _arch in ${_architectures}; do
		mkdir -p "build-${_arch}" && pushd "build-${_arch}"
		${_arch}-configure --disable-tests --disable-examples --disable-go ..
		LDFLAGS="$LDFLAGS -no-undefined -lssp" ${_arch}-make
		popd
	done
}

package() {
	cd "libheif-${pkgver}"
	for _arch in ${_architectures}; do
		make DESTDIR="${pkgdir}" -C "build-${_arch}" install
		${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
		${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
	done
}
