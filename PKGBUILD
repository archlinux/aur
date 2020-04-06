# Maintainer: Fredy García <frealgagu at gmail dot com>

pkgname=welle.io-soapysdr-git
pkgver=2.1.r0.8fc5739
pkgrel=1
pkgdesc="An open source DAB and DAB+ software defined radio (SDR) with support for rtl-sdr (RTL2832U) and airspy (including SoapySDR)"
arch=("x86_64")
url="https://www.${pkgname%-soapysdr-git}"
license=("GPL2")
depends=("faad2" "fftw" "hicolor-icon-theme" "lame" "mpg123" "qt5-charts" "qt5-graphicaleffects" "qt5-quickcontrols" "qt5-quickcontrols2" "qt5-multimedia" "rtl-sdr" "soapysdr")
optdepends=("airspy" "soapyairspy" "soapybladerf" "soapyhackrf" "soapyosmo" "soapyplutosdr" "soapyrtlsdr" "soapysdrplay")
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
  cmake "${srcdir}/${pkgname%-soapysdr-git}" -DRTLSDR=1 -DSOAPYSDR=1
  make
}

package() {
  cd "${srcdir}/${pkgname%-soapysdr-git}/build"
  make DESTDIR=${pkgdir} install

  mv "${pkgdir}/usr/local/"* "${pkgdir}/usr/"
  rm -r "${pkgdir}/usr/local"
}
