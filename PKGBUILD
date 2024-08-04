# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>
# Contributor: Josef Miegl <josef@miegl.cz>

pkgname=osmo-trx-git
pkgver=1.7.0.r0.g4f6e9eb4
pkgrel=1
pkgdesc="GSM Radio Modem based on a fork of the OpenBTS Transceiver program"
url="https://osmocom.org/projects/osmotrx"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
license=('AGPL-3.0-only')
depends=('libosmocore-git'
         'libusb'
         'libuhd' # --with-uhd
         'limesuite' # --with-lms
         'talloc'
         'fftw')
makedepends=('git' 'boost')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver}")
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

check() {
  cd "${pkgname%-git}"
  make check
}

package() {
  cd "${pkgname%-git}"
  make DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et:
