# Maintainer: Karl-Felix Glatzer <karl.glatzer@gmx.de>

pkgname=mingw-w64-unshield
pkgver=1.3
pkgrel=1
pkgdesc="Extracts CAB files from InstallShield installers (mingw-w64)"
arch=('any')
url="https://github.com/twogood/unshield"
license=('custom')
depends=('mingw-w64-crt' 'mingw-w64-zlib' 'mingw-w64-openssl')
makedepends=('mingw-w64-gcc' 'mingw-w64-cmake')
options=('!buildflags' '!strip' '!libtool' 'staticlibs')
source=("unshield-$pkgver.tar.gz::https://github.com/twogood/unshield/archive/$pkgver.tar.gz")
md5sums=('13b716e0a3f45fe74ca24c6aaf4e5bb0')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  for _arch in ${_architectures}; do
    mkdir -p ${srcdir}/build-${_arch} && cd ${srcdir}/build-${_arch}

    ${_arch}-cmake \
      ${srcdir}/unshield-${pkgver}
    make
  done
}

package() {
  for _arch in ${_architectures}; do
    cd ${srcdir}/build-${_arch}
    make DESTDIR=${pkgdir} install
    ${_arch}-strip -x -g ${pkgdir}/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g ${pkgdir}/usr/${_arch}/lib/*.a
    rm "${pkgdir}"/usr/${_arch}/bin/*.exe
    rm -r "${pkgdir}"/usr/${_arch}/share
  done
}
