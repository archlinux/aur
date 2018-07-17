# Maintainer: Carlos Silva <r3pek@r3pek.org>

pkgname=mod_authnz_pam
pkgver=1.2.0
pkgrel=1
pkgdesc="Apache module to run PAM authorization on result of other module's authentication; also full Basic Auth PAM provider."
arch=('i686' 'x86_64')
license=('apache-2.0')
url="https://www.adelton.com/apache/mod_authnz_pam/"
depends=('apache'
         'pam')
makedepends=('pkgconfig')
source=("https://github.com/adelton/mod_authnz_pam/archive/${pkgname}-${pkgver}.tar.gz")
sha256sums=('2d0056aefc394607bcdaaa53638c09c100ebd10faaab7cfef29553bfd60b8892')

build() {
	cd "${pkgname}-${pkgver}"
	apxs -c mod_authnz_pam.c -lpam -Wall -pedantic
}

package() {
	cd "${pkgname}-${pkgver}"
	
	APACHE_MOD_DIR=$(apxs -q libexecdir)
	install -D -m755 .libs/mod_authnz_pam.so ${pkgdir}/${APACHE_MOD_DIR}/mod_authnz_pam.so

	APACHE_CONF_DIR=$(apxs -q sysconfdir)
	install -D -m644 authnz_pam.conf ${pkgdir}/${APACHE_CONF_DIR}/extra/authnz_pam.conf
	install -D -m644 authnz_pam.module ${pkgdir}/${APACHE_CONF_DIR}/authnz_pam.conf

	install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
