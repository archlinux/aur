# Maintainer: Andrew Sun <adsun701@gmail.com>

pkgname=mingw-w64-mpdecimal
pkgver=2.4.2
pkgrel=1
pkgdesc="Package for correctly-rounded arbitrary precision decimal floating point arithmetic (mingw-w64)"
arch=('any')
url="http://www.bytereef.org/mpdecimal/index.html"
license=('custom')
makedepends=('mingw-w64-configure')
depends=('mingw-w64-crt')
options=('!strip' '!buildflags' 'staticlibs')
md5sums=('aa63cab5d06a96855a44da2db90a29d9'
         'c9bc7fb46b559da9ce5cb31f405b5e22')
source=("http://www.bytereef.org/software/mpdecimal/releases/mpdecimal-${pkgver}.tar.gz"
        "msys2-mingw-fixes.patch")

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/mpdecimal-${pkgver}/"
  patch -Nbp1 -i "${srcdir}/msys2-mingw-fixes.patch"
  autoreconf -fiv
}

build() {
  cd "${srcdir}/mpdecimal-${pkgver}/"
  for _arch in ${_architectures}; do
    mkdir -p ${srcdir}/build-${_arch} && pushd ${srcdir}/build-${_arch}
    cp -rf "${srcdir}/mpdecimal-${pkgver}/." ${srcdir}/build-${_arch}
    last="${srcdir}/mpdecimal-${pkgver}/" ${_arch}-configure
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
