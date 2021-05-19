# Maintainer: Karl-Felix Glatzer <karl.glatzer@gmx.de>
pkgname=mingw-w64-ois
pkgver=1.5.1
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
	"cmake.patch")
sha512sums=('20598aef999a70900cb7f75ffaf62059acf8e811822971cb21986b5d25d28dacb79e4b4cf4770c70e00d3c55cdd01ef3e68a77c2dd148677784fc4df38891340'
            '216fc356ee90926a6e7633e44f486e43bd16ac9467f2987f45461d89f24f8c58ef583e567faa605d2277b2b45e5116f5229c793217d13ff4c3d52620527f3f96'
	    '057f65d3ea564daf5661f91c323554ed356830242ce0597eaa562b229fb70be983ba4443003eec9164da3ed7a4a17ecdf312da4e54e78fb93474562db86e1531')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd ${srcdir}/OIS-*

  patch -Np1 < ${srcdir}/dxsdk.patch
  patch -Np1 < ${srcdir}/cmake.patch
}

build() {

  for _arch in ${_architectures}; do
    cd ${srcdir}/OIS-*
    mkdir -p build-static-${_arch} && cd build-static-${_arch}
    export DXSDK_DIR="/usr/${_arch}/"
    ${_arch}-cmake -DOIS_BUILD_DEMOS="OFF" -DOIS_BUILD_SHARED_LIBS="OFF" ..
    make
  done

  for _arch in ${_architectures}; do
    cd ${srcdir}/OIS-*
    mkdir -p build-${_arch} && cd build-${_arch}
    export DXSDK_DIR="/usr/${_arch}/"
    ${_arch}-cmake -DOIS_BUILD_DEMOS="OFF" ..
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
