# Maintainer: Daniel Kirchner <daniel at ekpyron dot org>

pkgname=mingw-w64-assimp
pkgver=3.1.1
pkgrel=1
pkgdesc="Portable Open Source library to import various well-known 3D model formats in an uniform manner (mingw-w64)"
arch=('any')
license=('BSD')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake' 'mingw-w64-gcc' 'unzip')
url=('http://assimp.sourceforge.net/index.html')
source=("https://github.com/assimp/assimp/archive/v${pkgver}.tar.gz")
options=(!strip !buildflags staticlibs)
md5sums=('ab9977edf95e9b2910d7cca286926e85')

_basename=assimp
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() 
{
	unset LDFLAGS
	
	for _arch in ${_architectures}; do
		rm -rf "${srcdir}/build-${_arch}-static"
		mkdir -p "${srcdir}/build-${_arch}-static"
		cd "${srcdir}/build-${_arch}-static"
	
		${_arch}-cmake ../${_basename}-${pkgver} \
			-DASSIMP_BUILD_ASSIMP_TOOLS=NO -DBUILD_SHARED_LIBS=ON \
			-DASSIMP_BUILD_TESTS=OFF -DCMAKE_BUILD_TYPE=RELEASE
		make
	done
	
	for _arch in ${_architectures}; do
		rm -rf "${srcdir}/build-${_arch}"
		mkdir -p "${srcdir}/build-${_arch}"
		cd "${srcdir}/build-${_arch}"
	
		${_arch}-cmake ../${_basename}-${pkgver} \
			-DASSIMP_BUILD_ASSIMP_TOOLS=NO -DBUILD_SHARED_LIBS=OFF \
			-DASSIMP_BUILD_TESTS=OFF -DCMAKE_BUILD_TYPE=RELEASE
		make
	done
}

package () {
	for _arch in ${_architectures}; do
		cd "${srcdir}/build-${_arch}"
		make DESTDIR="${pkgdir}" install
		cd "${srcdir}/build-${_arch}-static"
		make DESTDIR="${pkgdir}" install
		${_arch}-strip -g ${pkgdir}/usr/${_arch}/lib/*.a
		${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
	done	

	install -Dm644 "${srcdir}/${_basename}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
