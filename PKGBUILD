# Maintainer: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: ant32 <antreimer@gmail.com>

pkgname=mingw-w64-qcustomplot-qt5
pkgver=2.1.0
pkgrel=1
pkgdesc="Plotting library for Qt5 (mingw-w64)"
arch=('any')
url="http://www.qcustomplot.com"
license=('GPL')
makedepends=('mingw-w64-gcc')
depends=('mingw-w64-crt' 'mingw-w64-qt5-base')
options=('!strip' '!buildflags' 'staticlibs')
source=("https://www.qcustomplot.com/release/${pkgver}fixed/QCustomPlot-sharedlib.tar.gz"
        "https://www.qcustomplot.com/release/${pkgver}fixed/QCustomPlot-source.tar.gz")
md5sums=('5a401eb55eab6417f129529bff4d6a62'
         'ecb2d59b440a52c38c5c3425eb7afa05')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  unset LDFLAGS
  
  # fix path to source files
  sed -i 's|../../qcustomplot|../../qcustomplot-source/qcustomplot|g' \
    "${srcdir}/qcustomplot-sharedlib/sharedlib-compilation/sharedlib-compilation.pro"
  
  for _arch in ${_architectures}; do
    mkdir -p "${srcdir}/build-${_arch}"
    cd "${srcdir}/build-${_arch}"

    ${_arch}-qmake-qt5 "${srcdir}/qcustomplot-sharedlib/sharedlib-compilation/sharedlib-compilation.pro"
    make release
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/build-${_arch}/release"
    mkdir -p "${pkgdir}/usr/${_arch}/"{bin,lib,include}
    cp qcustomplot2.dll "$pkgdir/usr/${_arch}/bin"
    cp libqcustomplot2.dll.a "${pkgdir}/usr/${_arch}/lib/"
    cp "${srcdir}/qcustomplot-source/qcustomplot.h" "${pkgdir}/usr/${_arch}/include"
    ${_arch}-strip --strip-unneeded "${pkgdir}/usr/${_arch}/bin/"*.dll
    ${_arch}-strip --strip-unneeded "${pkgdir}/usr/${_arch}/lib/"*.a
  done
}
