# Maintainer: Jonas Wiegert <aur@it-jonas.com>

pkgname=('kplex-git')
pkgver="v1.4.r1.ga67e945"
pkgrel=1
arch=('any')
url='http://www.stripydog.com/kplex/'
license=('GPL3')
makedepends=('git')
depends=('glibc')
pkgdesc='NMEA-0183 multiplexer for GNU/Linux capable of managing inputs from serial lines, pseudo terminals and network interfaces.'
source=('kplex-git::git://github.com/stripydog/kplex')
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${pkgname}"
    make
}

package() {
    # copy service file from deb package
    mkdir -p "${pkgdir}/usr/lib/systemd/system/"
    cp "${srcdir}/${pkgname}/kplex.service" "${pkgdir}/usr/lib/systemd/system/kplex.service"

    # copy example conf from deb package
    mkdir -p "${pkgdir}/etc/"
    cp "${srcdir}/${pkgname}/kplex.conf.ex" "${pkgdir}/etc/kplex.conf"

    # create dest dir and build
    mkdir -p "${pkgdir}/usr/share/man/man1"
    cd "${srcdir}/${pkgname}"
    make DESTDIR="${pkgdir}/usr" MANDIR="${pkgdir}/usr/share/man" install
}

