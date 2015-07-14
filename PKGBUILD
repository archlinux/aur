# Maintainer: mrxx <mrxx at cyberhome dot at>
# Contributor: bender02 at gmx dot com
pkgname=mini_httpd
pkgver=1.21
pkgrel=1
pkgdesc="A small and simple forking http server. CGI, SSL, auth, vhosts, ipv6."
url="http://www.acme.com/software/mini_httpd/"
arch=('i686' 'x86_64')
license=('custom')
depends=('openssl')
backup=('etc/mini_httpd.conf')
source=("http://www.acme.com/software/${pkgname}/${pkgname}-${pkgver}.tar.gz"
	'mini_httpd.service'
	'mini_httpd_ssl.service'
	'mini_httpd.logrotate'
	'mini_httpd.conf'
	'mini_httpd_ssl.conf'
	'mini_httpd.pem'
	'sample.cgi'
	'sample_perl.cgi'
	'LICENSE')

md5sums=('c7d18a2952eb44282366c127e6dc3870'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
	'SKIP'
        'SKIP'
	'SKIP'
        'SKIP')

install=mini_httpd.install

prepare()
{
	cd "$pkgname-$pkgver"
	sed -i  's|#SSL_|SSL_|' Makefile
	sed -i  '/SSL_TREE/s|/usr/local/ssl|/usr|' Makefile
	sed -i  's/htpasswd/mini_htpasswd/g' Makefile
	sed -i  's/getline/my_getline/' htpasswd.c
	sed -i  's/HAVE_INT64T/__int8_t_defined/g' mini_httpd.c
	mv htpasswd.c mini_htpasswd.c
	mv htpasswd.1 mini_htpasswd.1
}

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm644 -t "${pkgdir}/etc/${pkgname}/" "${srcdir}/${pkgname}.conf" "${srcdir}/${pkgname}_ssl.conf"
	install -Dm644 -t "${pkgdir}/usr/lib/systemd/system/" "${srcdir}/${pkgname}.service" "${srcdir}/${pkgname}_ssl.service"
	install -Dm640 -t "${pkgdir}/etc/ssl/private/" "${srcdir}/${pkgname}.pem"
	install -Dm755 -t "${pkgdir}/srv/http/" "${srcdir}/sample.cgi" "${srcdir}/sample_perl.cgi"
	install -Dm644 "${srcdir}/${pkgname}.logrotate" "${pkgdir}/etc/logrotate.d/${pkgname}"
	install -D "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
	make BINDIR=${pkgdir}/usr/bin MANDIR=${pkgdir}/usr/share/man install
}
