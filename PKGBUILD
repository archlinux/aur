# Maintainer: Pieter Lenaerts <pieter.aj.lenaerts@gmail.com>
# Contributor: David Baer <david.a.baer@gmail.com>

pkgname=sqliteodbc
pkgver=0.99991
pkgrel=2
pkgdesc="ODBC driver for SQLite"
arch=('i686' 'x86_64' 'aarch64')
depends=('unixodbc' 'sqlite' 'libxml2')
url="http://www.ch-werner.de/sqliteodbc/"
license=('BSD')
source=(http://www.ch-werner.de/sqliteodbc/${pkgname}-${pkgver}.tar.gz)
install=sqliteodbc.install

build() {
    cd "$srcdir/${pkgname}-$pkgver"

    # Autotools are from 2003. We have to autoreconf.
    rm aclocal.m4
    mv configure.in configure.ac
    aclocal -I m4
    echo "AC_CONFIG_MACRO_DIRS([m4])" >> configure.ac
    echo 'ACLOCAL_AMFLAGS="-Im4"' >> Makefile.am 
    autoupdate --force
    autoreconf --force --install

    export CFLAGS+=" -std=c17 -Wall -Wno-error=implicit-function-declaration"

    ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
    make -j$(nproc)
}

package() {
    cd "$srcdir/${pkgname}-$pkgver"
    install -d "${pkgdir}/usr/lib"
    make -j1 DESTDIR="${pkgdir}/" install
    libtool --finish /usr/lib
    install -D -m644 license.terms "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
md5sums=('f828ce0248b752a7bc9a7f0661a90171')
sha512sums=('ba45b4646083e577e7c54995e0d929fbc2a3bc4ed1667e4422521b6c035f3775f7c5d0ae9985808b8680bc9c2b5b79606289fd047a8805c82ce34d5631239285')
