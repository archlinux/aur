# Maintainer: mrxx <mrxx at cyberhome dot at>
# Contributor: bender02 at gmx dot com

pkgname=mini_httpd
pkgver=1.30
pkgrel=1
pkgdesc="A small and simple forking http server. CGI, SSL, auth, vhosts, ipv6."
url="http://www.acme.com/software/mini_httpd/"
arch=('i686' 'x86_64')
license=('custom')
depends=('openssl')
backup=('etc/mini_httpd/mini_httpd.conf'
	'etc/mini_httpd/mini_httpd_ssl.conf')
source=("https://www.acme.com/software/${pkgname}/${pkgname}-${pkgver}.tar.gz"
	'mini_httpd.service'
	'mini_httpd_ssl.service'
	'mini_httpd.logrotate'
	'mini_httpd.conf'
	'mini_httpd_ssl.conf'
	'sample.cgi'
	'sample_perl.cgi'
	'LICENSE')

sha1sums=('42b3862ce728f948440378de3b26fd29199febe4'
          'df01a85e20a1f684ba3ee80525b0ecd7c1b24b4a'
          'a941b5fc254320a1415397fd25c96bdb6ee13bf3'
          '2d7bebd481f60cc45477be3fe28c6fa62f19ac79'
          'd89ad3868cb321236bf2e5a217794d4645d797f4'
          '7a4b2d1e2c27ff68d62acc7dc6617b3748ada212'
          '5db8e184731f377b5082e40c007e035b8af69197'
          '2f74e5454fa60885e95d56e9de6ce8ed0f984f86'
          '531a46799b6780d88ec1431785f290fa164da041')

install=mini_httpd.install

prepare()
{
	cd "$pkgname-$pkgver"
	sed -i  's|#SSL_|SSL_|' Makefile
	sed -i  '/SSL_TREE/s|/usr/local/ssl|/usr|' Makefile
	sed -i  's/htpasswd/mini_htpasswd/g' Makefile
	sed -i  's/getline/my_getline/' htpasswd.c
#	sed -i  's/HAVE_INT64T/__int8_t_defined/g' mini_httpd.c
	sed -i  's/HAVE_INT64T/_BITS_STDINT_INTN_H/g' mini_httpd.c
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
	install -Dm755 -t "${pkgdir}/srv/http/" "${srcdir}/sample.cgi" "${srcdir}/sample_perl.cgi"
	install -Dm644 "${srcdir}/${pkgname}.logrotate" "${pkgdir}/etc/logrotate.d/${pkgname}"
	install -D "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
	make BINDIR=${pkgdir}/usr/bin MANDIR=${pkgdir}/usr/share/man install
}
