# Maintainer: Karl-Felix Glatzer <karl.glatzer@gmx.de>

pkgname=mingw-w64-unshield
pkgver=1.6.2
pkgrel=1
pkgdesc="Extracts CAB files from InstallShield installers (mingw-w64)"
arch=('any')
url="https://github.com/twogood/unshield"
license=('custom')
depends=('mingw-w64-crt' 'mingw-w64-zlib' 'mingw-w64-openssl')
makedepends=('mingw-w64-gcc' 'mingw-w64-cmake')
options=('!buildflags' '!strip' '!libtool' 'staticlibs' '!debug')
source=("unshield-$pkgver.tar.gz::https://github.com/twogood/unshield/archive/$pkgver.tar.gz"
        "mingw.patch")
sha256sums=('a937ef596ad94d16e7ed2c8553ad7be305798dcdcfd65ae60210b1e54ab51a2f'
            '30105fa4629c7fc9e9c5313d93b8ec182b91f3e996942c360cef8159634dea7f')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "$srcdir/unshield-${pkgver}"
  patch -Np1 -i "$srcdir/mingw.patch"
}

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
