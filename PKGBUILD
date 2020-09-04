# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=mingw-w64-opencolorio-git
conflicts=("mingw-w64-opencolorio")
provides=("mingw-w64-opencolorio")
pkgver=1.0.8.r457.g4f1414a1
pkgrel=3
pkgdesc="OpenColorIO (OCIO) is a complete color management solution geared towards motion picture production with an emphasis on visual effects and computer animation. (mingw-w64)"
arch=(any)
url="https://opencolorio.org/"
license=("BSD-3-Clause")
makedepends=('mingw-w64-cmake')
depends=(
	'mingw-w64-crt'
	'mingw-w64-openexr'
	'mingw-w64-yaml-cpp'
	'mingw-w64-zlib'
	'mingw-w64-expat'
	'mingw-w64-pystring')
options=('!strip' '!buildflags' 'staticlibs')
_repo="OpenColorIO"
source=("git+https://github.com/AcademySoftwareFoundation/${_repo}")
sha256sums=("SKIP")

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgver() {
	cd "${_repo}"
	( set -o pipefail
		git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

prepare() {
	cd "${_repo}"
	rm -f "share/cmake/modules/FindIlmBase.cmake"
	sed -i -r 's/ilmbase::ilmbase/IlmBase::Half/' "src/OpenColorIO/CMakeLists.txt"
}

build() {
	_flags=( -Wno-dev -DCMAKE_BUILD_TYPE=Release -DOCIO_BUILD_APPS=OFF
		-DOCIO_INLINES_HIDDEN=ON -DOCIO_BUILD_TESTS=OFF -DCMAKE_CXX_STANDARD=14 -DOCIO_BUILD_PYTHON=OFF
		-DOCIO_BUILD_GPU_TESTS=OFF -DOCIO_ADD_EXTRA_BUILTINS=ON
		-DCMAKE_CXX_FLAGS_RELEASE="-O2 -DNDEBUG -msse4.2 -D L_tmpnam_s=L_tmpnam -D TMP_MAX_S=TMP_MAX" )
		
	for _arch in ${_architectures}; do
		${_arch}-cmake -S "${_repo}" -B "build-${_arch}-static" "${_flags[@]}" -DBUILD_SHARED_LIBS=FALSE
		make -C "build-${_arch}-static"
		${_arch}-cmake -S "${_repo}" -B "build-${_arch}" "${_flags[@]}"
		make -C "build-${_arch}"
	done
}

package() {
	for _arch in ${_architectures}; do
		make DESTDIR="${pkgdir}" -C "build-${_arch}-static" install
		make DESTDIR="${pkgdir}" -C "build-${_arch}" install
		pushd "${pkgdir}/usr/${_arch}/bin"
			ln -s "libOpenColorIO_2_0.dll" "libOpenColorIO.dll"
		popd
		pushd "${pkgdir}/usr/${_arch}/lib"
			ln -s "libOpenColorIO_2_0.dll.a" "libOpenColorIO.dll.a"
		popd
		${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
	done
}
