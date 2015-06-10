# Maintainer: Karl-Felix Glatzer <karl.glatzer@gmx.de>

pkgname=mingw-w64-unshield
pkgver=1.1
pkgrel=1
pkgdesc="Extracts CAB files from InstallShield installers (mingw-w64)"
arch=('any')
url="https://github.com/twogood/unshield"
license=('custom')
depends=('mingw-w64-crt' 'mingw-w64-zlib')
makedepends=('mingw-w64-gcc')
options=('!strip' '!libtool' 'staticlibs')
source=("unshield-$pkgver.tar.gz::https://github.com/twogood/unshield/archive/$pkgver.tar.gz")
md5sums=('209d1b380bf54b25d9b1ee9b343d3090')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd unshield-${pkgver}

  sed -i 's|-Werror||g' configure.ac.in

  ./bootstrap
}

build() {
  for _arch in ${_architectures}; do
    mkdir -p ${srcdir}/build-${_arch} && cd ${srcdir}/build-${_arch}

    unset CFLAGS LDFLAGS
    ${srcdir}/unshield-${pkgver}/configure \
      --prefix=/usr/${_arch} \
      --host=${_arch} \
      --with-zlib=/usr/${_arch}
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
