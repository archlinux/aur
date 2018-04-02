# Maintainer: Fredy García <frealgagu at gmail dot com>

pkgname=welle.io
pkgver=1.0
pkgrel=3
pkgdesc="An open source DAB and DAB+ software defined radio (SDR) with support for rtl-sdr (RTL2832U) and airspy"
arch=("x86_64")
url="https://www.${pkgname}"
license=("GPL2")
depends=("faad2" "fftw" "qt5-charts" "qt5-declarative" "qt5-multimedia" "rtl-sdr")
optdepends=("airspy" "qt5-quickcontrols2")
makedepends=("gcc" "cmake")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/AlbrechtL/${pkgname}/archive/V${pkgver}.tar.gz")
sha256sums=("669ae5d471f723c32622cbf6ee37b66c3aefd8e02d6334b55d1fb60b3c22a883")

build() {
  mkdir -p "${pkgname}-${pkgver}/build"
  cd "${pkgname}-${pkgver}/build"
  cmake .. -DRTLSDR=1
  make
}

package() {
  msg2 "Installing desktop file into /usr/share/applications/"
  install -D -m 0644 "${srcdir}/${pkgname}-${pkgver}/${pkgname/./-}.desktop" "${pkgdir}/usr/share/applications/${pkgname/./-}.desktop"
  
  msg2 "Installing icon into /usr/share/pixmaps/"
  install -D -m 0644 "${srcdir}/${pkgname}-${pkgver}/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname/./-}.png"
  
  msg2 "Installing application"
  cd "${pkgname}-${pkgver}/build"
  make DESTDIR=${pkgdir} install
  
  msg2 "Moving from /usr/local/bin to /usr/bin to match Arch packaging standards"
  mv "${pkgdir}/usr/local/"* "${pkgdir}/usr/"
  rm -r "${pkgdir}/usr/local"
}
