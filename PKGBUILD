# Maintainer: Fabien LEFEBVRE <contact@d1ceward.com>

pkgname=goaccess-systemd
_pkgname="${pkgname%-systemd}"
pkgver=1.5.1
pkgrel=2
pkgdesc="An open source real-time web log analyzer and interactive viewer that runs in a terminal in *nix systems or through your browser."
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
source=("https://tar.goaccess.io/${_pkgname}-$pkgver.tar.gz"
        'goaccess.service')
sha512sums=('aefdc8a61d85d7f8148857c6873b4589eb2f1d3f5b4986a97d0d4223c1d30da23d5fc8e6ba3cbdf41654072b299036fbcbae397d1934a95d1d26931e7f2f5d9a'
            '2c04e8d24d474dea82436c0cbc38542dab88a52146f98d034ad7ef0cd0dd39f71e7967c925d5d832d637a91c8f1409961e7d23a9537a44908d9ca835d71d29d3')
conflicts=("${_pkgname}"
           "${_pkgname}-git")
provides=("${_pkgname}")

build() {
  cd $_pkgname-$pkgver
  ./configure --enable-geoip=mmdb --enable-utf8 --with-openssl
  make prefix=/usr sysconfdir=/etc
}

package() {
  install -Dm644 goaccess.service "${pkgdir}/usr/lib/systemd/system/goaccess.service"

  cd $_pkgname-$pkgver
  make prefix="$pkgdir/usr" sysconfdir="$pkgdir/etc" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${_pkgname}/COPYING"
}
