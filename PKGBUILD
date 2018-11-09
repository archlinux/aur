# Maintainer: Fredy García <frealgagu at gmail dot com>

pkgname=welle.io-soapysdr-git
pkgver=1.0.r21.0141eb1
pkgrel=1
pkgdesc="An open source DAB and DAB+ software defined radio (SDR) with support for rtl-sdr (RTL2832U) and airspy (including SoapySDR)"
arch=("x86_64")
url="https://www.${pkgname%-soapysdr-git}"
license=("GPL2")
depends=("faad2" "fftw" "qt5-charts" "qt5-multimedia" "qt5-quickcontrols" "qt5-quickcontrols2" "rtl-sdr" "soapysdr-git")
optdepends=("airspy" "soapyairspy-git" "soapybladerf-git" "soapyhackrf-git" "soapylms7-git" "soapyosmo-git" "soapyplutosdr-git" "soapyrtlsdr-git" "soapysdrplay-git")
makedepends=("cmake" "gcc" "git")
provides=("${pkgname%-soapysdr-git}")
conflicts=("${pkgname%-soapysdr-git}")
source=("${pkgname%-soapysdr-git}::git+https://github.com/AlbrechtL/${pkgname%-soapysdr-git}")
sha256sums=("SKIP")

pkgver() {
  cd "${srcdir}/${pkgname%-soapysdr-git}"
  (
    set -o pipefail
    git describe --long --tags 2> /dev/null | sed "s/^[A-Za-z\.\-]*//;s/\([^-]*-\)g/r\1/;s/-/./g" || 
    printf "r%s.%s\n" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" 
  )
}

build() {
  mkdir -p "${srcdir}/${pkgname%-soapysdr-git}/build"
  cd "${srcdir}/${pkgname%-soapysdr-git}/build"
  cmake .. -DRTLSDR=1 -DSOAPYSDR=1
  make
}

package() {
  install -D -m 0644 "${srcdir}/${pkgname%-soapysdr-git}/${pkgname/%.io-soapysdr-git/-io}.desktop" "${pkgdir}/usr/share/applications/${pkgname/%.io-soapysdr-git/-io}.desktop"

  install -D -m 0644 "${srcdir}/${pkgname%-soapysdr-git}/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname/%.io-soapysdr-git/-io}.png"

  cd "${srcdir}/${pkgname%-soapysdr-git}/build"
  make DESTDIR=${pkgdir} install

  mv "${pkgdir}/usr/local/"* "${pkgdir}/usr/"
  rm -r "${pkgdir}/usr/local"
}
