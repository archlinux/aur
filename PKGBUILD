# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

_pkgname=openjph
pkgname=mingw-w64-${_pkgname}
pkgver=0.25.3
pkgrel=1
pkgdesc='Open-source implementation of JPEG2000 Part-15 (mingw-w64)'
url='https://github.com/aous72/OpenJPH'
arch=(any)
license=('BSD-2-Clause')
depends=('mingw-w64-crt' 'mingw-w64-libtiff')
makedepends=('mingw-w64-cmake' 'ninja')
checkdepends=('mingw-w64-wine' 'python')
options=('staticlibs' '!buildflags' '!strip')
source=(
	"$_pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
	'62450e6cc3110731bee703719145f852610ce632.patch'
	'77f287df698ecddcfa44c5080ed7ed2069714ec4.patch'
)
sha256sums=('815b0d345daf3bbad72f3930d4f6c831643dcb2b734d8bb44d871d68db12f4d2'
            '1542ae0f12957dd20dc81b26197be2d1fab1a251493be3c64888d7a034c78ec7'
            'a7c57736232b778f77564862495d46be5a7349f379b2330d0342efe7ca7ffdb3')

_architectures='i686-w64-mingw32 x86_64-w64-mingw32'
_flags=( -Wno-dev -DCMAKE_BUILD_TYPE=Release
	-DCMAKE_CXX_FLAGS_RELEASE='-DNDEBUG'
	-DCMAKE_C_FLAGS_RELEASE='-DNDEBUG' )
_srcdir="OpenJPH-${pkgver}"

prepare() {
	cd "${_srcdir}"

	patch -p1 -i "${srcdir}/62450e6cc3110731bee703719145f852610ce632.patch"
	patch -p1 -i "${srcdir}/77f287df698ecddcfa44c5080ed7ed2069714ec4.patch"
}

build() {
	for _arch in ${_architectures}; do
		${_arch}-cmake -G Ninja -S "${_srcdir}" -B "build-${_arch}-static" "${_flags[@]}" \
			-DOJPH_BUILD_TESTS=OFF \
			-DBUILD_SHARED_LIBS=OFF \
			-DCMAKE_INSTALL_PREFIX="/usr/${_arch}/static"
		cmake --build "build-${_arch}-static"

		${_arch}-cmake -G Ninja -S "${_srcdir}" -B "build-${_arch}" "${_flags[@]}" \
			-DOJPH_BUILD_TESTS=OFF
		cmake --build "build-${_arch}"
	done
}

check() {
	for _arch in ${_architectures}; do
		${_arch}-cmake -S "${_srcdir}" -B "build-${_arch}" "${_flags[@]}" -DOJPH_BUILD_TESTS=ON
		cmake --build "build-${_arch}"
		cmake --build "build-${_arch}" --target test
	done
}

package() {
	for _arch in ${_architectures}; do
		DESTDIR="${pkgdir}" cmake --install "build-${_arch}-static"
		${_arch}-strip -g "$pkgdir"/usr/${_arch}/static/lib/*.a

		DESTDIR="${pkgdir}" cmake --install "build-${_arch}"
		${_arch}-strip "$pkgdir"/usr/${_arch}/bin/*.exe
		${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
		${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
	done
}
