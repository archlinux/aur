# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>

pkgname=osmo-cbc-git
pkgver=0.4.1.r6.g66221e6
pkgrel=1
pkgdesc="Osmocom Cell Broadcast Centre"
arch=('x86_64' 'i686')
url="https://osmocom.org/projects/osmo-cbc"
license=('GPL')
depends=('libosmocore'
         'libosmo-netif'
         'lksctp-tools'
         'talloc'
         'jansson'
         'orcania'
         'ulfius')
optdepends=('python: for osmo-cbc-apitool.py'
            'python-requests: for osmo-cbc-apitool.py')
makedepends=('git')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver}")
backup=("etc/osmocom/${pkgname%-git}.cfg")
source=("git+https://gitea.osmocom.org/cellular-infrastructure/osmo-cbc.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/${pkgname%-git}"
  autoreconf -i
  ./configure --prefix=/usr \
              --exec-prefix=/usr \
              --bindir=/usr/bin \
              --sbindir=/usr/bin \
              --datadir=/usr/share \
              --libexecdir=/usr/lib \
              --sysconfdir=/etc \
              --localstatedir=/var \
              --libdir=/usr/lib/
  make
}

package() {
  cd "$srcdir/${pkgname%-git}"
  make DESTDIR=$pkgdir install

  install -m 755 contrib/cbc-apitool.py "${pkgdir}/usr/bin/osmo-cbc-apitool.py"
}
