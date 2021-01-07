# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=mingw-w64-xalan-c-icu
provides=("mingw-w64-xalan-c")
conflicts=("mingw-w64-xalan-c")
pkgver=1.12.0
pkgrel=5
_filever="1_12_0"
pkgdesc="The Apache Xalan-C++ Project provides a library and a command line program to transform XML documents using a stylesheet that conforms to XSLT 1.0 standards. (ICU) (mingw-w64)"
arch=("any")
url="https://xalan.apache.org/"
license=("APACHE")
makedepends=('mingw-w64-cmake' 'mingw-w64-wine' 'git')
depends=('mingw-w64-crt' 'mingw-w64-xerces-c-icu' 'mingw-w64-icu')
options=('!strip' '!buildflags' 'staticlibs')
source=("https://github.com/apache/xalan-c/archive/Xalan-C_${_filever}.tar.gz"
        "fix-cross-compile.patch")
sha256sums=(
	"f3d4f23af7f7914259f2f5dbd9cc1450d3ebe0b8c8163fd50fcac4a39c63fccd"
	"67ab886be3737b39816ab4b7cead15077fcd4808f5d991747343d8485013642a")

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
	cd "xalan-c-Xalan-C_${_filever}"
	patch -uNp1 < "../fix-cross-compile.patch"
	sed -i -r "s/_MSC_VER/_WIN32/" "src/xalanc/XalanExe/XalanExe.cpp"
}

build() {
	_flags=( -Wno-dev -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS_RELEASE="-O2 -DNDEBUG" -Dtranscoder=icu -Ddoxygen=OFF )
	
	for _arch in ${_architectures}; do
		${_arch}-cmake -S "xalan-c-Xalan-C_${_filever}" -B "build-${_arch}" "${_flags[@]}"
		make -C "build-${_arch}"
	done
}

package() {
	for _arch in ${_architectures}; do
		make DESTDIR="${pkgdir}" -C "build-${_arch}" install
		${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
	done
}
