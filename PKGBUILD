# Maintainer: xiretza <xiretza+aur@gmail.com>
pkgname=lemonldap-ng
pkgver=2.0.10
pkgrel=1
pkgdesc="A modular WebSSO (Single Sign On) based on Apache::Session modules"
arch=(any)
url="https://lemonldap-ng.org/"
license=('GPL')
depends=('perl-apache-session' 'perl-cache-cache' 'perl-clone' 'perl-config-inifiles' 'perl-convert-pem'
         'perl-crypt-openssl-bignum' 'perl-crypt-openssl-rsa' 'perl-crypt-openssl-x509'
         'perl-crypt-rijndael' 'perl-dbi' 'perl-digest-hmac' 'perl-email-sender' 'perl-gd-securityimage'
         'perl-html-template' 'perl-io-string' 'perl-json' 'perl-mime-tools' 'perl-mouse'
         'perl-ldap' 'perl-plack' 'perl-regexp-assemble' 'perl-regexp-common' 'perl-soap-lite'
         'perl-string-random' 'perl-unicode-string' 'perl-uri' 'perl-libwww' 'perl-lwp-protocol-https'
         'perl-xml-simple' 'perl-xml-libxslt' 'perl-crypt-urandom' 'perl-json-xs'
         'perl-module-pluggable' 'perl-convert-base32' 'perl-text-unidecode' 'imagemagick')
makedepends=('uglify-js' 'python-sphinx' 'python-sphinx-bootstrap-theme')
checkdepends=('perl-test-output' 'perl-time-fake')
optdepends=('uwsgi-plugin-psgi: for running under uWSGI')
source=("https://release.ow2.org/lemonldap/${pkgname}-${pkgver}.tar.gz")
sha512sums=('66510544809eb7c022d8ad2b2710c29587ba20da436a2a97748533c37657a5fcf353a67dd51156eeb3f6785370593f65796ec61fe437d20144dff6eab85d0a80')

prepare() {
	cd "$pkgname-$pkgver"
	make configure PERLOPTIONS="INSTALLDIRS=vendor" STORAGECONFFILE="/etc/lemonldap-ng/lemonldap-ng.ini"
}

build() {
	cd "$pkgname-$pkgver"
	make
}

check() {
	cd "$pkgname-$pkgver"
	make -k test
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" PREFIX="/usr/share" PROD=yes install
	chown -R http:http "$pkgdir"/usr/share/lemonldap-ng/data/{captcha,conf,notifications,psessions,sessions}
	chmod -R 755 "$pkgdir"/usr/share/lemonldap-ng/data/{captcha,conf,notifications,psessions,sessions}
}
