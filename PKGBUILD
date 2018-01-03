# Maintainer: Matthias Meulien <orontee@gmail.com>

pkgname=cnijfilter-ip110
pkgver=5.20
pkgrel=1
pkgdesc="IJ Printer driver for Canon PIXMA iP110"
arch=(i686 x86_64)
url="http://canon.driversdown.com/"
license=("custom:Proprietary to Canon")
depends=(cups libxml2)
srcname="cnijfilter2-source"
source=("http://gdlp01.c-wss.com/gds/0/0100006900/01/$srcname-$pkgver-1.tar.gz")
noextract=()
md5sums=('6a00fddeb41a5a58d209111d664ed703')

prepare() {
    echo "Using original source, nothing to do"
}

build() {
    cd "$srcname-$pkgver-1"
    
    pushd cmdtocanonij2
    ./autogen.sh --prefix=/usr \
		 --datadir=/usr/share \
		 LDFLAGS="-L../../com/libs_bin64"
    make
    popd

    pushd cnijbe2
    ./autogen.sh --prefix=/usr \
		 --enable-progpath=/usr/bin
    make
    popd

    pushd lgmon3
    ./autogen.sh --prefix=/usr \
		 --enable-libpath=/usr/lib/bjlib2 \
		 --enable-progpath=/usr/bin \
		 --datadir=/usr/share \
		 LDFLAGS="-L../../com/libs_bin64"
    make
    popd

    pushd rastertocanonij
    ./autogen.sh --prefix=/usr \
		 --enable-progpath=/usr/bin
    make
    popd

    pushd tocanonij
    ./autogen.sh --prefix=/usr
    make
    popd

    pushd tocnpwg
    ./autogen.sh --prefix=/usr
    make
    popd
}


check() {
    cd "$srcname-$pkgver-1"

    pushd cmdtocanonij2
    make check
    popd

    pushd cnijbe2
    make check
    popd

    pushd lgmon3
    make check
    popd

    pushd rastertocanonij
    make check
    popd

    pushd tocanonij
    make check
    popd

    pushd tocnpwg
    make check
    popd
}

package() { 
    mkdir -p "$pkgdir/usr/lib/bjlib2"
    mkdir -p "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/usr/lib/cups/filter"
    mkdir -p "$pkgdir/usr/lib/cups/backend"    
    mkdir -p "$pkgdir/usr/share/cups/model"

    cd "$srcname-$pkgver-1"

    install -c -m644 com/ini/cnnet.ini "$pkgdir/usr/lib/bjlib2"
    install -c -s -m755 com/libs_bin64/*.so.* "$pkgdir/usr/lib"
    install -D -m644 doc/LICENSE-cnijfilter-${pkgver}EN.txt \
	    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    pushd ppd
    install -m 644 *.ppd "$pkgdir/usr/share/cups/model"
    popd

    pushd cmdtocanonij2
    make DESTDIR="$pkgdir" install
    popd

    pushd cnijbe2
    make DESTDIR="$pkgdir" install
    popd

    pushd lgmon3
    make DESTDIR="$pkgdir" install
    popd

    pushd rastertocanonij
    make DESTDIR="$pkgdir" install
    popd

    pushd tocanonij
    make DESTDIR="$pkgdir" install
    popd

    pushd tocnpwg
    make DESTDIR="$pkgdir" install
    popd
}
