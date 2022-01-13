_pkgname=fmt
pkgname=mingw-w64-${_pkgname}-nocheck
pkgver=8.1.1
pkgrel=1
pkgdesc='Open-source formatting library for C++ (mingw-w64)'
url='https://fmt.dev/'
license=('MIT')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
provides=('mingw-w64-fmt')
conflicts=('mingw-w64-fmt')
arch=('any')
options=(!strip !buildflags staticlibs !lto)
optdepends=()
sha256sums=('3d794d3cf67633b34b2771eb9f073bde87e846e0d395d254df7b211ef1ec7346')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/fmtlib/${_pkgname}/archive/${pkgver}.tar.gz")

_srcdir="${_pkgname}-${pkgver}"
_architectures='i686-w64-mingw32 x86_64-w64-mingw32'
_flags=( -DCMAKE_BUILD_TYPE=Release -DFMT_DOC=OFF -DFMT_TEST=OFF )

build() {
	for _arch in ${_architectures}; do
		${_arch}-cmake -S "${_srcdir}" -B "build-${_arch}-static" "${_flags[@]}" -DBUILD_SHARED_LIBS=OFF -DCMAKE_INSTALL_PREFIX="/usr/${_arch}/static"
		cmake --build "build-${_arch}-static"
		
		${_arch}-cmake -S "${_srcdir}" -B "build-${_arch}" "${_flags[@]}" 
		cmake --build "build-${_arch}"
	done
}

package() {
	for _arch in ${_architectures}; do
		DESTDIR="${pkgdir}" cmake --install "build-${_arch}-static"
		${_arch}-strip -g "$pkgdir"/usr/${_arch}/static/lib/*.a
		
		DESTDIR="${pkgdir}" cmake --install "build-${_arch}"
                ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
		${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
	done
}
