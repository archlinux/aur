# Maintainer: Lucien LOISEAU (Marlinski) <marlinski@disruptedsystems.org>

pkgname=dtnd
pkgver=1.0.0
pkgrel=1
pkgdesc='IBR-DTN - A modular and lightweight implementation of the bundle protocol - Daemon'
arch=('i686' 'x86_64')
url='https://github.com/ibrdtn/ibrdtn'
license=('Apache License 2.0')
depends=(ibrcommon ibrdtn sqlite libcurl-compat libcurl-gnutls libnl libdaemon zlib)
makedepends=(git binutils gcc libtool cppunit automake autoconf pkgconf)
provides=(dtnd)

source=(git://github.com/ibrdtn/ibrdtn.git)
sha512sums=('SKIP')

prepare() {
    cd ibrdtn/
}

build() {
    cd ibrdtn/ibrdtn/daemon
    CXXFLAGS=""
    [ -f Makefile ] && make clean
    bash autogen.sh
    ./configure --prefix=/usr --with-curl --with-lowpan --with-sqlite --with-compression --with-cppunit
    make -j
    cd ..
}

package() {
    cd ibrdtn/ibrdtn/daemon
    make DESTDIR="$pkgdir" install
    mv ${pkgdir}/usr/sbin/dtnd ${pkgdir}/usr/bin/dtnd
    rmdir ${pkgdir}/usr/sbin
    mkdir ${pkgdir}/etc
    mv ${pkgdir}/usr/etc/ibrdtnd.conf ${pkgdir}/etc/ibrdtnd.conf
    rmdir ${pkgdir}/usr/etc
}
