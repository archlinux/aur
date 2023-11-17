# Maintainer: Dan Elkouby <streetwalkermc@gmail.com>
# Maintainer: Aerion <Aerion (emile [at] aerion [dot] co [dot] uk>

_pkgname=carps-cups
pkgname=${_pkgname}-git
pkgver=r158.18d80d1
pkgrel=2
pkgdesc="CUPS driver for Canon CARPS printers"
arch=('x86_64')
url="https://github.com/ondrej-zary/carps-cups"
license=('GPL')
depends=('libcups')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=('git+https://github.com/ondrej-zary/carps-cups.git')
md5sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build () {
  cd "${_pkgname}"
  make CFLAGS+="$LDFLAGS"
}

package() {
  # install CARPS drivers
  cd "${_pkgname}"
  install -d "${pkgdir}/usr/lib/cups/filter"
  install -s rastertocarps "${pkgdir}/usr/lib/cups/filter/rastertocarps"
  install -D -m 644 carps.drv "${pkgdir}/usr/share/cups/drv/carps.drv"

  # install CARPS PPDs
  cd "$srcdir/$_pkgname/ppd"
  find . -type f -exec install -D -m 644 {,${pkgdir}/usr/share/cups/model/CARPS/}{} \;
}

