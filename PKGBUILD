pkgname=mingw-w64-tools
pkgver=8.0.0
pkgrel=1
pkgdesc="MinGW-w64 utilities"
arch=(i686 x86_64)
url="http://mingw-w64.sourceforge.net"
license=("GPL3" "LGPL2")
groups=(mingw-w64)
options=(!libtool !emptydirs)
validpgpkeys=('CAF5641F74F7DFBA88AE205693BDB53CD4EBC740')
source=(https://sourceforge.net/projects/mingw-w64/files/mingw-w64/mingw-w64-release/mingw-w64-v${pkgver}.tar.bz2{,.sig})
sha256sums=('44c740ea6ab3924bc3aa169bad11ad3c5766c5c8459e3126d44eabb8735a5762'
            'SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}"
  for tool in gendef genidl genlib genpeimg; do
    mkdir -p "${srcdir}"/${tool}-build && cd "${srcdir}"/${tool}-build
    "${srcdir}"/mingw-w64-v${pkgver}/mingw-w64-tools/${tool}/configure --prefix=/usr
    make
  done
  for _arch in ${_architectures}; do
    mkdir -p "${srcdir}"/widl-${_arch}-build && cd "${srcdir}"/widl-${_arch}-build
    "${srcdir}"/mingw-w64-v${pkgver}/mingw-w64-tools/widl/configure --prefix=/usr --target=${_arch} \
      --program-prefix="${_arch}-"
    make
  done
}

package() {
  for tool in gendef genidl genlib genpeimg; do
    cd "${srcdir}/${tool}-build"
    make DESTDIR="${pkgdir}" install
  done
  for _arch in ${_architectures}; do
    cd "${srcdir}/widl-${_arch}-build"
    make DESTDIR="${pkgdir}" install
  done
  install -Dm644 "${srcdir}/mingw-w64-v${pkgver}/mingw-w64-tools/gendef/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.gendef"
  install -m644 "${srcdir}/mingw-w64-v${pkgver}/mingw-w64-tools/genidl/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.genidl"
  install -m644 "${srcdir}/mingw-w64-v${pkgver}/mingw-w64-tools/genlib/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.genlib"
  install -m644 "${srcdir}/mingw-w64-v${pkgver}/mingw-w64-tools/genpeimg/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.genpeimg"
}
