# Maintainer: w0rty <mawo97 at gmail.com>
# Contributor: Fredy García <frealgagu at gmail dot com>

pkgname=welle.io
pkgver=2.7 # renovate: datasource=github-releases depName=AlbrechtL/welle.io
pkgrel=1
pkgdesc="An open source DAB and DAB+ software defined radio (SDR) with support for rtl-sdr (RTL2832U) and airspy"
arch=("x86_64")
url="https://www.${pkgname}"
license=("GPL-2.0-only")
depends=("faad2" "fftw" "hicolor-icon-theme" "lame" "mpg123" "rtl-sdr" "soapysdr" "qt6-quick3d" "qt6-multimedia" "qt6-charts")
optdepends=("airspy")
makedepends=("cmake" "gcc" "xxd")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/AlbrechtL/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('191687c163a2dc69a49beef8d3fa1ba85114e7a046f6718290e54d4b163bdbaf')

build() {
  mkdir -p "${srcdir}/${pkgname}-${pkgver}/build"
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  sed -i 's/welle-io.desktop/io.welle.welle_io.desktop/' ../CMakeLists.txt
  sed -i 's/io.welle.welle_io.metainfo.xml/io.welle.welle_io.appdata.xml/' ../CMakeLists.txt
  cmake "${srcdir}/${pkgname}-${pkgver}" -DRTLSDR=1 -DSOAPYSDR=1
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make DESTDIR=${pkgdir} install

  mv "${pkgdir}/usr/local/"* "${pkgdir}/usr/"
  rm -r "${pkgdir}/usr/local"
}
