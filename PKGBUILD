# Maintainer: Fabien LEFEBVRE <contact@d1ceward.com>

pkgname=goaccess-systemd
_pkgname="${pkgname%-systemd}"
pkgver=1.5.1
pkgrel=11
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
        "${_pkgname}.service"
        "${_pkgname}.timer")
sha512sums=('aefdc8a61d85d7f8148857c6873b4589eb2f1d3f5b4986a97d0d4223c1d30da23d5fc8e6ba3cbdf41654072b299036fbcbae397d1934a95d1d26931e7f2f5d9a'
            '4744271c513d08d897ce3d163959fa7e3846da82c734de6624fd1efc9aac996b4ec75992e8a92afb908d7ea9d82e47d0f8be6275a655af8fc66e94e5341df39d'
            'ba0c2e4644b3edc5b4d473c4ff3df7b6bcb8379e9f5eb5339cc3273cffe0d9feaede332fe183ad9636d81e7f5b7398059fc34280eb5d9c986117d9b894dd631e'
            '6ad2a04841736104277f7caab0dec1c4a0525dca523ac450c2bee9efc67f3f445ea004b01af1b9817063566d7410983a157f3c740cf4ff1954fd25f4026cf482')
conflicts=("${_pkgname}"
           "${_pkgname}-git")
provides=("${_pkgname}")
install="${_pkgname}.install"

build() {
  cd $_pkgname-$pkgver
  ./configure --enable-geoip=mmdb --enable-utf8 --with-openssl
  make prefix=/usr sysconfdir=/etc
}

package() {
  install -Dm644 "${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
  install -Dm644 "${_pkgname}.timer" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.timer"

  cd $_pkgname-$pkgver
  make prefix="$pkgdir/usr" sysconfdir="$pkgdir/etc" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${_pkgname}/COPYING"
}
