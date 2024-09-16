# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>
# Contributor: Josef Miegl <josef@miegl.cz>

pkgname=osmo-msc-git
pkgver=1.12.1.r0.g00cb24d73
pkgrel=1
pkgdesc="Osmocom's Mobile Switching Center for 2G and 3G circuit-switched mobile networks"
url="https://osmocom.org/projects/osmomsc"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
license=('AGPL-3.0-or-later AND GPL-2.0-or-later')
depends=('libosmocore-git'
         'libosmo-abis-git'
         'libosmo-netif-git'
         'libosmo-sigtran-git'
         'libosmo-gsup-client.so' # from osmo-hlr
         'libosmo-mgcp-client.so' # from osmo-mgw
         'libosmo-ranap.so' # from osmo-iuh (for --enable-iu)
         'libasn1c.so' # (for --enable-iu)
         'libsmpp34.so' # (for --enable-smpp)
         'lksctp-tools'
         'sqlite'
         'talloc')
makedepends=('git')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver}")
backup=('etc/osmocom/osmo-msc.cfg')
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
              --enable-iu \
              --enable-smpp
  make
}

package() {
  cd "${pkgname%-git}"
  make DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et:
