# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Thore Bödecker <me [at] foxxx0 [dot] de>
# Contributor: Robert Knauer <robert@privatdemail.net>
# Contributor: megadriver <megadriver at gmx dot com>
# Contributor: Jamie Nguyen <jamie AT tomoyolinux.co.uk>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=webalizer
_geodbver=20210401
pkgver=2.23.08.${_geodbver}
_pkgver=2.23-08
pkgrel=5
pkgdesc="A web server log file analysis program producing HTML reports"
arch=('i686' 'x86_64' 'armv7h')
url="http://www.webalizer.com/"
license=('GPL')
depends=('db' 'gd' 'geoip' 'bzip2')
install="${pkgname}.install"
source=(
  "https://dev.victor3d.com.br/webalizer/${pkgname}-${_pkgver}-src.tgz"
  "https://dev.victor3d.com.br/webalizer/${pkgname}-geodb-${_geodbver}.tgz"
  "https://dev.victor3d.com.br/webalizer/${pkgname}-flags.tgz"
  "webalizer-2.23-08-memmove.patch"
)
sha512sums=('219cae51d2e938e2d9327ce52c9c814e7436c821b05cb528dc88f548bdfbd7a6ad69c235b078d6af194c3a1d38029fde7dde9e8b81ad6fd93c236ca76a49811b'
	    'b90aa2fdef14dde132eb866c44f8132e16dacbdf06790701ca6d8b7f54ec6a60756a7f47218d2635536d3d939fd4795dcb68ae1ca64157cc7d9dcaed5de7dfa0'
            'bb23d68fed2f130c8a752d1b219974e44e3f32dd40ecf6b236cdbede58d4bfbb15a8901e5ee76fbfae1ce1bd3d3664b28d0bd79b85e15949ff420ec262be21c1'
            '538b7cf51303581df7d1710073d55563fda4c64841a6d7dac8d47e0b037975b9ad4ad4973db5807226480ecea0e0783c445400bd53b60d0d7308559946ce3b4a')

prepare() {
    cd "${srcdir}/${pkgname}-${_pkgver}"
    # fix history corruption, see https://bugs.launchpad.net/ubuntu/+source/webalizer/+bug/1399615
    patch -p1 -i "${srcdir}/webalizer-2.23-08-memmove.patch"
}

build() {
    cd "${srcdir}/${pkgname}-${_pkgver}"
    export CFLAGS="$CFLAGS -fcommon"
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
