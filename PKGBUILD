# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>
# Contributor: Josef Miegl <josef@miegl.cz>

pkgname=osmo-bsc-git
pkgver=1.12.1.r22.g56fa819a9
pkgrel=1
pkgdesc="Osmocom's Base Station Controller for 2G circuit-switched mobile networks"
url="https://osmocom.org/projects/osmobsc"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
license=('GPL-3.0-or-later AND LGPL-2.1-only AND AGPL-3.0-or-later')
depends=('libosmocore-git'
         'libosmo-abis-git'
         'libosmo-netif-git'
         'libosmo-sigtran-git'
         'libosmo-mgcp-client.so' # from osmo-mgw
         'sqlite' # for osmo-meas-udp2db
         'libpcap' # for osmo-meas-pcap2db
         # TODO: 'libcdk' for --enable-meas-vis
         'talloc')
makedepends=('git')
provides=("${pkgname%-git}=${pkgver}")
conflicts=("${pkgname%-git}")
backup=('etc/osmocom/osmo-bsc.cfg')
source=("git+https://gitea.osmocom.org/cellular-infrastructure/${pkgname%-git}")
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
              --enable-meas-udp2db \
              --enable-meas-pcap2db
  make
}

package() {
  cd "${pkgname%-git}"
  make DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et:
