# Maintainer: Fabien LEFEBVRE <contact@d1ceward.com>

pkgname=goaccess-systemd
_pkgname="${pkgname%-systemd}"
pkgver=1.5.1
pkgrel=6
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
backup=('etc/goaccess/goaccess.conf'
        'etc/goaccess/browsers.list'
        'etc/goaccess/podcast.list')
source=("https://tar.goaccess.io/${_pkgname}-$pkgver.tar.gz"
        "${_pkgname}.install"
        "${_pkgname}.service")
sha512sums=('aefdc8a61d85d7f8148857c6873b4589eb2f1d3f5b4986a97d0d4223c1d30da23d5fc8e6ba3cbdf41654072b299036fbcbae397d1934a95d1d26931e7f2f5d9a'
            '4744271c513d08d897ce3d163959fa7e3846da82c734de6624fd1efc9aac996b4ec75992e8a92afb908d7ea9d82e47d0f8be6275a655af8fc66e94e5341df39d'
            'bc26bd964b9c07dd3aa5b646af48912a7670a004d2b008ba005c6fd6af399283b31704007ef8ef231c6f133ac6b41f854823276f922f73b9f577e57d04a28cc3')
conflicts=("${_pkgname}"
           "${_pkgname}-git")
provides=("${_pkgname}")

build() {
  cd $_pkgname-$pkgver
  ./configure --enable-geoip=mmdb --enable-utf8 --with-openssl
  make prefix=/usr sysconfdir=/etc
}

package() {
  install -Dm644 "${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"

  cd $_pkgname-$pkgver
  make prefix="$pkgdir/usr" sysconfdir="$pkgdir/etc" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${_pkgname}/COPYING"
}
