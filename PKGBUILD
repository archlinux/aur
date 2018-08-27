# Maintainer: Lucien LOISEAU (Marlinski) <marlinski@disruptedsystems.org>

pkgname=ibrdtn
pkgver=1.0.0
pkgrel=1
pkgdesc='IBR-DTN - A modular and lightweight implementation of the bundle protocol'
arch=('i686' 'x86_64')
url='https://github.com/ibrdtn/ibrdtn'
license=('Apache License 2.0')
depends=(sqlite libcurl-compat libcurl-gnutls libnl libdaemon zlib)
makedepends=(git binutils gcc libtool cppunit automake autoconf pkgconf)
provides=(ibrdtn)

source=(git://github.com/ibrdtn/ibrdtn.git)
sha512sums=('SKIP')

prepare() {
    cd ${pkgname}
}

build() {
    cd ${pkgname}
    DESTDIR="${srcdir}/build"

    CXXFLAGS=""

    cd ibrcommon
    [ -f Makefile ] && make clean
    bash autogen.sh
    ./configure --prefix=${DESTDIR} --with-lowpan
    make -j
    make install
    cd ..

    export ibrcommon_CFLAGS="-I${DESTDIR}/include/ibrcommon-1.0/"
    export ibrcommon_LIBS="-L${DESTDIR}/lib/ -librcommon"
    cd ibrdtn/ibrdtn
    [ -f Makefile ] && make clean
    bash autogen.sh
    ./configure --prefix=${DESTDIR} --with-compression
    make -j
    make install
    cd ..

    export ibrdtn_CFLAGS="${ibrcommon_CFLAGS} -I${DESTDIR}/include/ibrdtn-1.0"
    export ibrdtn_LIBS="${ibrcommon_LIBS} -librdtn"
    cd daemon
    [ -f Makefile ] && make clean
    bash autogen.sh
    ./configure --prefix=${DESTDIR} --with-curl --with-lowpan --with-sqlite --with-compression --with-cppunit
    make -j
    make install
    cd ..

    export ibrdtn_CFLAGS="${ibrcommon_CFLAGS} -I${DESTDIR}/include/ibrdtn-1.0"
    export ibrdtn_LIBS="${ibrcommon_LIBS} -librdtn -lz"
    cd tools
    [ -f Makefile ] && make clean
    bash autogen.sh
    ./configure --prefix=${DESTDIR}
    make -j
    make install
    cd ..
    cd ..

    strip ${DESTDIR}/sbin/dtnd
    strip ${DESTDIR}/sbin/dtntunnel
    strip ${DESTDIR}/bin/dtnconvert
    strip ${DESTDIR}/bin/dtninbox
    strip ${DESTDIR}/bin/dtnoutbox
    strip ${DESTDIR}/bin/dtnping
    strip ${DESTDIR}/bin/dtnrecv
    strip ${DESTDIR}/bin/dtnsend
    strip ${DESTDIR}/bin/dtnstream
    strip ${DESTDIR}/bin/dtntracepath
    strip ${DESTDIR}/bin/dtntrigger
}

package() {
    #ibrcommon-dev
    mkdir -p ${pkgdir}/usr/include/
    cp -r ${srcdir}/build/include/ibrcommon-1.0/ibrcommon ${pkgdir}/usr/include/ibrcommon

    #libibrcommon
    install -D -m755 ${srcdir}/build/lib/libibrcommon.a ${pkgdir}/usr/lib/libibrcommon.a
    install -D -m755 ${srcdir}/build/lib/libibrcommon.la ${pkgdir}/usr/lib/libibrcommon.la
    install -D -m755 ${srcdir}/build/lib/libibrcommon.so.1.0.0 ${pkgdir}/usr/lib/libibrcommon.so.1.0.0
    cd ${pkgdir}/usr/lib
    ln -s libibrcommon.so.1.0.0 libibrcommon.so
    ln -s libibrcommon.so.1.0.0 libibrcommon.so.1
    
    #ibrdtn-dev
    cp -r ${srcdir}/build/include/ibrdtn-1.0/ibrdtn ${pkgdir}/usr/include/ibrdtn

    #libibrdtn
    install -D -m755 ${srcdir}/build/lib/libibrdtn.a ${pkgdir}/usr/lib/libibrdtn.a
    install -D -m755 ${srcdir}/build/lib/libibrdtn.la ${pkgdir}/usr/lib/libibrdtn.la
    install -D -m755 ${srcdir}/build/lib/libibrdtn.so.1.0.0 ${pkgdir}/usr/lib/libibrdtn.so.1.0.0
    cd ${pkgdir}/usr/lib
    ln -s libibrdtn.so.1.0.0 libibrdtn.so
    ln -s libibrdtn.so.1.0.0 libibrdtn.so.1
    
    #ibrdtn-daemon 
    install -D -m755 ${srcdir}/build/bin/ibrdtn-genkey.sh ${pkgdir}/usr/bin/ibrdtn-genkey.sh
    install -D -m755 ${srcdir}/build/sbin/dtnd ${pkgdir}/usr/bin/dtnd
    mkdir -p ${pkgdir}/usr/share/doc/
    mkdir -p ${pkgdir}/usr/share/ibrdtnd
    cp -r ${srcdir}/build/share/doc/ibrdtnd ${pkgdir}/usr/share/doc/ibrdtnd
    cp -r ${srcdir}/build/share/ibrdtnd/munin ${pkgdir}/usr/share/ibrdtnd/munin
    install -D -m755 ${srcdir}/build/etc/ibrdtnd.conf ${pkgdir}/etc/ibrdtnd.conf

    #ibrdtn-tools
    install -D -m755 ${srcdir}/build/sbin/dtntunnel ${pkgdir}/usr/bin/dtntunnel
    install -D -m755 ${srcdir}/build/bin/dtnconvert ${pkgdir}/usr/bin/dtnconvert
    install -D -m755 ${srcdir}/build/bin/dtninbox ${pkgdir}/usr/bin/dtninbox
    install -D -m755 ${srcdir}/build/bin/dtnoutbox ${pkgdir}/usr/bin/dtnoutbox
    install -D -m755 ${srcdir}/build/bin/dtnping ${pkgdir}/usr/bin/dtnping
    install -D -m755 ${srcdir}/build/bin/dtnrecv ${pkgdir}/usr/bin/dtnrecv
    install -D -m755 ${srcdir}/build/bin/dtnsend ${pkgdir}/usr/bin/dtnsend
    install -D -m755 ${srcdir}/build/bin/dtnstream ${pkgdir}/usr/bin/dtnstream
    install -D -m755 ${srcdir}/build/bin/dtntracepath ${pkgdir}/usr/bin/dtntracepath
    install -D -m755 ${srcdir}/build/bin/dtntrigger ${pkgdir}/usr/bin/dtntrigger
}
