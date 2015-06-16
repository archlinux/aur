# Maintainer: Jonathan Scott Tinkham <sctincman@gmail.com>

pkgname=epiphany-libs
pkgver=2015.1
pkgrel=1
pkgdesc='Adapteva Epiphany runtime libraries and utilities'
arch=(i686 x86_64 armv7h)
url='http://www.adapteva.com/'
license=(GPL3)
depends=(epiphany-elf-gcc)
provides=(epiphany-libs)
conflicts=(epiphany-libs)
makedepends=()
options=(staticlibs !strip !buildflags)
source=("https://github.com/adapteva/$pkgname/archive/esdk-$pkgver.tar.gz"
	"epiphany_hdf.sh")
sha256sums=('189c723a0402340a45c74f2cb07e17acda1ede9d8f830560dbd1c8622f7ebac2'
            'bc7f54353f0f780a30b78779bfc6d1f8771e2023823914b2983d62c799af083d')

build() {
    cd $srcdir/$pkgname-esdk-$pkgver

    export PARALLELLA_LINUX_HOME=/usr/lib/modules/$(uname -r)/build

    ./build-libs.sh -a
}

package() {
    cd $srcdir/$pkgname-esdk-$pkgver

    install -d -m 0755 $pkgdir/usr/lib/esdk
    install -d -m 0755 $pkgdir/usr/include/esdk
    # Install bsps, link "current" to E16 parallella
    # This is what is selected by parallella-firmware
    # Hopefully, there'll be a way to select the current plat
    install -d -m 0755 $pkgdir/usr/share/$pkgname
    cp -r bsps $pkgdir/usr/share/$pkgname
    ln -sTf parallella_E16G3_1GB $pkgdir/usr/share/$pkgname/bsps/current
    chmod -R a+rwX $pkgdir/usr/share/$pkgname/bsps
    chmod -R og-w $pkgdir/usr/share/$pkgname/bsps

    # Install e-xml
    install -d -m 0755 $pkgdir/usr/lib
    install -m 0755 src/e-xml/Release/libe-xml.so $pkgdir/usr/lib

    # Install e-hal
    install -d -m 0755 $pkgdir/usr/include
    install -m 0755 src/e-hal/Release/libe-hal.so $pkgdir/usr/lib
    install -m 0644 \
	src/e-hal/src/epiphany-hal.h \
	src/e-hal/src/epiphany-hal-data.h \
	src/e-hal/src/epiphany-hal-data-local.h \
	src/e-hal/src/epiphany-hal-api.h \
	src/e-hal/src/epiphany-hal-api-local.h \
	src/e-hal/src/epiphany-shm-manager.h \
	$pkgdir/usr/include
    ln -s epiphany-hal.h $pkgdir/usr/include/e-hal.h
    ln -s epiphany-hal.h $pkgdir/usr/include/e_hal.h

    # Install e-loader
    install -m 0644 src/e-loader/src/e-loader.h $pkgdir/usr/include
    ln -s e-loader.h $pkgdir/usr/include/e_loader.h
    install -m 0755 src/e-loader/Release/libe-loader.so $pkgdir/usr/lib

    # Install e-memman
    install -m 0644 src/e-memman/include/memman.h $pkgdir/usr/include
    install -m 0755 src/e-memman/Release/libmemman.a $pkgdir/usr/lib/esdk

    # Install e-server
    install -d -m 0755 $pkgdir/usr/bin
    install -m 0755 src/e-server/Release/e-server $pkgdir/usr/bin

    # Install utilities
    cd src/e-utils
    install -m 0755 e-clear-shmtable/Release/e-clear-shmtable $pkgdir/usr/bin
    install -m 0755 e-eclipse $pkgdir/usr/bin
    install -m 0755 e-reset/e-reset $pkgdir/usr/bin
    install -m 0755 e-loader/Release/e-loader $pkgdir/usr/bin
    install -m 0755 e-read/Release/e-read $pkgdir/usr/bin
    install -m 0755 e-write/Release/e-write $pkgdir/usr/bin
    install -m 0755 e-trace/Release/libe-trace.so $pkgdir/usr/lib
    install -m 0755 e-trace-dump/Release/e-trace-dump $pkgdir/usr/bin
    install -m 0755 e-trace-server/Release/e-trace-server $pkgdir/usr/bin
    install -m 0755 e-hw-rev/e-hw-rev $pkgdir/usr/bin
    install -m 0755 e-objcopy $pkgdir/usr/bin
    chmod 0755 $pkgdir/usr/bin/*
    cd ../..

    # Install e-lib
    cd src/e-lib
    install -m 0755 Release/libe-lib.a $pkgdir/usr/lib/esdk
    ln -s libe-lib.a $pkgdir/usr/lib/esdk/libelib.a
    install -m 0644 \
	include/e_common.h \
	include/e_coreid.h \
	include/e_ctimers.h \
	include/e_dma.h \
	include/e_ic.h \
	include/e_lib.h \
	include/e_mem.h \
	include/e_mutex.h \
	include/e_regs.h \
	include/e_shm.h \
	include/e_trace.h \
	include/e_types.h \
	$pkgdir/usr/include/esdk
    ln -s e_lib.h $pkgdir/usr/include/esdk/e-lib.h
    cd ../..

    #add EPIPHANY_HDF to profile for all users
    install -d -m 0755 $pkgdir/etc/profile.d
    install -m 0755 $srcdir/epiphany_hdf.sh $pkgdir/etc/profile.d

}

