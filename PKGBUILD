# Maintainer: Thore Bödecker <me [at] foxxx0 [dot] de>
# Contributor: Robert Knauer <robert@privatdemail.net>
# Contributor: megadriver <megadriver at gmx dot com>
# Contributor: Jamie Nguyen <jamie AT tomoyolinux.co.uk>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=webalizer
_geodbver=20170501
pkgver=2.23.08.${_geodbver}
_pkgver=2.23-08
pkgrel=2
pkgdesc="A web server log file analysis program producing HTML reports"
arch=('i686' 'x86_64')
url="http://www.webalizer.com/"
license=('GPL')
depends=('db' 'gd' 'geoip')
install="${pkgname}.install"
source=(
  "ftp://ftp.mrunix.net/pub/${pkgname}/${pkgname}-${_pkgver}-src.tgz"
  "ftp://ftp.mrunix.net/pub/${pkgname}/geodb/${pkgname}-geodb-${_geodbver}.tgz"
  "ftp://ftp.mrunix.net/pub/${pkgname}/${pkgname}-flags.tgz"
)
sha256sums=('edaddb5aa41cc4a081a1500e3fa96615d4b41bc12086bcedf9938018ce79ed8d'
            '0f0b75089243832a6deadcbd0161795e18c73cdc1a8b710b02675b28e3688b39'
            'df9961fec7da2c16ed3faefb763f912c2db5ddce6a24e4f46647d7e64b8ab29a')

build() {
    cd "${srcdir}/${pkgname}-${_pkgver}"
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
    cd "${srcdir}/${pkgname}-${_pkgver}"
    make DESTDIR="${pkgdir}" install
    # install geolocation database (GeoDB)
    install -D -m644 "${srcdir}/GeoDB.dat" "${pkgdir}/usr/share/GeoDB/GeoDB.dat"
    # install flags
    cd "${srcdir}/flags"
    for _i in *.png; do
        install -D -m644 "${_i}" "${pkgdir}/usr/share/${pkgname}/flags/${_i}"
    done
}
