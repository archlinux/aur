# Maintainer: Jonas Wiegert <aur@it-jonas.com>

pkgname=('kplex-git')
pkgver="v1.4.r0.g715b18c"
pkgrel=1
arch=('any')
url='http://www.stripydog.com/kplex/'
license=('GPL3')
makedepends=('git')
depends=('glibc')
pkgdesc='NMEA-0183 multiplexer for GNU/Linux capable of managing inputs from serial lines, pseudo terminals and network interfaces.'
provides=("kplex=${pkgver}")
source=('kplex-git::git://github.com/stripydog/kplex'
        'http://www.stripydog.com/download/kplex_1.4-1_amd64.deb')
md5sums=('SKIP'
         '5b44b5397c93531b7faa6431591fbeca')

prepare() {
    ar vx kplex_1.4-1_amd64.deb --output "${srcdir}"
    cd "${srcdir}"
    rm "debian-binary"
    rm "control.tar.gz"
    mkdir -p data
    tar -xf "data.tar.gz" -C data
}

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
    cp "${srcdir}/data/usr/share/kplex/kplex.service" "${pkgdir}/usr/lib/systemd/system/kplex.service"

    # copy example conf file from deb package
    mkdir -p "${pkgdir}/etc/"
    cp "${srcdir}/data/etc/kplex.conf" "${pkgdir}/etc/kplex.conf"

    # create dest dir and build
    mkdir -p "${pkgdir}/usr/share/man/man1"
    cd "${srcdir}/${pkgname}"
    make DESTDIR="${pkgdir}/usr" MANDIR="${pkgdir}/usr/share/man" install
}

