# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>
# Contributor: Josef Miegl <josef@miegl.cz>

pkgname=osmo-trx-git
pkgver=1.6.0.r9.ga118d98e
pkgrel=1
pkgdesc="GSM Radio Modem based on a fork of the OpenBTS Transceiver program"
url="https://osmocom.org/projects/osmotrx"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
license=(GPL)
depends=('libosmocore'
         'libusb'
         'libuhd' # --with-uhd
         'limesuite' # --with-lms
         'talloc'
         'fftw')
makedepends=('git' 'boost')
conflicts=("${pkgname%-git}")
backup=('etc/osmocom/osmo-trx-uhd.cfg'
        'etc/osmocom/osmo-trx-lms.cfg'
        'etc/osmocom/osmo-trx-ipc.cfg')
source=("git+https://gitea.osmocom.org/cellular-infrastructure/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"
  autoreconf -f -i
}

build() {
  cd "${pkgname%-git}"
  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --localstatedir=/var \
              --with-uhd \
              --with-lms \
              --with-ipc
              # --enable-mstrx
              # --with-bladerf
  make
}

package() {
  cd "${pkgname%-git}"
  make DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et:
