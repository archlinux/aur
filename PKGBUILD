# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

_pkgname=shaderc
pkgname=mingw-w64-${_pkgname}
pkgver=2024.3
pkgrel=1
pkgdesc='Collection of tools, libraries and tests for shader compilation (mingw-w64)'
url="https://github.com/google/${_pkgname}"
arch=('any')
license=('Apache')
depends=('mingw-w64-glslang')
makedepends=('mingw-w64-cmake' 'mingw-w64-spirv-headers' 'mingw-w64-spirv-tools' 'python' 'ninja')
options=('!strip' '!buildflags' 'staticlibs')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/google/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('d5c68b5de5d4c7859d9699054493e0a42a2a5eb21b425d63f7b7dd543db0d708')

_srcdir="${_pkgname}-${pkgver}"
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"
_flags=(
	-Wno-dev
	-DCMAKE_BUILD_TYPE=Release
	-DCMAKE_CXX_FLAGS_RELEASE='-DNDEBUG' )

prepare() {
	cd "${_srcdir}"

	sed -i \
		-e '/find_package(Threads)/a find_package(glslang)\nfind_package(SPIRV-Tools-opt)' \
		-e 's/glslang SPIRV/glslang::glslang glslang::SPIRV/' \
		'libshaderc_util/CMakeLists.txt'

	# de-vendor libs and disable git versioning
	sed '/examples/d;/third_party/d' -i CMakeLists.txt
	sed '/build-version/d' -i glslc/CMakeLists.txt
	cat <<- EOF > glslc/src/build-version.inc
"${pkgver}\\n"
"$(pacman -Q mingw-w64-spirv-tools|cut -d \  -f 2|sed 's/-.*//')\\n"
"$(pacman -Q mingw-w64-glslang|cut -d \  -f 2|sed 's/-.*//')\\n"
EOF
}

build() {
	local -a _glslang_inc
	for _arch in ${_architectures}; do
		_glslang_inc="/usr/${_arch}/include/glslang"
		${_arch}-cmake -G Ninja -S "${_srcdir}" -B "build-${_arch}-static" "${_flags[@]}" \
			-DBUILD_SHARED_LIBS=OFF \
			-DSHADERC_SKIP_TESTS=ON \
			-Dglslang_SOURCE_DIR="${_glslang_inc}" \
			-DCMAKE_INSTALL_PREFIX="/usr/${_arch}/static"
		cmake --build "build-${_arch}-static"

		${_arch}-cmake -G Ninja -S "${_srcdir}" -B "build-${_arch}" "${_flags[@]}" \
			-Dglslang_SOURCE_DIR="${_glslang_inc}" \
			-DSHADERC_SKIP_TESTS=ON
		cmake --build "build-${_arch}"
	done
}

package() {
  for _arch in ${_architectures}; do
		DESTDIR="${pkgdir}" cmake --install "build-${_arch}-static"
		rm -rf "$pkgdir/usr/${_arch}/static/bin"
		${_arch}-strip -g "$pkgdir"/usr/${_arch}/static/lib/*.a

		DESTDIR="${pkgdir}" cmake --install "build-${_arch}"
		${_arch}-strip "$pkgdir"/usr/${_arch}/bin/*.exe
		${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
		${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
	done
}
