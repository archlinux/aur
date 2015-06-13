# $Id: PKGBUILD,v 1.11 2008/06/10 09:30:10 $
# Maintainer:  Michael Hansen < zrax0111 gmail com >
pkgname=postgresql-uuid-ossp
pkgver=9.4.4
pkgrel=1
pkgdesc="PostgreSQL UUID-OSSP Extension"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
license=('BSD')
url="http://www.postgresql.org/"
depends=('readline' 'postgresql>=9.4' 'uuid')
options=('!makeflags')
source=(ftp://ftp.postgresql.org/pub/source/v${pkgver}/postgresql-${pkgver}.tar.bz2)
sha256sums=('538ed99688d6fdbec6fd166d1779cf4588bf2f16c52304e5ef29f904c43b0013')

build() {
    cd ${srcdir}/postgresql-${pkgver} || return 1

    # configure
    ./configure --prefix=/usr --datadir=/usr/share/postgresql \
        --with-ossp-uuid || return 1

    # make and install
    make || return 1

    cd ${srcdir}/postgresql-${pkgver}/contrib

    make || return 1

    make DESTDIR=${srcdir}/pkg-all install || return 1
}

package() {
    mkdir -p ${pkgdir}/usr/lib/postgresql
    mkdir -p ${pkgdir}/usr/share/postgresql/extension
    cp -p ${srcdir}/pkg-all/usr/lib/postgresql/uuid-ossp.so \
          ${pkgdir}/usr/lib/postgresql/ || return 1
    cp -p ${srcdir}/pkg-all/usr/share/postgresql/extension/uuid-ossp--1.0.sql \
          ${srcdir}/pkg-all/usr/share/postgresql/extension/uuid-ossp.control \
          ${srcdir}/pkg-all/usr/share/postgresql/extension/uuid-ossp--unpackaged--1.0.sql \
          ${pkgdir}/usr/share/postgresql/extension/ || return 1
}
