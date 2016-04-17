# Maintainer:  mrxx <mrxx at cyberhome dot at>
# Contributors: Se7endAY, Nathan Owe <ndowens04 at gmail>

pkgname=bozohttpd
pkgver=20160415
pkgrel=1
pkgdesc="A small and secure HTTP version 1.1 server"
arch=('i686' 'x86_64')
url="http://www.eterna.com.au/bozohttpd/"
license=('BSD')
depends=('openssl' 'lua')
optdepends=('php-cgi')
source=("http://www.eterna.com.au/${pkgname}/${pkgname}-${pkgver}.tar.bz2"
	'bozohttpd.service'
	'bozohttpd.install'
	'sample.cgi'
	'sample_perl.cgi'
	'LICENSE'
)
md5sums=('15a30acfbb5b36cec413ce81153064cb'
         'ff9687a9c5e0c656e633b1c3a0809901'
         'd1678187aba0c256e6f626cab677fe5c'
         '574f7bfc8a99c817bef1f26704bd8936'
         '911134dd7e4dbf7292a0c985986d8516'
         'd9cf04c906c6c560dea10afd1a93eab0')
install=bozohttpd.install

build()
{
	cd "${pkgname}-${pkgver}"
	cp Makefile.boot Makefile
	sed -i 's/d_namlen/d_reclen/g' bozohttpd.c
	make LOCAL_CFLAGS= LDFLAGS=-llua || return 1
}

package()
{
	cd "${pkgname}-${pkgver}"
	mkdir -p "${pkgdir}"/usr/{bin,lib/cgi-bin,share/{${pkgname},man/man8}}
	install -D testsuite/*.* testsuite/data/*.* "${pkgdir}/usr/share/${pkgname}/"
	install -D *.lua "${pkgdir}/usr/lib/cgi-bin/"
	install -m755 bozohttpd "${pkgdir}/usr/bin/"
	install -m644 bozohttpd.8 "${pkgdir}/usr/share/man/man8/"
	cd "$srcdir"
	install -Dm644 bozohttpd.service "${pkgdir}"/usr/lib/systemd/system/bozohttpd.service
	install -D *.cgi "${pkgdir}/usr/lib/cgi-bin/"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
