# Maintainer:  mrxx <mrxx at cyberhome dot at>
# Contributors: Se7endAY, Nathan Owe <ndowens04 at gmail>

pkgname=bozohttpd
pkgver=20181125
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
sha1sums=('370dae99518869c7a169567e46d261d4c1cabe19'
          '22c306cdbffa58ffbfae881e4340de63fe01cd8d'
          '50a8baf7ae497f7a53ad932898d46843b06a4b06'
          '2d43c700f362125766a217e217a62cf65ce47dbb'
          '5db8e184731f377b5082e40c007e035b8af69197'
          '2f74e5454fa60885e95d56e9de6ce8ed0f984f86'
          '402919ba5582f744ad38585a9cfa99fa8f346cf1')
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
