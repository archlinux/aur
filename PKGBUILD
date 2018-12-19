# Maintainer:  mrxx <mrxx at cyberhome dot at>
# Contributors: Se7endAY, Nathan Owe <ndowens04 at gmail>

pkgname=bozohttpd
pkgver=20181215
pkgrel=1
pkgdesc="A small and secure HTTP version 1.1 server"
arch=('i686' 'x86_64' 'armv6h')
url="http://www.eterna.com.au/bozohttpd/"
license=('BSD')
depends=('openssl' 'lua')
optdepends=('php-cgi')
source=("http://www.eterna.com.au/${pkgname}/${pkgname}-${pkgver}.tar.bz2"
	'bozohttpd.service'
	'bozohttpd_ssl.service'
	'bozohttpd.install'
	'sample.cgi'
	'sample_perl.cgi'
	'LICENSE'
)
sha256sums=('634adda4e8ee561791a31f80d2ee6369a555848a13078588e0338e34d8072817'
            '8333eccd1c35d5001342c6130112105f1f6633ca70a7ca3c0d9ca4ccfe03db2c'
            '660240d1b3389591a0320bc7ccc0b8bcb0c8b2a533177bb0836b2f4db4569bb9'
            '11f5ea1a3a0d84bcf49418406533e4f43ce2285125f9a4194ce5e76e3f89a748'
            '461e0609e1cd8056cb24b06e21cbe8755bfe7166cc6348c8b5ded40895307766'
            '341aeec49ee05d601d458c278c819727f68a7b4164348cce34a231761bda57c0'
            'e595b7dbec03b1a173eca3854c401793b1db3f48333430409b5c8714b8f80e87')
install=bozohttpd.install

build()
{
	cd "${pkgname}-${pkgver}"

	cp Makefile.boot Makefile
	sed -i 's/d_namlen/d_reclen/g' bozohttpd.c

	# Fix php-cgi regression
	sed -i '592d' cgi-bozo.c

	make CFLAGS= LDFLAGS=-llua CPPFLAGS="-DDO_HTPASSWD -D_GNU_SOURCE" CRYPTOLIBS="-lcrypto -lssl -lcrypt" || return 1
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
	install -Dm644 bozohttpd_ssl.service "${pkgdir}"/usr/lib/systemd/system/bozohttpd_ssl.service
	install -D *.cgi "${pkgdir}/usr/lib/cgi-bin/"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
