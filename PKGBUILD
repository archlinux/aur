# Maintainer: Iwan Timmer <irtimmer@gmail.com>

pkgname=pcp
pkgver=3.10.4
pkgrel=1
pkgdesc="System performance and analysis framework"
arch=('i686' 'x86_64')
url="http://pcp.io"
license=('LGPL')
depends=('python' 'nss' 'qt4' 'avahi' 'systemtap' 'procps-ng')
makedepend=('libmicrohttpd')
optdepends=('libmicrohttpd: support for pmwebd')
install="pcp.install"
source=("ftp://ftp.pcp.io/projects/pcp/download/pcp-$pkgver.src.tar.gz"
        "pcp.install"
        "pcp.tmpfiles")
sha256sums=('0215380d2ddb01865f659bbf36ed06020d5865152d430a6b6fc45eda67cc22ba'
            '590d816edc87dd03e3700d7637f57ca81d24d63802f32f772709e0c33a4ca0b5'
            '48ce114e95ab640bfe6c6c9608c96c22a75b65ccb38dfa89bfa2b12621845f20')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DIST_ROOT="$pkgdir/" PCP_USER=root PCP_GROUP=root install
	
	rm -rf $pkgdir/var/run
	install -D -m644 $srcdir/pcp.tmpfiles $pkgdir/usr/lib/tmpfiles.d/pcp.conf
	
	#Remove test files
	rm -rf $pkgdir/var/lib/pcp/testsuite
}
