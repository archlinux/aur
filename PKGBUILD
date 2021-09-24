# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=mingw-w64-xalan-c-git
conflicts=('mingw-w64-xalan-c')
provides=('mingw-w64-xalan-c')
pkgver=1.12.0.r10.g58dc1ac6c
pkgrel=1
pkgdesc='A XSLT processor for transforming XML documents (mingw-w64)'
arch=(any)
url='https://xalan.apache.org/'
license=('APACHE')
makedepends=('mingw-w64-cmake' 'mingw-w64-wine' 'git')
depends=('mingw-w64-crt' 'mingw-w64-xerces-c')
options=('!strip' '!buildflags' 'staticlibs')
source=("git+https://github.com/apache/xalan-c"
        'fix-cross-compile.patch')
sha256sums=(
	'SKIP'
	'bffe4d394b877d7a36c08efd7563ce9ccde3621ae3851dc9c00ce065cd360050')

_architectures='i686-w64-mingw32 x86_64-w64-mingw32'

pkgver() {
	cd "xalan-c"
	( set -o pipefail
		git describe --long 2>/dev/null | sed 's/^Xalan.C_//;s/_/./g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

prepare() {
	cd 'xalan-c'
	patch -uNp1 < '../fix-cross-compile.patch'
}

build() {
	_flags=( -Wno-dev -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS_RELEASE='-O2 -DNDEBUG' -Ddoxygen=OFF )
	
	for _arch in ${_architectures}; do
		${_arch}-cmake -S 'xalan-c' -B "build-${_arch}" "${_flags[@]}"
		cmake --build "build-${_arch}"
	done
}

package() {
	for _arch in ${_architectures}; do
		DESTDIR="${pkgdir}" cmake --install "build-${_arch}"
		${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
	done
}
