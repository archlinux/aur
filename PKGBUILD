# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

_pkgname=libssh2
pkgname=mingw-w64-${_pkgname}
pkgver=1.11.0
pkgrel=1
pkgdesc="A library implementing the SSH2 protocol as defined by Internet Drafts (mingw-w64)"
arch=(any)
url="http://www.libssh2.org"
license=("BSD")
makedepends=('mingw-w64-cmake')
depends=('mingw-w64-crt' 'mingw-w64-openssl' 'mingw-w64-zlib')
#checkdepends=('mingw-w64-wine')
options=(staticlibs !strip !buildflags)
source=("$url/download/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('3736161e41e2693324deb38c26cfdc3efe6209d634ba4258db1cecff6a5ad461')

_srcdir="${_pkgname}-${pkgver}"
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"
_flags=( -Wno-dev -DCMAKE_BUILD_TYPE=Release
	-DCMAKE_CXX_FLAGS_RELEASE='-DNDEBUG'
	-DBUILD_EXAMPLES=OFF 
	-DENABLE_ZLIB_COMPRESSION=ON )

build() {
	for _arch in ${_architectures}; do
		${_arch}-cmake -S "${_srcdir}" -B "build-${_arch}" "${_flags[@]}" \
			-DBUILD_SHARED_LIBS=ON -DBUILD_TESTING=OFF
		cmake --build "build-${_arch}"
	done
}

#check() {
#	for _arch in ${_architectures}; do
#		${_arch}-cmake -S "${_srcdir}" -B "build-${_arch}" "${_flags[@]}" -DBUILD_TESTING=ON
#		cmake --build "build-${_arch}"
#		cmake --build "build-${_arch}" --target test
#	done
#}

package() {
	for _arch in ${_architectures}; do
		DESTDIR="${pkgdir}" cmake --install "build-${_arch}"
		rm -rf "$pkgdir"/usr/${_arch}/share
		${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
		${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
	done
}
