pkgname=mingw-w64-tools
pkgver=6.0.0
pkgrel=1
pkgdesc="MinGW-w64 utilities"
arch=(i686 x86_64)
url="http://mingw-w64.sourceforge.net"
license=("GPL3" "LGPL2")
groups=(mingw-w64)
options=(!libtool !emptydirs)
validpgpkeys=('CAF5641F74F7DFBA88AE205693BDB53CD4EBC740')
source=(https://sourceforge.net/projects/mingw-w64/files/mingw-w64/mingw-w64-release/mingw-w64-v${pkgver}.tar.bz2{,.sig})
sha256sums=('805e11101e26d7897fce7d49cbb140d7bac15f3e085a91e0001e80b2adaf48f0'
            'SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}"
  mkdir -p "${srcdir}"/gendef-build && cd "${srcdir}"/gendef-build
  "${srcdir}"/mingw-w64-v${pkgver}/mingw-w64-tools/gendef/configure --prefix=/usr
  make
  mkdir -p "${srcdir}"/genidl-build && cd "${srcdir}"/genidl-build
  "${srcdir}"/mingw-w64-v${pkgver}/mingw-w64-tools/genidl/configure --prefix=/usr
  make
  mkdir -p "${srcdir}"/genlib-build && cd "${srcdir}"/genlib-build
  "${srcdir}"/mingw-w64-v${pkgver}/mingw-w64-tools/genlib/configure --prefix=/usr
  make
  mkdir -p "${srcdir}"/genpeimg-build && cd "${srcdir}"/genpeimg-build
  "${srcdir}"/mingw-w64-v${pkgver}/mingw-w64-tools/genpeimg/configure --prefix=/usr
  make
  for _arch in ${_architectures}; do
    mkdir -p "${srcdir}"/widl-${_arch}-build && cd "${srcdir}"/widl-${_arch}-build
    "${srcdir}"/mingw-w64-v${pkgver}/mingw-w64-tools/widl/configure --prefix=/usr --target=${_arch} \
      --program-prefix="${_arch}-"
    make
  done
}

package() {
  cd "${srcdir}/gendef-build"
  make DESTDIR="${pkgdir}" install
  cd ../genidl-build
  make DESTDIR="${pkgdir}" install
  cd ../genlib-build
  make DESTDIR="${pkgdir}" install
  cd ../genpeimg-build
  make DESTDIR="${pkgdir}" install
  for _arch in ${_architectures}; do
    cd ../widl-${_arch}-build
    make DESTDIR="${pkgdir}" install
  done
  install -Dm644 "${srcdir}/mingw-w64-v${pkgver}/mingw-w64-tools/gendef/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.gendef"
  install -m644 "${srcdir}/mingw-w64-v${pkgver}/mingw-w64-tools/genidl/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.genidl"
  install -m644 "${srcdir}/mingw-w64-v${pkgver}/mingw-w64-tools/genlib/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.genlib"
  install -m644 "${srcdir}/mingw-w64-v${pkgver}/mingw-w64-tools/genpeimg/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.genpeimg"
}
