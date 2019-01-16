# Maintainer: Thore Bödecker <me [at] foxxx0 [dot] de>
# Contributor: Robert Knauer <robert@privatdemail.net>
# Contributor: megadriver <megadriver at gmx dot com>
# Contributor: Jamie Nguyen <jamie AT tomoyolinux.co.uk>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=webalizer
_geodbver=20190101
pkgver=2.23.08.${_geodbver}
_pkgver=2.23-08
pkgrel=4
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
  "webalizer-2.23-08-memmove.patch"
)
sha512sums=('219cae51d2e938e2d9327ce52c9c814e7436c821b05cb528dc88f548bdfbd7a6ad69c235b078d6af194c3a1d38029fde7dde9e8b81ad6fd93c236ca76a49811b'
            '79eb8db5761a5943e50c7db3a09430d926d4e15e3a1e0f6d4d310030dc551d314cad5c5a998d327db851d52a69b41069cfd4d68b96ed671d68feb1e19124885d'
            'bb23d68fed2f130c8a752d1b219974e44e3f32dd40ecf6b236cdbede58d4bfbb15a8901e5ee76fbfae1ce1bd3d3664b28d0bd79b85e15949ff420ec262be21c1'
            '538b7cf51303581df7d1710073d55563fda4c64841a6d7dac8d47e0b037975b9ad4ad4973db5807226480ecea0e0783c445400bd53b60d0d7308559946ce3b4a')

prepare() {
    cd "${srcdir}/${pkgname}-${_pkgver}"
    # fix history corruption, see https://bugs.launchpad.net/ubuntu/+source/webalizer/+bug/1399615
    patch -p1 -i "${srcdir}/webalizer-2.23-08-memmove.patch"
}

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
