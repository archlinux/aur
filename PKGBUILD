# Maintainer: Fredy García <frealgagu at gmail dot com>

pkgname=welle.io-soapysdr-git
pkgver=latest
pkgrel=2
pkgdesc="Open source DAB and DAB+ software defined radio (SDR) with support for rtl-sdr (RTL2832U) and airspy (including SoapySDR)"
arch=("any")
url="https://www.${pkgname%-soapysdr-git}"
license=("GPL2")
depends=("faad2" "fftw" "libusb" "qt5-base" "qt5-charts" "qt5-declarative" "qt5-multimedia" "qt5-quickcontrols2" "rtl-sdr" "soapysdr-git")
makedepends=("gcc" "cmake")
optdepends=("airspy" "soapyairspy-git" "soapybladerf-git" "soapyhackrf-git" "soapylms7-git" "soapyosmo-git" "soapyplutosdr-git" "soapyrtlsdr-git" "soapysdrplay-git")
provides=("${pkgname%-soapysdr-git}")
conflicts=("${pkgname%-soapysdr-git}")
source=("git+https://github.com/AlbrechtL/${pkgname%-soapysdr-git}")
sha256sums=("SKIP")

pkgver() {
  cd "${pkgname%-soapysdr-git}"
  printf "%s-r%s.%s" $(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g') "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" && echo ""
}

build() {
  mkdir -p "${pkgname%-soapysdr-git}/build"
  cd "${pkgname%-soapysdr-git}/build"
  cmake .. -DRTLSDR=1 -DSOAPYSDR=1
  make
}

package() {
  install -D -m 0644 ${srcdir}/${pkgname%-soapysdr-git}/${pkgname/%.io-soapysdr-git/-io}.desktop ${pkgdir}/usr/share/applications/${pkgname/%.io-soapysdr-git/-io}.desktop
  install -D -m 0644 ${srcdir}/${pkgname%-soapysdr-git}/icon.png ${pkgdir}/usr/share/pixmaps/${pkgname/%.io-soapysdr-git/-io}.png
  cd ${pkgname%-soapysdr-git}/build
  make DESTDIR=${pkgdir} install
}
