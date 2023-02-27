# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Dario Ostuni <another.code.996@gmail.com>

_pkgname=yaml-cpp
pkgname=mingw-w64-${_pkgname}
pkgver=0.7.0
pkgrel=1
pkgdesc='YAML parser and emitter in C++, written around the YAML 1.2 spec (mingw-w64)'
url="https://github.com/jbeder/${_pkgname}"
arch=('any')
license=('MIT')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake' 'mingw-w64-gcc')
source=("https://github.com/jbeder/${_pkgname}/archive/${_pkgname}-${pkgver}.tar.gz")
options=(staticlibs !strip !buildflags)
sha384sums=('5ab7a67ba57b9ee189ee4f9c5822ca834ef246740b43490a060a6b329860f494b6b8f3433bfeaf646e492336b2956e4e')

_architectures='i686-w64-mingw32 x86_64-w64-mingw32'
_flags=( -Wno-dev -DCMAKE_BUILD_TYPE=Release
	-DCMAKE_CXX_FLAGS_RELEASE='-O2 -DNDEBUG' -DCMAKE_C_FLAGS_RELEASE='-O2 -DNDEBUG'
	-DYAML_CPP_BUILD_TOOLS=OFF )
_srcdir="${_pkgname}-${_pkgname}-$pkgver"

prepare() {
	cd "${_srcdir}"
	
	# Fix pkgconfig and cmake files install location.
	sed -i 's|INSTALL_DESTINATION "${CMAKE_INSTALL_DATADIR}/cmake/yaml-cpp"|INSTALL_DESTINATION "${CMAKE_INSTALL_LIBDIR}/cmake/yaml-cpp"|' 'CMakeLists.txt'
	sed -i 's|DESTINATION "${CMAKE_INSTALL_DATADIR}/cmake/yaml-cpp"|DESTINATION "${CMAKE_INSTALL_LIBDIR}/cmake/yaml-cpp"|' 'CMakeLists.txt'
	sed -i 's|${CMAKE_INSTALL_DATADIR}/pkgconfig)|${CMAKE_INSTALL_LIBDIR}/pkgconfig)|' 'CMakeLists.txt'
	
	#sed -i 's/add_test(yaml-cpp::test yaml-cpp-tests)/add_test(NAME yaml-cpp::test COMMAND yaml-cpp-tests)/' 'test/CMakeLists.txt'
	#sed -i 's/build-windows-dll/OFF/' 'test/CMakeLists.txt'
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
#		WINEPATH="build-${_arch}:/usr/${_arch}/bin" cmake --build "build-${_arch}" --target test
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
