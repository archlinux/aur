# Maintainer: Aerion <Aerion (emile [at] aerion [dot] co [dot] uk>

pkgname=carps-cups
pkgver=r149.778be89
pkgrel=1
pkgdesc="CUPS driver for Canon CARPS printers"
arch=('i686' 'x86_64')
url="https://github.com/ondrej-zary/carps-cups"
license=('GPL')
depends=('libcups')
makedepends=('git')
source=('git://github.com/ondrej-zary/carps-cups.git')
md5sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build () {
	cd "${pkgname}"
	make
}

package() {
	# install CARPS drivers
	cd "${pkgname}"
	install -d "${pkgdir}/usr/lib/cups/filter"
	install -s rastertocarps "${pkgdir}/usr/lib/cups/filter/rastertocarps"
	install -D -m 644 carps.drv "${pkgdir}/usr/share/cups/drv/carps.drv"

	# install CARPS PPDs
	cd "$srcdir/$pkgname/ppd"
	find . -type f -exec install -D -m 644 {,${pkgdir}/usr/share/cups/model/CARPS/}{} \;
}

