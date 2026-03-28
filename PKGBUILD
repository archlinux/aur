# Maintainer: Thermi <noel [at] familie-kuntze dot de>

_pkgname=ndppd
pkgname=ndppd
pkgver=0.2.6
pkgrel=1
pkgdesc="IPv6 NDP proxy daemon"
arch=('x86_64')
url='https://github.com/DanielAdolfsson/ndppd'
license=('GPL-3.0-or-later')
depends=('glibc' 'libgcc' 'libstdc++')
backup=('etc/ndppd.conf')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/DanielAdolfsson/ndppd/archive/${pkgver}.tar.gz")
sha256sums=('969d438462e0c65a8c9060d8d263c5c47ba8145fb9aaa663864bbad11ad7eb7a')

prepare() {
  cd "${_pkgname}-${pkgver}"

  sed -r \
    -e 's|/var/run|/run|g' \
    -e 's|/usr/sbin|/usr/bin|g' \
    -i ndppd.service
}

build() {
  cd "${_pkgname}-${pkgver}"

  make PREFIX=/usr all
}

package() {
  cd "${_pkgname}-${pkgver}"

  make PREFIX=/usr SBINDIR="${pkgdir}/usr/bin" DESTDIR="${pkgdir}" install
  install -D -m 644 "ndppd.service" -t "${pkgdir}/usr/lib/systemd/system"
  install -D -m 644 ndppd.conf-dist "${pkgdir}/etc/ndppd.conf"
}

