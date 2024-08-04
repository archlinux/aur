# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>

pkgname=osmo-cbc-git
pkgver=0.5.0.r0.g637874e
pkgrel=1
pkgdesc="Osmocom Cell Broadcast Centre"
arch=('x86_64' 'i686')
url="https://osmocom.org/projects/osmo-cbc"
license=('AGPL-3.0-or-later AND MIT')
depends=('libosmocore-git'
         'libosmo-netif-git'
         'lksctp-tools'
         'talloc'
         'jansson'
         'orcania'
         'ulfius')
optdepends=('python: for osmo-cbc-apitool.py'
            'python-requests: for osmo-cbc-apitool.py')
makedepends=('git')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver}"
          'libosmo-sbcap.so=2-64')
backup=("etc/osmocom/osmo-cbc.cfg")
source=("git+https://gitea.osmocom.org/cellular-infrastructure/${pkgname%-git}.git"
        'LICENSE-MIT')
sha256sums=('SKIP'
            '323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f')

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

check() {
  cd "$srcdir/${pkgname%-git}"
  make check
}

package() {
  cd "$srcdir/${pkgname%-git}"
  make DESTDIR=$pkgdir install

  install -m 755 contrib/cbc-apitool.py "${pkgdir}/usr/bin/osmo-cbc-apitool.py"
  install -Dm644 "${srcdir}/LICENSE-MIT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
}

# vim:set ts=2 sw=2 et:
