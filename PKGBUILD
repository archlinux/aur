_lib32=lib32-
_pkgname=unixodbc
_pkgname32=$_lib32$_pkgname
# pkgname=($_pkgname32-full $_pkgname32-sidebyside64)
pkgname=$_pkgname32
pkgver=2.3.14
pkgrel=1
pkgdesc="ODBC is an open specification for providing application developers with a predictable API with which to access Data Sources"
arch=('x86_64')
license=('GPL-2.0-or-later' 'LGPL-2.1-or-later')
url="http://www.unixodbc.org/"
backup=('etc/odbc.ini' 'etc/odbcinst.ini')
depends=('readline' 'libltdl' 'glibc')
provides=('libodbc.so' 'libodbccr.so' 'libodbcinst.so')
source=(#ftp://ftp.unixodbc.org/pub/unixODBC/unixODBC-$pkgver.tar.gz
        https://github.com/lurcher/unixODBC/releases/download/v${pkgver}/unixODBC-${pkgver}.tar.gz)
sha256sums=('4e2814de3e01fc30b0b9f75e83bb5aba91ab0384ee951286504bb70205524771')

prepare() {
    cd unixODBC-${pkgver}
    autoreconf -vfi
}

build() {
    cd unixODBC-${pkgver}

    export CFLAGS+=" -m32"
    export CXXFLAGS+=" -m32"

    ./configure \
      --prefix=/usr \
      --libdir=/usr/lib32 \
      --sysconfdir=/etc
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
    make
}

check() {
    cd unixODBC-${pkgver}
    make -k check
}

package() {
    cd unixODBC-${pkgver}
    make DESTDIR="${pkgdir}" install
    touch "$pkgdir"/etc/{odbc,odbcinst}.ini
}
