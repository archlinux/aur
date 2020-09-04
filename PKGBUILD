# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=mingw-w64-xalan-c-git
conflicts=("mingw-w64-xalan-c")
provides=("mingw-w64-xalan-c")
pkgver=r2.d8240ca
pkgrel=1
pkgdesc="The Apache Xalan-C++ Project provides a library and a command line program to transform XML documents using a stylesheet that conforms to XSLT 1.0 standards. (mingw-w64)"
arch=(any)
url="https://xalan.apache.org/"
license=("APACHE")
makedepends=('mingw-w64-cmake' 'mingw-w64-wine' 'git')
depends=('mingw-w64-crt' 'mingw-w64-xerces-c')
options=('!strip' '!buildflags' 'staticlibs')
source=("git+https://github.com/apache/xalan-c"
        "fix-cross-compile.patch")
sha256sums=(
	"SKIP"
	"08400961f038c1aed090174425e894673ffc359b52bcbad73d2c537a89ea34b7")

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgver() {
	cd "${_repo}"
	( set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

prepare() {
	cd "xalan-c"
	git apply "../fix-cross-compile.patch"
	sed -i -r "s/_MSC_VER/_WIN32/" "src/xalanc/XalanExe/XalanExe.cpp"
}

build() {
	_flags=( -Wno-dev -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS_RELEASE="-O2 -DNDEBUG" -Ddoxygen=OFF )
	
	for _arch in ${_architectures}; do
		${_arch}-cmake -S "xalan-c" -B "build-${_arch}" "${_flags[@]}" -DBUILD_SHARED_LIBS=FALSE
		make -C "build-${_arch}-static"
		${_arch}-cmake -S "xalan-c" -B "build-${_arch}" "${_flags[@]}"
		make -C "build-${_arch}"
	done
}

package() {
	for _arch in ${_architectures}; do
		make DESTDIR="${pkgdir}" -C "build-${_arch}-static" install
		make DESTDIR="${pkgdir}" -C "build-${_arch}" install
		${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
	done
}
