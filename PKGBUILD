# Maintainer: Iwan Timmer <irtimmer@gmail.com>

pkgname=pcp
pkgver=3.11.2
pkgrel=1
pkgdesc="System performance and analysis framework"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://pcp.io"
license=('LGPL')
depends=('python' 'avahi' 'systemtap' 'procps-ng')
makedepends=('libmicrohttpd' 'cairo' 'qt4')
optdepends=('libmicrohttpd: support for pmwebd'
            'cairo: support for pmwebd'
	    'qt4: support for PCP-GUI and pmchart')
install="pcp.install"
source=("https://bintray.com/artifact/download/pcp/source/pcp-$pkgver.src.tar.gz"
        "pcp.install"
        "pcp.tmpfiles")
sha256sums=('2496420d4e1fb1c39b905a666cfb2abd50819df3ad2ae138f76bebc1853089a4'
            '590d816edc87dd03e3700d7637f57ca81d24d63802f32f772709e0c33a4ca0b5'
            '48ce114e95ab640bfe6c6c9608c96c22a75b65ccb38dfa89bfa2b12621845f20')

build() {
	cd "$pkgname-$pkgver"
	QMAKE=qmake-qt4 ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
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
