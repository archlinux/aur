# Maintainer: Fabien LEFEBVRE <contact@d1ceward.com>

pkgname=goaccess-systemd
_pkgname="${pkgname%-systemd}"
pkgver=1.5.1
pkgrel=8
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
            '408f5626e5791e7fa57aa05f93354f9c475df1d6070b09fb6b320b6e7b10b793886d89c334709b6efb7f348fbb1c182e7ced5b504a300c08289705e029cc76c4'
            '0ffbf4bba1d49e00358031527a745bf65f7241056991ae8acbe77c1f03f33692817159a64e90301aba8fbd3583d8c45f7f9ef7e3fb7a1306449244126d1fbaed')
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
  install -Dm644 "${_pkgname}.timer" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.timer"

  cd $_pkgname-$pkgver
  make prefix="$pkgdir/usr" sysconfdir="$pkgdir/etc" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${_pkgname}/COPYING"
}
