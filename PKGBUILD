# Maintainer: Carlos Silva <r3pek@r3pek.org>

pkgname=mod_intercept_form_submit
pkgver=1.1.0
pkgrel=1
pkgdesc="Apache module to intercept application's login form submission and run PAM authentication."
arch=('i686' 'x86_64')
license=('apache-2.0')
url="https://www.adelton.com/apache/mod_intercept_form_submit/"
depends=('apache'
		'mod_authnz_pam'
		'pam')
makedepends=('pkgconfig')
source=(https://fedorapeople.org/cgit/adelton/public_git/mod_intercept_form_submit.git/snapshot/${pkgname}-${pkgver}.tar.xz)
sha1sums=('0698fd4d67a837d03f32d049bb75f1eda7ef13c3')

build() {
	cd "${pkgname}-${pkgver}"
	apxs -c mod_intercept_form_submit.c -lpam -Wall -pedantic
}

package() {
	cd "${pkgname}-${pkgver}"
	
	APACHE_MOD_DIR=$(apxs -q libexecdir)
	install -D -m755 .libs/mod_intercept_form_submit.so	${pkgdir}/${APACHE_MOD_DIR}/mod_intercept_form_submit.so

	APACHE_CONF_DIR=$(apxs -q sysconfdir)
	install -D -m644 intercept_form_submit.conf	${pkgdir}/${APACHE_CONF_DIR}/extra/intercept_form_submit.conf
	install -D -m644 intercept_form_submit.module ${pkgdir}/${APACHE_CONF_DIR}/intercept_form_submit.conf

	install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
