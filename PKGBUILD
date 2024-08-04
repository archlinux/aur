# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>
# Contributor: Josef Miegl <josef@miegl.cz>

pkgname=osmo-bts-git
pkgver=1.8.0.r1.g9512355eb
pkgrel=1
pkgdesc="Osmocom's GSM BTS (Base Transceiver Station) with A-bis/IP interface"
url="https://osmocom.org/projects/osmobts"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
license=('GPL-2.0-or-later AND AGPL-3.0-or-later')
depends=('libosmocore-git' 'libosmo-abis-git' 'libosmo-netif-git' 'talloc' 'ortp')
makedepends=('git')
provides=("${pkgname%-git}=${pkgver}")
conflicts=("${pkgname%-git}")
backup=('etc/osmocom/osmo-bts-trx.cfg'
        'etc/osmocom/osmo-bts-virtual.cfg')
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
              --enable-trx
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
