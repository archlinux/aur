# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>

pkgname=osmo-cbc
pkgver=0.5.0
pkgrel=1
pkgdesc="Osmocom Cell Broadcast Centre"
arch=('x86_64' 'i686')
url="https://osmocom.org/projects/osmo-cbc"
license=('AGPL-3.0-or-later AND MIT')
depends=('libosmocore'
         'libosmo-netif'
         'lksctp-tools'
         'talloc'
         'jansson'
         'orcania'
         'ulfius')
optdepends=('python: for osmo-cbc-apitool.py'
            'python-requests: for osmo-cbc-apitool.py')
conflicts=("${pkgname}-git")
provides=('libosmo-sbcap.so=2-64')
backup=('etc/osmocom/osmo-cbc.cfg')
source=("https://downloads.osmocom.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.bz2"
        'LICENSE-MIT')
sha256sums=('a5278515dab7053d77eac2a4b9b8c2b7f3e4892fb26a628e830bc84acac61713'
            '323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
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
  cd "${srcdir}/${pkgname}-${pkgver}"
  make check
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR=$pkgdir install

  install -m 755 contrib/cbc-apitool.py "${pkgdir}/usr/bin/osmo-cbc-apitool.py"
  install -Dm644 "${srcdir}/LICENSE-MIT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
}

# vim:set ts=2 sw=2 et:
