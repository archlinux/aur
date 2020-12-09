# Maintainer: Ali Akbar <the.apaan@gmail.com>
# Contributor: Cyker Way <cykerway at gmail dot com>
# Modified: Tomas Lindquist Olsen <tomas.l.olsen@gmail.com>

pkgname=cnijfilter-ip2800series
pkgver=4.10
pkgrel=2
pkgdesc="Canon IJ Printer Driver for Pixma IP2800 series (with cnijfilter-common)"
url="https://canon-print.com/canon-pixma-ip2800-series-drivers-windows-mac-linux/"
arch=('x86_64')
license=('custom')
depends=('libcups' 'libpng12' 'libxml2')
source=(http://gdlp01.c-wss.com/gds/8/0100005858/01/cnijfilter-source-4.10-1.tar.gz)
md5sums=('b6e763a1e271ecebfd3a93eb4aaec8b7')

build() {
    cd cnijfilter-source-${pkgver}-1/
    cd ppd
    ./autogen.sh --prefix=/usr --program-suffix=ip2800
    make clean
    make
    cd ..
    cd cnijfilter
    ./autogen.sh --prefix=/usr --program-suffix=ip2800 --enable-libpath=/usr/lib/bjlib --enable-binpath=/usr/bin

    make clean
    make
    cd ..

    cd libs
    ./autogen.sh --prefix=/usr
    cd ..
    cd bscc2sts
    ./autogen.sh
    cd ..
    cd cnijnpr
    patch src/cnijnpr.c ../../../cnijnpr_cnijnpr.c.patch
    ./autogen.sh --prefix=/usr --enable-libpath=/usr/lib/bjlib

    cd ..
    cd cnijbe
    ./autogen.sh --prefix=/usr --enable-progpath=/usr/bin
    cd ..
    cd cngpij
    patch configure.in ../../../cngpij_configure.in.patch
    patch cngpij/bjcups.c ../../../cngpij_bjcups.c.patch
    ./autogen.sh --prefix=/usr --enable-progpath=/usr/bin
    cd ..
    cd cngpijmnt
    patch configure.in ../../../cngpijmnt_configure.in.patch
    patch src/main.c ../../../cngpijmnt_main.c.patch
    ./autogen.sh --prefix=/usr --enable-progpath=/usr/bin
    cd ..
    cd pstocanonij
    ./autogen.sh --prefix=/usr --enable-progpath=/usr/bin
    cd ..
    cd backend
    patch src/cnij_backend_common.c ../../../cnij_backend_common.c.patch
    ./autogen.sh --prefix=/usr
    cd ..
    cd backendnet
    ./autogen.sh --prefix=/usr --enable-progpath=/usr/bin --enable-libpath=/usr/lib/bjlib LDFLAGS="$LDFLAGS -L../../com/libs_bin64"

    cd ..
    cd cmdtocanonij
    ./autogen.sh --prefix=/usr
    cd ..
    cd lgmon2
    ./autogen.sh --prefix=/usr --enable-progpath=/usr/bin --enable-libpath=/usr/lib/bjlib LDFLAGS="$LDFLAGS -L../../com/libs_bin64"
    cd ..
    make

}

package() {
    cd cnijfilter-source-${pkgver}-1/
    cd ppd
    make DESTDIR="$pkgdir/" install
    cd ..
    cd cnijfilter
    make DESTDIR="$pkgdir/" install
    cd ..

    mkdir -p "$pkgdir/usr/lib/bjlib"
    install -m 644 433/database/* "$pkgdir/usr/lib/bjlib"
    install -s -m 755 433/libs_bin64/*.so.* "$pkgdir/usr/lib" 

    mkdir -p "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/usr/lib/cups/filter"
    mkdir -p "$pkgdir/usr/lib/cups/backend"
    mkdir -p "$pkgdir/usr/share/cups/model"
    mkdir -p "$pkgdir/etc/udev/rules.d/"

    install -c -m 644 com/ini/cnnet.ini "$pkgdir/usr/lib/bjlib"

    make install DESTDIR="$pkgdir"
    install -s -m 755 com/libs_bin64/*.so.* "$pkgdir/usr/lib"
    install -m 644 etc/*.rules "$pkgdir/etc/udev/rules.d/"

    mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
    install -m 644 LICENSE* ${pkgdir}/usr/share/licenses/${pkgname}
}
