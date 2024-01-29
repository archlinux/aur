# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>
# Contributor: Josef Miegl <josef@miegl.cz>

pkgname=osmo-bts
pkgver=1.7.2
pkgrel=2
pkgdesc="Osmocom's GSM BTS (Base Transceiver Station) with A-bis/IP interface"
url="https://osmocom.org/projects/osmobts"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
license=(GPL)
depends=('libosmocore' 'libosmo-abis' 'libosmo-netif' 'talloc' 'ortp')
conflicts=("${pkgname}-git")
backup=('etc/osmocom/osmo-bts-trx.cfg'
        'etc/osmocom/osmo-bts-virtual.cfg')
source=("https://downloads.osmocom.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.bz2"
        "https://cgit.osmocom.org/${pkgname}/plain/doc/examples/trx/osmo-bts-trx.cfg?h=${pkgver}"
        "https://cgit.osmocom.org/${pkgname}/plain/doc/examples/trx/osmo-bts-trx-calypso.cfg?h=${pkgver}")
sha256sums=('705b5b363aeaffe8cb844fa87242194795cb3747832e01e34355042e21870d5a'
            '27158ab5a99345023353ebcef532f1e057cc44e4e50253d6e2d77d8b002f50dc'
            'a64771593be92110fcafa5eadbf2b46123fb6077be1e4ff639808f04f9c983fe')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  # release tarballs (pkgver <= 1.7.2) are missing some config files
  # see https://osmocom.org/issues/6349
  mkdir -p doc/examples/trx
  cp "${srcdir}/osmo-bts-trx.cfg?h=${pkgver}" doc/examples/trx/osmo-bts-trx.cfg
  cp "${srcdir}/osmo-bts-trx-calypso.cfg?h=${pkgver}" doc/examples/trx/osmo-bts-trx-calypso.cfg
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --localstatedir=/var \
              --enable-trx
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et:
