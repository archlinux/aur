# Contributor: megadriver <megadriver at gmx dot com>
# Contributor: Jamie Nguyen <jamie AT tomoyolinux.co.uk>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=webalizer-xtended
_geodbver=20120401
pkgver=2.23.05.${_geodbver}
_pkgver=2.23-05
_patchver=29
pkgrel=1
pkgdesc="A web server log file analysis program producing HTML reports, xtended"
arch=('i686' 'x86_64')
#url="http://www.webalizer.com/"
url="http://www.patrickfrei.ch/webalizer/"
license=('GPL')
depends=('db' 'gd' 'geoip')
provides=('webalizer')
conflicts=('webalizer')
install=webalizer.install
source=("ftp://ftp.mrunix.net/pub/webalizer/webalizer-${_pkgver}-src.tgz"
	"http://www.patrickfrei.ch/webalizer/rb${_patchver}/webalizer-${_pkgver}-RB${_patchver}-patch.tar.gz"
        "ftp://ftp.mrunix.net/pub/webalizer/geodb/webalizer-geodb-${_geodbver}.tgz"
        "ftp://ftp.mrunix.net/pub/webalizer/webalizer-flags.tgz")
md5sums=('304338cf3b1e9389123380d5f7d88d58'
         'd9d7b686f4a7791437fce33a6f0c47e5'
         '59809e40f3731d1111f2e908a3406ecc'
         '2605387b6076b8bdc0ec41b8655095c1')
        
build() {
  cd "${srcdir}/webalizer-${_pkgver}"
  patch -p1 < ${srcdir}/webalizer-${_pkgver}-RB${_patchver}-patch

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --datarootdir=/usr/share \
    --enable-bz2 \
    --enable-geoip
  make
}

package() {
  cd "${srcdir}/webalizer-${_pkgver}"

  # install webalizer
  make DESTDIR="${pkgdir}" install

  # install geolocation database (GeoDB)
  install -m755 -d "${pkgdir}/usr/share/GeoDB"
  install -m644 "${srcdir}/GeoDB.dat" "${pkgdir}/usr/share/GeoDB/GeoDB.dat"

  # install flags
  cd "${srcdir}/flags"
  install -m755 -d "${pkgdir}/usr/share/webalizer/flags"
  for i in *.png; do
    install -m644 ${i} "${pkgdir}/usr/share/webalizer/flags/${i}"
  done
}
