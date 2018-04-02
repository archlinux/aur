# Maintainer: Fredy García <frealgagu at gmail dot com>

pkgname=welle.io-soapysdr
pkgver=1.0
pkgrel=3
pkgdesc="An open source DAB and DAB+ software defined radio (SDR) with support for rtl-sdr (RTL2832U) and airspy (including SoapySDR)"
arch=("x86_64")
url="https://www.${pkgname%-soapysdr}"
license=("GPL2")
depends=("faad2" "fftw" "qt5-charts" "qt5-declarative" "qt5-multimedia" "rtl-sdr" "soapysdr-git")
optdepends=("airspy" "qt5-quickcontrols2" "soapyairspy-git" "soapybladerf-git" "soapyhackrf-git" "soapylms7-git" "soapyosmo-git" "soapyplutosdr-git" "soapyrtlsdr-git" "soapysdrplay-git")
makedepends=("gcc" "cmake")
provides=("${pkgname%-soapysdr}")
conflicts=("${pkgname%-soapysdr}")
source=("${pkgname%-soapysdr}-${pkgver}.tar.gz::https://github.com/AlbrechtL/${pkgname%-soapysdr}/archive/V${pkgver}.tar.gz")
sha256sums=("669ae5d471f723c32622cbf6ee37b66c3aefd8e02d6334b55d1fb60b3c22a883")

build() {
  mkdir -p "${pkgname%-soapysdr}-${pkgver}/build"
  cd "${pkgname%-soapysdr}-${pkgver}/build"
  cmake .. -DRTLSDR=1 -DSOAPYSDR=1
  make
}

package() {
  msg2 "Installing desktop file into /usr/share/applications/"
  install -D -m 0644 "${srcdir}/${pkgname%-soapysdr}-${pkgver}/${pkgname/%.io-soapysdr/-io}.desktop" "${pkgdir}/usr/share/applications/${pkgname/%.io-soapysdr/-io}.desktop"
  
  msg2 "Installing icon into /usr/share/pixmaps/"
  install -D -m 0644 "${srcdir}/${pkgname%-soapysdr}-${pkgver}/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname/%.io-soapysdr/-io}.png"
  
  msg2 "Installing application"
  cd "${pkgname%-soapysdr}-${pkgver}/build"
  make DESTDIR=${pkgdir} install
  
  msg2 "Moving from /usr/local/bin to /usr/bin to match Arch packaging standards"
  mv "${pkgdir}/usr/local/"* "${pkgdir}/usr/"
  rm -r "${pkgdir}/usr/local"
}
