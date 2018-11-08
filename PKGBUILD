# Maintainer: Fredy García <frealgagu at gmail dot com>
# Maintainer: Daniel Strobl <danielstrobl:gmail>

pkgname=welle.io-git
pkgver=1.0.r21.0141eb1
pkgrel=1
pkgdesc="An open source DAB and DAB+ software defined radio (SDR) with support for rtl-sdr (RTL2832U) and airspy"
arch=("x86_64")
url="https://www.${pkgname%-git}"
license=("GPL2")
depends=("faad2" "fftw" "qt5-charts" "qt5-multimedia" "qt5-quickcontrols" "qt5-quickcontrols2" "rtl-sdr")
optdepends=("airspy")
makedepends=("gcc" "cmake" "git")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git://github.com/AlbrechtL/${pkgname%-git}")
sha256sums=("SKIP")

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  (
    set -o pipefail
    git describe --long --tags 2> /dev/null | sed "s/^[A-Za-z\.\-]*//;s/\([^-]*-\)g/r\1/;s/-/./g" || 
    printf "r%s.%s\n" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" 
  )
}

build() {
  mkdir -p "${srcdir}/${pkgname%-git}/build"
  cd "${pkgname%-git}/build"
  cmake .. -DRTLSDR=1
  make
}

package() {
  install -D -m 0644 "${srcdir}/${pkgname%-git}/${pkgname/%.io-git/-io}.desktop" "${pkgdir}/usr/share/applications/${pkgname/%.io-soapysdr-git/-io}.desktop"

  install -D -m 0644 "${srcdir}/${pkgname%-git}/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname/%.io-soapysdr-git/-io}.png"

  cd "${srcdir}/${pkgname%-git}/build"
  make DESTDIR=${pkgdir} install

  mv "${pkgdir}/usr/local/"* "${pkgdir}/usr/"
  rm -r "${pkgdir}/usr/local"
}
