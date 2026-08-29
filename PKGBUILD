# Maintainer: Ketchup901 <ketchup901@riseup.net>

# Does not include the Perl bindings because I could not figure out how to build them.
# Does include all the admin tools for managing handles, but I can't test them because I don't have a Handle server.

pkgname=handle-hcc
pkgver=5.3.3
pkgrel=1
pkgdesc="Handle.Net Client Library - C Version"
arch=('any')
url="https://www.handle.net/client_download.html"
license=('custom:HNR-HCLC-5-License')
depends=('glibc' 'openssl-1.0')
_src="hcc5"
source=("https://www.handle.net/hnr-source/$_src.tar.gz")
sha256sums=('d103cddeb8bb1587e510c456407fc1ab88913d90cdae97b63a487cff036b7f12')
options=(!debug)

prepare() {
    sed -i 's/^static int x = 0;/int x = 0;/' $_src/hdl_crypto.c
}


build() {
    cd $_src
    export CFLAGS="$CFLAGS -fPIC -I/usr/include/openssl-1.0 -std=gnu89 -fcommon -Wno-error=incompatible-pointer-types -Wno-error=format-security"
    export LDFLAGS="$LDFLAGS -L/usr/lib/openssl-1.0"

    ./configure --prefix=/usr --mandir=/usr/share/man --disable-perl

    make libhdl.la
    make hslookup

    cd test
    make LDFLAGS="$LDFLAGS -L.." hscreate hsdelete hsaddvals hsdelvals hsgetsiteinfo hshome_unhome hsmodvals

}

package() {
    cd $_src
    make DESTDIR=$pkgdir install
    ln -s libhdl-$pkgver $pkgdir/usr/lib/libhdl.so

    for file in hscreate hsdelete hsaddvals hsdelvals hsgetsiteinfo hshome_unhome hsmodvals; do
        install -Dm755 test/.libs/$file $pkgdir/usr/bin/
    done

    install -Dm644 license.txt -t $pkgdir/usr/share/licenses/$pkgname/
}
