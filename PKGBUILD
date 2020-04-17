# Maintainer: Karl-Felix Glatzer <karl.glatzer@gmx.de>
pkgname=mingw-w64-ois
pkgver=1.5
pkgrel=1
pkgdesc="Object Oriented Input System (mingw-w64)"
arch=('any')
url="https://github.com/wgois/OIS"
license=('custom:zlib/libpng')
depends=('mingw-w64-crt')
options=(!strip !buildflags !libtool staticlibs)
makedepends=('mingw-w64-gcc' 'mingw-w64-cmake')
source=("https://github.com/wgois/OIS/archive/v${pkgver}.tar.gz"
        "dxsdk.patch"
        "cmake.patch"
        "xinput.patch")
sha512sums=('5ab1dda7c25c1959ccbbb758ea3fda36bd62ad65f46e2c6b418317a5eb39e0bace52a44ae079dfb69fc58c90df54f8e50d589daae1100ec615325363c9d77513'
            'f9cbaa72acf16982533ce9687efd9c1321b7f38dfeeb5401cc75eaa2ab094927217be87bafcf574120a4a486b46be47a6cd06eeafdfa858693cce661e1585a1a'
            '057f65d3ea564daf5661f91c323554ed356830242ce0597eaa562b229fb70be983ba4443003eec9164da3ed7a4a17ecdf312da4e54e78fb93474562db86e1531'
	    '37e9a63e9de1ee71fef8331c3fedf84f4a22827c90b62150d57c1780a30cbda6c41a5470a017acf68bb9977c14c00cea315214544d812044e28ff5825a386a76')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd ${srcdir}/OIS-*

  patch -Np1 < ${srcdir}/dxsdk.patch
  patch -Np1 < ${srcdir}/cmake.patch
  patch -Np1 < ${srcdir}/xinput.patch
}

build() {

  for _arch in ${_architectures}; do
    cd ${srcdir}/OIS-*
    mkdir -p build-static-${_arch} && cd build-static-${_arch}
    export DXSDK_DIR="/usr/${_arch}/"
    ${_arch}-cmake -DOIS_BUILD_DEMOS="OFF" -DOIS_BUILD_SHARED_LIBS="OFF" -DDXSDK_DIR="/usr/${_arch}/" ..
    make
  done

  for _arch in ${_architectures}; do
    cd ${srcdir}/OIS-*
    mkdir -p build-${_arch} && cd build-${_arch}
    export DXSDK_DIR="/usr/${_arch}/"
    ${_arch}-cmake -DOIS_BUILD_DEMOS="OFF" -DDXSDK_DIR="/usr/${_arch}/" ..
    make
  done
}

package() {
  for _arch in ${_architectures}; do
    cd ${srcdir}/OIS-*/build-static-${_arch}
    make DESTDIR=${pkgdir} install
  done

  for _arch in ${_architectures}; do
    cd ${srcdir}/OIS-*/build-${_arch}
    make DESTDIR=${pkgdir} install

    ${_arch}-strip -x -g "${pkgdir}/usr/${_arch}/bin/"*.dll
    ${_arch}-strip -g "${pkgdir}/usr/${_arch}/lib/"*.a
  done
}
