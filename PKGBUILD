# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

_pkgname=fmt
pkgname=mingw-w64-${_pkgname}
pkgver=12.2.1
pkgrel=1
pkgdesc='Open-source formatting library for C++ (mingw-w64)'
url='https://fmt.dev/'
license=('MIT')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
checkdepends=('mingw-w64-wine')
arch=('any')
options=(!strip !buildflags staticlibs)
optdepends=()
sha256sums=('449374d74f31b67796dece454d59b93e6f1538efcce0e9ac78000c98142c139e'
            '3ae38ee5052f7b118c22e6aceaa43ae9c4d0ac7d2d9b74045e9b44d114906363')
source=(
	"$_pkgname-$pkgver.tar.gz::https://github.com/fmtlib/${_pkgname}/archive/${pkgver}.tar.gz"
	"${pkgname}-i686-fix.patch")

_srcdir="${_pkgname}-${pkgver}"
_architectures="${MINGW_W64_ARCHS:-x86_64-w64-mingw32}"
_flags=( -Wno-dev -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS_RELEASE='-DNDEBUG' \
	-DFMT_DOC=OFF
	-DCMAKE_CXX_STANDARD=23 )

prepare() {
	cd "${_srcdir}"
	patch -p1 -i "${srcdir}/${pkgname}-i686-fix.patch"
}

build() {
	for _arch in ${_architectures}; do
		${_arch}-cmake -S "${_srcdir}" -B "build-${_arch}-static" "${_flags[@]}" \
			-DFMT_TEST=OFF \
			-DBUILD_SHARED_LIBS=OFF \
			-DCMAKE_INSTALL_PREFIX="/usr/${_arch}/static"
		cmake --build "build-${_arch}-static"

		${_arch}-cmake -S "${_srcdir}" -B "build-${_arch}" "${_flags[@]}" \
			-DFMT_TEST=OFF
		cmake --build "build-${_arch}"
	done
}

check() {
	for _arch in ${_architectures}; do
		${_arch}-cmake -S "${_srcdir}" -B "build-${_arch}" "${_flags[@]}" \
			-DFMT_TEST=ON
		cmake --build "build-${_arch}"
		cmake --build "build-${_arch}" --target test
	done
}

package() {
	for _arch in ${_architectures}; do
		DESTDIR="${pkgdir}" cmake --install "build-${_arch}-static"
		${_arch}-strip -g "$pkgdir"/usr/${_arch}/static/lib/*.a

		DESTDIR="${pkgdir}" cmake --install "build-${_arch}"
		${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
	done
}
