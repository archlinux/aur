# Maintainer: Sven Karsten Greiner <sven@sammyshp.de>
pkgname=libfprint-upstream-git
pkgver=0.6.0.r43.5a7e6e0
pkgrel=1
pkgdesc='Library for fingerprint readers'
arch=('i686' 'x86_64')
url='https://www.freedesktop.org/wiki/Software/fprint/libfprint/'
license=('LGPL')
depends=('libusb' 'nss' 'pixman' 'glib2')
makedepends=('git')
provides=('libfprint')
conflicts=('libfprint')
source=("$pkgname::git://anongit.freedesktop.org/libfprint/libfprint")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "%s" "$(git describe --long | sed 's/^V_//;s/\([^-]*-\)g/r\1/;s/[-_]/./g')"
}

prepare() {
    cd "$srcdir/$pkgname"

    NOCONFIGURE=1 ./autogen.sh
}

build() {
    cd "$srcdir/$pkgname"

    ./configure --prefix=/usr \
                --sysconfdir=/etc \
                --disable-static

    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

    make
}

package() {
    cd "$srcdir/$pkgname"

    make DESTDIR="$pkgdir" install
}
