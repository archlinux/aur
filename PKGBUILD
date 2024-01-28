# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>
# Contributor: Josef Miegl <josef@miegl.cz>

pkgname=osmo-sgsn-git
pkgver=1.11.1.r2.gf2545b1b8
pkgrel=1
pkgdesc="Osmocom's  Serving GPRS Support Node for 2G and 3G packet-switched mobile networks"
url="https://osmocom.org/projects/osmosgsn"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
license=(GPL)
depends=('libosmocore'
         'libosmoabis.so' # from libosmo-abis
         'libosmonetif.so' # from libosmo-netif
         'libosmo-sigtran.so' # from libosmo-sccp
         'libosmo-gsup-client.so' # from osmo-hlr
         'libosmo-ranap.so' # from osmo-iuh
         'libasn1c.so' # from libasn1c
         'libgtp.so' # from osmo-ggsn
         'talloc'
         'c-ares')
makedepends=('git')
conflicts=("${pkgname%-git}")
backup=('etc/osmocom/osmo-sgsn.cfg'
        'etc/osmocom/osmo-gtphub.cfg')
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
              --enable-iu
  make
}

package() {
  cd "${pkgname%-git}"
  make DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et:
