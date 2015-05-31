# Maintainer: Robert Knauer <robert@privatdemail.net>
# Contributor: megadriver <megadriver at gmx dot com>
# Contributor: Jamie Nguyen <jamie AT tomoyolinux.co.uk>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=webalizer
_geodbver=20140101
pkgver=2.23.08.${_geodbver}
_pkgver=2.23-08
pkgrel=1
pkgdesc="A web server log file analysis program producing HTML reports"
arch=('i686' 'x86_64')
url="http://www.webalizer.com/"
license=('GPL')
depends=('db' 'gd' 'geoip')
install="${pkgname}.install"
source=(
  "ftp://ftp.mrunix.net/pub/webalizer/webalizer-${_pkgver}-src.tgz"
  "ftp://ftp.mrunix.net/pub/webalizer/geodb/webalizer-geodb-${_geodbver}.tgz"
  "ftp://ftp.mrunix.net/pub/webalizer/webalizer-flags.tgz"
)
sha256sums=(
  'edaddb5aa41cc4a081a1500e3fa96615d4b41bc12086bcedf9938018ce79ed8d'
  'a3cd4b001c040e20cdf1acf5f5dce5581ff76851f305f998b502336729303119'
  'df9961fec7da2c16ed3faefb763f912c2db5ddce6a24e4f46647d7e64b8ab29a'
)

build() {
  cd "${srcdir}/webalizer-${_pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc --datarootdir=/usr/share --enable-bz2 --enable-geoip
  make
}

package() {
  cd "${srcdir}/webalizer-${_pkgver}"
  make DESTDIR="${pkgdir}" install
  # install geolocation database (GeoDB)
  install -m755 -d "${pkgdir}/usr/share/GeoDB"
  install -m644 "${srcdir}/GeoDB.dat" "${pkgdir}/usr/share/GeoDB/GeoDB.dat"
  # install flags
  cd "${srcdir}/flags"
  install -m755 -d "${pkgdir}/usr/share/webalizer/flags"
  for _i in *.png; do
    install -m644 "${_i}" "${pkgdir}/usr/share/webalizer/flags/${_i}"
  done
}
