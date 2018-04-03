# Maintainer: Fredy García <frealgagu at gmail dot com>

pkgname=welle.io-soapysdr-git
pkgver=1.0.r13.9268e6d
pkgrel=1
pkgdesc="An open source DAB and DAB+ software defined radio (SDR) with support for rtl-sdr (RTL2832U) and airspy (including SoapySDR)"
arch=("x86_64")
url="https://www.${pkgname%-soapysdr-git}"
license=("GPL2")
depends=("faad2" "fftw" "qt5-charts" "qt5-declarative" "qt5-multimedia" "rtl-sdr" "soapysdr-git")
optdepends=("airspy" "qt5-quickcontrols2" "soapyairspy-git" "soapybladerf-git" "soapyhackrf-git" "soapylms7-git" "soapyosmo-git" "soapyplutosdr-git" "soapyrtlsdr-git" "soapysdrplay-git")
makedepends=("gcc" "cmake")
provides=("${pkgname%-soapysdr-git}")
conflicts=("${pkgname%-soapysdr-git}")
source=("${pkgname%-soapysdr-git}::git+https://github.com/AlbrechtL/${pkgname%-soapysdr-git}")
sha256sums=("SKIP")

pkgver() {
  cd "${pkgname%-soapysdr-git}"
  (
    set -o pipefail
    git describe --long --tags 2> /dev/null | sed "s/^[a-Z\.\-]*//;s/\([^-]*-\)g/r\1/;s/-/./g" || 
    printf "r%s.%s\n" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" 
  )
}

build() {
  mkdir -p "${pkgname%-soapysdr-git}/build"
  cd "${pkgname%-soapysdr-git}/build"
  cmake .. -DRTLSDR=1 -DSOAPYSDR=1
  make
}

package() {
  msg2 "Installing desktop file into /usr/share/applications/"
  install -D -m 0644 "${srcdir}/${pkgname%-soapysdr-git}/${pkgname/%.io-soapysdr-git/-io}.desktop" "${pkgdir}/usr/share/applications/${pkgname/%.io-soapysdr-git/-io}.desktop"
  
  msg2 "Installing icon into /usr/share/pixmaps/"
  install -D -m 0644 "${srcdir}/${pkgname%-soapysdr-git}/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname/%.io-soapysdr-git/-io}.png"
  
  msg2 "Installing application"
  cd "${pkgname%-soapysdr-git}/build"
  make DESTDIR=${pkgdir} install
  
  msg2 "Moving from /usr/local/bin to /usr/bin to match Arch packaging standards"
  mv "${pkgdir}/usr/local/"* "${pkgdir}/usr/"
  rm -r "${pkgdir}/usr/local"
}
