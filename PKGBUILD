# Maintainer: Karl-Felix Glatzer <karl.glatzer@gmx.de>
pkgname=mingw-w64-ois
pkgver=1.4
pkgrel=1
pkgdesc="Object Oriented Input System (mingw-w64)"
arch=('any')
url="http://sourceforge.net/projects/wgois"
license=('custom:zlib/libpng')
depends=('mingw-w64-crt')
options=(!strip !buildflags !libtool staticlibs)
makedepends=('mingw-w64-gcc' 'mingw-w64-cmake')
source=("https://github.com/ogre3d/OIS/archive/3b4c2d6ceaa14f38a371b92de61d2603d2522b71.zip"
        "dxsdk.patch"
        "cmake.patch")
sha512sums=('b1c69f3f2a5be22adc88a886f97dc27501e80b96de377ca588662fc03206deb6f885895f618db6e99541cbb97a564afeb84c5ee97709873eaf060c0062d1240b'
            '0fdf8ad0daacf994646a574d6ec51bce43bb8712955fd3a601f9bb9faf62374e82b4f9e608a89792183a0aa68e457ea1a382be45a37c43390d0ab995d8544fac'
            '4709504c7f7cbf420b1b2d7eb2f06300007614de1d8ecd02ba5ec497d07e42af5697c431f78f63c465a35ddc8491e4e964cbd69302c379a82845214b6feced37')
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
    ${_arch}-cmake -DBUILD_SHARED_LIBS="OFF" -DDXSDK_DIR="/usr/${_arch}/" ..
    make
  done

  for _arch in ${_architectures}; do
    cd ${srcdir}/OIS-*
    mkdir -p build-${_arch} && cd build-${_arch}
    ${_arch}-cmake -DDXSDK_DIR="/usr/${_arch}/" ..
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
