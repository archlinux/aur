# Maintainer: Karl-Felix Glatzer <karl.glatzer@gmx.de>
# Contributor: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: scippio <scippio@berounet.cz>
pkgname=mingw-w64-ois
pkgver=1.6.0
pkgrel=1
pkgdesc="Object Oriented Input System (mingw-w64)"
arch=('any')
url="https://github.com/wgois/OIS"
license=('Zlib')
depends=('mingw-w64-crt')
options=(!strip !buildflags !libtool staticlibs !debug)
makedepends=('mingw-w64-gcc' 'mingw-w64-cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/wgois/OIS/archive/v${pkgver}.tar.gz"
        "dxsdk.patch"
        "cmake.patch")
sha512sums=('f9145d632d4cb0f23199be803aa0847d7d339c739e4a0c8f733e121c51a28e72254285416810271bf164b3447097a26ca55a05e1547b30078d19669c7e84445f'
            '63df579c9176ca6fa98a7d41d12caa730ed6289b34991cc3960711c90faf4709c50fd4432a5419e7241d542e96c8cc44c4bb5bf8f25dc5561f8f0b5a979552ed'
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
    export MSYSTEM_PREFIX="/usr/${_arch}/"
    ${_arch}-cmake -DOIS_BUILD_DEMOS="OFF" -DOIS_BUILD_SHARED_LIBS="OFF" ..
    make
  done

  for _arch in ${_architectures}; do
    cd ${srcdir}/OIS-*
    mkdir -p build-${_arch} && cd build-${_arch}
    export MSYSTEM_PREFIX="/usr/${_arch}/"
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

  install -Dm644 ../LICENSE.md "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
}
