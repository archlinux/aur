# Maintainer: Fredy García <frealgagu at gmail dot com>
# Contributor: Daniel Strobl <danielstrobl:gmail>

pkgname=welle.io-git
pkgver=2.0.beta1.r0.f00230c
pkgrel=1
pkgdesc="An open source DAB and DAB+ software defined radio (SDR) with support for rtl-sdr (RTL2832U) and airspy"
arch=("x86_64")
url="https://www.${pkgname%-git}"
license=("GPL2")
depends=("faad2" "fftw" "hicolor-icon-theme" "lame" "mpg123" "qt5-charts" "qt5-quickcontrols" "qt5-quickcontrols2" "qt5-multimedia" "rtl-sdr")
optdepends=("airspy")
makedepends=("cmake" "gcc" "git")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/AlbrechtL/${pkgname%-git}")
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
  cd "${srcdir}/${pkgname%-git}/build"
  cmake "${srcdir}/${pkgname%-git}" -DRTLSDR=1
  make
}

package() {
  cd "${srcdir}/${pkgname%-git}/build"
  make DESTDIR=${pkgdir} install

  mv "${pkgdir}/usr/local/"* "${pkgdir}/usr/"
  rm -r "${pkgdir}/usr/local"
}
