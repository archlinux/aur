# Maintainer: Sorah Fukumori <sorah@cookpad.com>
pkgname="pigpio"
pkgver=71
pkgrel=1
pkgdesc="A C library for controlling GPIOs on a Raspberry Pi"
url="http://abyz.me.uk/rpi/pigpio/"
license=('custom:UNLICENSE')
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
depends=()
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/joan2937/pigpio/archive/V${pkgver}.tar.gz")
sha256sums=('41698abdbc95b60a4f4dbcc2fe2a6e88f2bca4dc78d0c0b55a3a932fa95a9249')
provides=('pigpio')
conflicts=('python-pigpio')


prepare() {
  cd "${pkgname}-${pkgver}"
  sed -e '/which python/d' -i Makefile
  sed -e '/\/opt/d' -i Makefile
  sed -e 's|\$(prefix)/man|\$(prefix)/share/man|' -i Makefile
  sed -e 's|/usr/bin/pigpiod|/usr/bin/pigpiod -g|' -i util/pigpiod.service
}

build() {
  cd "${pkgname}-${pkgver}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make prefix=/usr DESTDIR="${pkgdir}" install
  install -Dm644 util/pigpiod.service -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm644 UNLICENCE -t "${pkgdir}/usr/share/licenses/$pkgname"
}
