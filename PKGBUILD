# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=mingw-w64-xalan-c-icu
provides=('mingw-w64-xalan-c')
conflicts=('mingw-w64-xalan-c')
pkgver=1.12.0
pkgrel=7
_filever='1_12_0'
pkgdesc='A XSLT processor for transforming XML documents (ICU) (mingw-w64)'
arch=('any')
url='https://xalan.apache.org/'
license=('APACHE')
makedepends=('mingw-w64-cmake' 'mingw-w64-wine' 'git')
depends=('mingw-w64-crt' 'mingw-w64-xerces-c-icu' 'mingw-w64-icu')
options=('!strip' '!buildflags' 'staticlibs')
source=("https://github.com/apache/xalan-c/archive/Xalan-C_${_filever}.tar.gz"
        'fix-cross-compile.patch'
				'https://github.com/apache/xalan-c/pull/36.patch')
sha256sums=(
	'f3d4f23af7f7914259f2f5dbd9cc1450d3ebe0b8c8163fd50fcac4a39c63fccd'
	'bffe4d394b877d7a36c08efd7563ce9ccde3621ae3851dc9c00ce065cd360050'
	'ed5a03ffecb0476aa02e90aba99f12d843bfd90748481d7b1ffc6d524bf4d952')

_architectures='i686-w64-mingw32 x86_64-w64-mingw32'

prepare() {
	cd "xalan-c-Xalan-C_${_filever}"
	patch -uNp1 < '../fix-cross-compile.patch'
	patch -uNp1 < '../36.patch'
}

build() {
	_flags=( -Wno-dev -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS_RELEASE='-O2 -DNDEBUG' -Dtranscoder=icu -Ddoxygen=OFF )
	
	for _arch in ${_architectures}; do
		${_arch}-cmake -S "xalan-c-Xalan-C_${_filever}" -B "build-${_arch}-static" "${_flags[@]}" -DBUILD_SHARED_LIBS=OFF -DCMAKE_INSTALL_PREFIX="/usr/${_arch}/static"
		cmake --build "build-${_arch}-static"
		
		${_arch}-cmake -S "xalan-c-Xalan-C_${_filever}" -B "build-${_arch}" "${_flags[@]}"
		cmake --build "build-${_arch}"
	done
}

package() {
	for _arch in ${_architectures}; do
		DESTDIR="${pkgdir}" cmake --install "build-${_arch}-static"
		rm -rf "$pkgdir"/usr/${_arch}/static/{bin,share}
		${_arch}-strip -g "$pkgdir"/usr/${_arch}/static/lib/*.a
		
		DESTDIR="${pkgdir}" cmake --install "build-${_arch}"
		${_arch}-strip "$pkgdir"/usr/${_arch}/bin/*.exe
		${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
		${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
	done
}
