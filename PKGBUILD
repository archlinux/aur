# Maintainer: Fabien LEFEBVRE <contact@d1ceward.com>

pkgname=goaccess-systemd
pkgver=1.5.1
pkgrel=1
pkgdesc="An open source real-time web log analyzer and interactive viewer"
arch=('x86_64')
url='http://goaccess.io'
license=('MIT')
depends=(
  'ncurses'
  'libmaxminddb'
  'openssl'
)
optdepends=('geoip2-database: for geoip support')
backup=('etc/goaccess.conf')
source=("https://tar.goaccess.io/goaccess-$pkgver.tar.gz"
        'goaccess.service')
sha512sums=('aefdc8a61d85d7f8148857c6873b4589eb2f1d3f5b4986a97d0d4223c1d30da23d5fc8e6ba3cbdf41654072b299036fbcbae397d1934a95d1d26931e7f2f5d9a'
            '955de95a370a1af992a9a39e07cbbcf39527ed7d81c86b0b359e72524f92473ef060e6b4c86a49a04b1124d2fcc31e04a3aaf6596f86e8297b6aff741afd2243')
conflicts=('goaccess'
           'goaccess-git')

build() {
  cd "goaccess-$pkgver"
  ./configure --enable-geoip=mmdb --enable-utf8 --with-openssl
  make prefix=/usr sysconfdir=/etc
}

package() {
  install -Dm644 goaccess.service "${pkgdir}/usr/lib/systemd/system/goaccess.service"

  cd "goaccess-$pkgver"
  make prefix="$pkgdir/usr" sysconfdir="$pkgdir/etc" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/goaccess/LICENSE"
}
