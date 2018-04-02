# Maintainer: Fredy García <frealgagu at gmail dot com>
# Maintainer: Daniel Strobl <danielstrobl:gmail>

pkgname=welle.io-git
pkgver=1.0.r13.9268e6d
pkgrel=1
pkgdesc="An open source DAB and DAB+ software defined radio (SDR) with support for rtl-sdr (RTL2832U) and airspy"
arch=("x86_64")
url="https://www.${pkgname%-git}"
license=("GPL2")
depends=("faad2" "fftw" "qt5-charts" "qt5-declarative" "qt5-multimedia" "rtl-sdr")
optdepends=("airspy" "qt5-quickcontrols2")
makedepends=("gcc" "cmake" "git")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git://github.com/AlbrechtL/${pkgname%-git}")
sha256sums=("SKIP")

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g' | tr -d V
}

build() {
  mkdir -p "${pkgname%-git}/build"
  cd "${pkgname%-git}/build"
  cmake .. -DRTLSDR=1
  make
}

package() {
  msg2 "Installing desktop file into /usr/share/applications/"
  install -D -m 0644 "${srcdir}/${pkgname%-git}/${pkgname/%.io-git/-io}.desktop" "${pkgdir}/usr/share/applications/${pkgname/%.io-soapysdr-git/-io}.desktop"
  
  msg2 "Installing icon into /usr/share/pixmaps/"
  install -D -m 0644 "${srcdir}/${pkgname%-git}/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname/%.io-soapysdr-git/-io}.png"
  
  msg2 "Installing application"
  cd "${pkgname%-git}/build"
  make DESTDIR=${pkgdir} install
  
  msg2 "Moving from /usr/local/bin to /usr/bin to match Arch packaging standards"
  mv "${pkgdir}/usr/local/"* "${pkgdir}/usr/"
  rm -r "${pkgdir}/usr/local"
}
