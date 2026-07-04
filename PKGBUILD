# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Franco Tortoriello <franco.tortoriello@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Jeff Mickey <jeff@archlinux.org>
# Contributor: John Proctor <jproctor@prium.net>
# Contributor: Alexander Rødseth <rodseth@gmail.com>

pkgname=commoncpp2
pkgver=1.8.1
pkgrel=9
pkgdesc="A class framework specifically designed for telephony applications"
arch=('x86_64' 'aarch64')
url='http://www.gnu.org/software/commoncpp/'
license=('GPL-2.0-only' 'custom')
depends=('gcc-libs' 'zlib' 'sh')
validpgpkeys=('84344FAA5350F5C61D2CE4A4046AC7983903A6DD')
source=("https://ftp.gnu.org/pub/gnu/commoncpp/$pkgname-$pkgver.tar.gz"{,.sig})
sha256sums=('53ced4aff74e28a1d8018eb2b4974519028db3c12471ab6dff1c873578c9af4e'
            'SKIP')

prepare() {
    cd ${pkgname}-${pkgver}
    cp -p /usr/share/autoconf/build-aux/config.guess autoconf/
}

build() {
    cd ${pkgname}-${pkgver}
    export CXXFLAGS="$CXXFLAGS -std=c++14 -fpermissive"
    sed -i -e '50 a\#include <sys/stat.h>' inc/cc++/applog.h
    ./configure --prefix=/usr --mandir=/usr/share/man
    make
}

package() {
    cd ${pkgname}-${pkgver}
    make DESTDIR="${pkgdir}" install
    install -Dm644 COPYING.addendum "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
