# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>

pkgname=osmo-cbc-git
pkgver=0.4.2.r3.gda8b98c
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
provides=('libosmo-sbcap.so=0-64')
backup=("etc/osmocom/osmo-cbc.cfg")
source=("git+https://gitea.osmocom.org/cellular-infrastructure/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/${pkgname%-git}"
  autoreconf -f -i
}

build() {
  cd "$srcdir/${pkgname%-git}"
  ./configure --prefix=/usr \
              --exec-prefix=/usr \
              --bindir=/usr/bin \
              --sbindir=/usr/bin \
              --datadir=/usr/share \
              --libexecdir=/usr/lib \
              --sysconfdir=/etc \
              --localstatedir=/var \
              --libdir=/usr/lib
  make
}

package() {
  cd "$srcdir/${pkgname%-git}"
  make DESTDIR=$pkgdir install

  install -m 755 contrib/cbc-apitool.py "${pkgdir}/usr/bin/osmo-cbc-apitool.py"
}

# vim:set ts=2 sw=2 et:
