# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=mingw-w64-opencolorio-git
conflicts=("mingw-w64-opencolorio")
provides=("mingw-w64-opencolorio")
pkgver=2.0.0.r1
pkgrel=1
pkgdesc="OpenColorIO (OCIO) is a complete color management solution geared towards motion picture production with an emphasis on visual effects and computer animation."
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
source=("git+https://github.com/AcademySoftwareFoundation/OpenColorIO")
sha256sums=("SKIP")

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
	cd "OpenColorIO"
	rm -f "share/cmake/modules/FindIlmBase.cmake"
	sed -i -r 's/ilmbase::ilmbase/IlmBase::Half/' "src/OpenColorIO/CMakeLists.txt"
}

build() {
	for _arch in ${_architectures}; do
		${_arch}-cmake -S "OpenColorIO" -B "build-${_arch}" -DCMAKE_BUILD_TYPE=Release -DOCIO_BUILD_APPS=OFF \
		-DOCIO_INLINES_HIDDEN=ON -DOCIO_BUILD_TESTS=OFF -DCMAKE_CXX_STANDARD=14 -DOCIO_BUILD_PYTHON=OFF \
		-DOCIO_BUILD_GPU_TESTS=OFF -DOCIO_ADD_EXTRA_BUILTINS=ON \
		-DCMAKE_CXX_FLAGS_RELEASE="-O2 -msse4.2 -D L_tmpnam_s=L_tmpnam -D TMP_MAX_S=TMP_MAX"
		make -C "build-${_arch}"
	done
}

package() {
	for _arch in ${_architectures}; do
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
