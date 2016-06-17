# Maintainer=alive4ever
pkgname=libressl-netcat
pkgver=2.4.1
pkgrel=1
arch=('x86_64' 'i386')
pkgdesc="Low level UDP/TCP connection tool with support for TLS protocol"
url=http://www.libressl.org
license=('bsd' 'custom:Openssl')
depends=('glibc' 'ca-certificates')
provides=('netcat')
conflicts=('openbsd-netcat' 'gnu-netcat')
source=("http://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-${pkgver}.tar.gz" "http://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-${pkgver}.tar.gz.asc")
sha256sums=('121922b13169cd47a85e3e77f0bc129f8d04247193b42491cb1fab9074e80477'
            'SKIP')
validpgpkeys=('A1EB079B8D3EB92B4EBD3139663AF51BD5E4D8D5') # Brent Cook <bcook@openbsd.org>

build() {
cd $srcdir/libressl-${pkgver}/
./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --enable-nc --enable-static --with-pic=nc
make
}

package() {
cd $srcdir/libressl-${pkgver}
mkdir -p $pkgdir/usr/bin
install -m 755 ./apps/nc/.libs/nc $pkgdir/usr/bin/nc
mkdir -p $pkgdir/usr/lib
install -m 644 ./tls/.libs/libtls.so.11 $pkgdir/usr/lib/libtls.so.11
install -m 644 ./crypto/.libs/libcrypto.so.38 $pkgdir/usr/lib/libcrypto.so.38
mkdir -p $pkgdir/usr/share/man/man1
gzip -c ./apps/nc/nc.1 > $pkgdir/usr/share/man/man1/nc.1.gz
}

