# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

_pkgname=glslang
pkgname=mingw-w64-${_pkgname}
pkgver=1.4.335.0
pkgrel=1
epoch=1
_tag="vulkan-sdk-$pkgver"
pkgdesc='OpenGL and OpenGL ES shader front end and validator (mingw-w64)'
arch=('any')
url='https://github.com/KhronosGroup/glslang'
license=('BSD-3-Clause')
depends=('mingw-w64-crt' 'mingw-w64-spirv-tools')
makedepends=('mingw-w64-cmake' 'python' 'ninja')
optdepends=('mingw-w64-wine: runtime support')
options=('!strip' '!buildflags' 'staticlibs')
source=("${_pkgname}-${_tag}.tar.gz::${url}/archive/refs/tags/${_tag}.tar.gz")
sha256sums=('d148ae0b8633bd81f47c612367586a084577fbad311b738b9d8d5a8c35ebf90a')

_srcdir="${_pkgname}-${_tag}"
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"
_flags=(
	-Wno-dev -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS_RELEASE='-DNDEBUG'
	-DALLOW_EXTERNAL_SPIRV_TOOLS=ON )

prepare() {
	cd "$_srcdir"
	sed -i 's/if (NOT BUILD_SHARED_LIBS)/if (1)/' 'SPIRV/CMakeLists.txt'
}

build() {
	for _arch in ${_architectures}; do
		${_arch}-cmake -G Ninja -S "${_srcdir}" -B "build-${_arch}-static" "${_flags[@]}" \
			-DBUILD_SHARED_LIBS=OFF \
			-DGLSLANG_TESTS=OFF \
			-DCMAKE_INSTALL_PREFIX="/usr/${_arch}/static"
		cmake --build "build-${_arch}-static"

		${_arch}-cmake -G Ninja -S "${_srcdir}" -B "build-${_arch}" "${_flags[@]}" \
			-DGLSLANG_TESTS=OFF
		cmake --build "build-${_arch}"
	done
}

package() {
	for _arch in ${_architectures}; do
		DESTDIR="${pkgdir}" cmake --install "build-${_arch}-static"
		rm -rf "$pkgdir"/usr/${_arch}/static/share
		${_arch}-strip -g "$pkgdir"/usr/${_arch}/static/lib/*.a

		DESTDIR="${pkgdir}" cmake --install "build-${_arch}"
		${_arch}-strip "$pkgdir"/usr/${_arch}/bin/*.exe
		${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
		${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a

		install -dm755 "$pkgdir/usr/bin"
		install -Dm755 <(cat << EOF
#!/usr/bin/env sh
${_arch}-wine /usr/${_arch}/bin/${_pkgname}.exe "\$@"
EOF
    ) "$pkgdir/usr/bin/${_arch}-${_pkgname}"
	done
}
