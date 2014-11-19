# Contributor: Johannes Dewender  arch at JonnyJD dot net
# Contributor: megadriver <megadriver at gmx dot com>
# Contributor: Jamie Nguyen <jamie AT tomoyolinux.co.uk>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=webalizer-xtended
_geodbver=20141101
pkgver=2.23.08.${_geodbver}
_pkgver=2.23-08
_patchver=30
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
sha256sums=('edaddb5aa41cc4a081a1500e3fa96615d4b41bc12086bcedf9938018ce79ed8d'
            'cfd12f33a869e6eb2cf94165a75f733f205d85ba78345ce35b0b1bbce1a6aa93'
            '5a04ea0d0338234ec566de42a1ad6f1b88290ef0449b9b6fdc5bf383226d5e84'
            'df9961fec7da2c16ed3faefb763f912c2db5ddce6a24e4f46647d7e64b8ab29a')
        
build() {
  cd "${srcdir}/webalizer-${_pkgver}"
  patch -p1 < ${srcdir}/webalizer-${_pkgver}-RB${_patchver}-patch

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --datarootdir=/usr/share \
    --mandir=/usr/share/man \
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
