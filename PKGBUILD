# Maintainer: Fabien LEFEBVRE <contact@d1ceward.com>

pkgname=goaccess-systemd
_pkgname="${pkgname%-systemd}"
pkgver=1.5.1
pkgrel=4
pkgdesc="An open source real-time web log analyzer and interactive viewer that runs in a terminal in *nix systems or through your browser."
arch=('any')
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
            'b488d1e375196e320e763be67cbe43d60232264578c000e9d7c1670becddd015b93ad4222c4b0235fd1540e8b8f028aae17f463044ff53a4f1f6efa4e6f9719d')
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

  echo "
    Before starting goaccess service, please configure your time/date/log formats in :
      /etc/goaccess/goaccess.conf
    And don't forget to limit the access of goaccess including the default port 7890 (see goaccess.conf file)
  "
}
