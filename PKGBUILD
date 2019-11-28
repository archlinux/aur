# Maintainer Marcel Kleinfeller <marcel@oompf.de>

pkgname=coda
pkgver=7.1.0
pkgrel=1
pkgdesc="A distributed file system with disconnected operation."
depends=('bash' 'perl')
arch=(i686 x86_64 armv7h)
url="http://coda.cs.cmu.edu/"
source=("http://coda.cs.cmu.edu/coda/source/$pkgname-$pkgver.tar.xz")
sha512sums=('f35c5b8cb0e1568bec4fbaa319912e3812c86d4353b5d39e59037bbecf1880da12bd714e2bc83913a13b3dd9722c859a9c3279e5bc08991f363c956c26d69ca4')
license=("GPL")

prepare() {
    cd $pkgname-$pkgver
   for f in al/pdbtool.c al/pdbtool.8 al/pdb.h al/Makefile.am auth2/passwd.coda.5 scripts/vice-setup-user.in ; do
     sed -i -e 's,pdbtool,cpdbtool,g' coda-src/$f
     sed -i -e 's,PDBTOOL,CPDBTOOL,g' coda-src/$f
   done
   mv coda-src/al/pdbtool.c coda-src/al/cpdbtool.c
   mv coda-src/al/pdbtool.8 coda-src/al/cpdbtool.8
   ./bootstrap.sh
}

build() {
    cd $pkgname-$pkgver
    ./configure \
	--prefix=/usr \
	--sysconfdir=/etc \
	--sbindir=/usr/bin \
	--libdir=/usr/lib \
	--datadir=/usr/share \
	--includedir=/usr/include \
	--enable-client \
	--enable-server
    make V=0
}

package() {
    cd $pkgname-$pkgver
    make DESTDIR="${pkgdir}" install
}
