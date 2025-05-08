# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Dario Ostuni <another.code.996@gmail.com>

_pkgname=yaml-cpp
pkgname=mingw-w64-${_pkgname}
pkgver=0.8.0
pkgrel=2
pkgdesc='YAML parser and emitter in C++, written around the YAML 1.2 spec (mingw-w64)'
url="https://github.com/jbeder/${_pkgname}"
arch=('any')
license=('MIT')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake' 'mingw-w64-gcc')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/jbeder/${_pkgname}/archive/${pkgver}.tar.gz")
options=(staticlibs !strip !buildflags)
sha384sums=('586ebc665c33e073be78670fd1810016a9e7ca8ae0ae8290328fc0c2f1e8f7acaa5e415eea5fb8a57efd772a011b1304')

_architectures='i686-w64-mingw32 x86_64-w64-mingw32'
_flags=( -Wno-dev -DCMAKE_BUILD_TYPE=Release
	-DCMAKE_CXX_FLAGS_RELEASE='-DNDEBUG' -DCMAKE_C_FLAGS_RELEASE='-DNDEBUG'
	-DYAML_CPP_BUILD_TOOLS=OFF
	-DCMAKE_POLICY_VERSION_MINIMUM='3.5' )
_srcdir="${_pkgname}-$pkgver"

prepare() {
	cd "$_srcdir"
	sed -i '/#include "yaml-cpp\/null.h"/a #include <cstdint>' 'src/emitterutils.cpp'
}

build() {
	for _arch in ${_architectures}; do
		${_arch}-cmake -S "${_srcdir}" -B "build-${_arch}-static" "${_flags[@]}"  \
			-DYAML_CPP_BUILD_TESTS=OFF -DBUILD_SHARED_LIBS=OFF -DCMAKE_INSTALL_PREFIX="/usr/${_arch}/static"
		cmake --build "build-${_arch}-static"

		${_arch}-cmake -S "${_srcdir}" -B "build-${_arch}" "${_flags[@]}" -DYAML_CPP_BUILD_TESTS=OFF
		cmake --build "build-${_arch}"
	done
}

#check() {
#	for _arch in ${_architectures}; do
#		${_arch}-cmake -S "${_srcdir}" -B "build-${_arch}" "${_flags[@]}" -DYAML_CPP_BUILD_TESTS=ON
#		cmake --build "build-${_arch}"
#		cmake --build "build-${_arch}" --target test
#	done
#}

package() {
	for _arch in ${_architectures}; do
		DESTDIR="${pkgdir}" cmake --install "build-${_arch}-static"
		rm -rf "$pkgdir/usr/${_arch}/static/include/yaml-cpp"
		ln -s "../../include/yaml-cpp" "$pkgdir/usr/${_arch}/static/include/yaml-cpp"
		${_arch}-strip -g "$pkgdir"/usr/${_arch}/static/lib/*.a

		DESTDIR="${pkgdir}" cmake --install "build-${_arch}"
		${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
		${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
	done
}
