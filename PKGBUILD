# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname='pigpio'
pkgver=78
pkgrel=2
pkgdesc="A C and Python library and system service for controlling GPIOs on a Raspberry Pi"
url="http://abyz.me.uk/rpi/pigpio/"
license=('custom:UNLICENSE')
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
depends=('python')
provides=("python-${pkgname}")
conflicts=("python-${pkgname}")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/joan2937/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('ef4a4dc7ca8ca2f97fbdb9fd75586f61be7222d0f6c14e58af6c9192ad42f682')


prepare() {
  cd "${pkgname}-${pkgver}"
  sed -e 's/ -lrt//' -i Makefile
  sed -e 's/-Wl/\$(LDFLAGS)/' -i Makefile
  sed -e 's/\$(CC) -o/\$(CC) $(LDFLAGS) -o/' -i Makefile
  sed -e '/which python2/d' -i Makefile
  sed -e '/\/opt/d' -i Makefile
  sed -e 's|\$(prefix)/man|\$(prefix)/share/man|' -i Makefile
  sed -e 's|/usr/bin/pigpiod|/usr/bin/pigpiod -k|' -i util/pigpiod.service
}

build() {
  cd "${pkgname}-${pkgver}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make prefix=/usr DESTDIR="${pkgdir}" install
  install -Dm644 util/pigpiod.service -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm644 UNLICENCE -t "${pkgdir}/usr/share/licenses//${pkgname}"
}
