# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

_pkgname=glslang
pkgname=mingw-w64-${_pkgname}
pkgver=15.0.0
pkgrel=1
pkgdesc='OpenGL and OpenGL ES shader front end and validator (mingw-w64)'
arch=('any')
url='https://github.com/KhronosGroup/glslang'
license=('BSD')
depends=('mingw-w64-crt' 'mingw-w64-spirv-tools')
makedepends=('mingw-w64-cmake' 'python' 'ninja')
optdepends=('mingw-w64-wine: runtime support')
options=('!strip' '!buildflags' 'staticlibs')
source=(${_pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha256sums=('c31c8c2e89af907507c0631273989526ee7d5cdf7df95ececd628fd7b811e064')

_srcdir="${_pkgname}-${pkgver}"
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"
_flags=(
	-Wno-dev -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS_RELEASE='-DNDEBUG'
	-DALLOW_EXTERNAL_SPIRV_TOOLS=ON )

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
