# Maintainer: Karl-Felix Glatzer <karl.glatzer@gmx.de>

pkgname=mingw-w64-unshield
pkgver=1.5.1
pkgrel=1
pkgdesc="Extracts CAB files from InstallShield installers (mingw-w64)"
arch=('any')
url="https://github.com/twogood/unshield"
license=('custom')
depends=('mingw-w64-crt' 'mingw-w64-zlib' 'mingw-w64-openssl')
makedepends=('mingw-w64-gcc' 'mingw-w64-cmake')
options=('!buildflags' '!strip' '!libtool' 'staticlibs')
source=("unshield-$pkgver.tar.gz::https://github.com/twogood/unshield/archive/$pkgver.tar.gz")
sha256sums=('34cd97ff1e6f764436d71676e3d6842dc7bd8e2dd5014068da5c560fe4661f60')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  for _arch in ${_architectures}; do
    mkdir -p ${srcdir}/build-${_arch} && cd ${srcdir}/build-${_arch}

    ${_arch}-cmake \
      ${srcdir}/unshield-${pkgver}
    make

    #static build
    mkdir -p ${srcdir}/build-static-${_arch} && cd ${srcdir}/build-static-${_arch}

    ${_arch}-cmake \
      ${srcdir}/unshield-${pkgver} \
      -DBUILD_STATIC="TRUE"
    make
  done
}

package() {
  for _arch in ${_architectures}; do
    cd ${srcdir}/build-${_arch}
    make DESTDIR=${pkgdir} install
    #static build
    cd ${srcdir}/build-static-${_arch}
    make DESTDIR=${pkgdir} install
    ${_arch}-strip -s "${pkgdir}"/usr/${_arch}/bin/*.exe
    ${_arch}-strip -x -g ${pkgdir}/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g ${pkgdir}/usr/${_arch}/lib/*.a
    rm -r "${pkgdir}"/usr/${_arch}/share
  done
}
