# Maintainer:  mrxx <mrxx at cyberhome dot at>
# Contributors: Se7endAY, Nathan Owe <ndowens04 at gmail>

pkgname=bozohttpd
pkgver=20150320
pkgrel=2
pkgdesc="A small and secure HTTP version 1.1 server"
arch=('i686' 'x86_64')
url="http://www.eterna.com.au/bozohttpd/"
license=('BSD')
depends=('openssl')
optdepends=('php-cgi')
source=("http://www.eterna.com.au/${pkgname}/${pkgname}-${pkgver}.tar.bz2"
	'bozohttpd.service'
	'bozohttpd.install'
	'sample.cgi'
	'sample_perl.cgi'
)
md5sums=('60e2cf933d028a096523214fab8e6590'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
)
install=bozohttpd.install

build()
{
	cd "${pkgname}-${pkgver}"
	cp Makefile.boot Makefile
	sed -i 's/d_namlen/d_reclen/g' bozohttpd.c
	make || return 1
}

package()
{
	cd "${pkgname}-${pkgver}"
	mkdir -p "${pkgdir}"/usr/{bin,lib/cgi-bin,share/{${pkgname},man/man8}}
	install -D *.* testsuite/*.* testsuite/data/*.* "${pkgdir}/usr/share/${pkgname}/"
	install -m755 bozohttpd "${pkgdir}/usr/bin/"
	install -m644 bozohttpd.8 "${pkgdir}/usr/share/man/man8/"
	cd "$srcdir"
	install -Dm644 bozohttpd.service "${pkgdir}"/usr/lib/systemd/system/bozohttpd.service
	install -D *.cgi "${pkgdir}/usr/lib/cgi-bin/"
}
