# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

_pkgname=soundtouch
pkgname=mingw-w64-${_pkgname}
pkgver=2.4.1
pkgrel=1
pkgdesc='An audio processing library (mingw-w64)'
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=('!buildflags' '!strip' 'staticlibs')
arch=('any')
url='https://www.surina.net/soundtouch/'
license=('LGPL-2.1-or-later')
source=("${_pkgname}-${pkgver}.tar.gz::https://codeberg.org/soundtouch/soundtouch/archive/${pkgver}.tar.gz")
sha256sums=('e07abf20ce8f95850c280132e1f61ad400fc1f4011b7fac698a503de6aab6733')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"
_flags=(
	-Wno-dev -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS_RELEASE='-DNDEBUG -msse2'
	-DSOUNDSTRETCH=OFF
)
_srcdir="${_pkgname}"

prepare() {
	cd "${_srcdir}"

	sed -i '/target_compile_options(SoundTouch PRIVATE ${COMPILE_OPTIONS})/d' 'CMakeLists.txt'
}

build() {
  for _arch in ${_architectures}; do
		${_arch}-cmake -S "${_srcdir}" -B "build-${_arch}-static" "${_flags[@]}" \
			-DBUILD_SHARED_LIBS=OFF -DCMAKE_INSTALL_PREFIX="/usr/${_arch}/static"
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
		${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
		${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
	done
}

