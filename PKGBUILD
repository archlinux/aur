# Maintainer: xiretza <xiretza+aur@gmail.com>
pkgname=lemonldap-ng
pkgver=2.0.8
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
         'perl-xml-simple' 'perl-xml-libxslt' 'perl-crypt-urandom'
         'perl-module-pluggable' 'perl-convert-base32' 'perl-text-unidecode' 'imagemagick')
makedepends=()
checkdepends=('perl-test-output' 'perl-time-fake')
optdepends=('uwsgi-plugin-psgi: for running under uWSGI')
source=("https://release.ow2.org/lemonldap/${pkgname}-${pkgver}.tar.gz")
sha512sums=('85938490fe42b6f644d712c99897228352866ce00b375064cb52b27ce6093eac8b2fcb1781b0e9f40879630af4a57bca71a025859313260108facc60d9bb4f73')

build() {
	cd "$pkgname-$pkgver"
	make configure PERLOPTIONS="INSTALLDIRS=vendor" STORAGECONFFILE="/etc/lemonldap-ng/lemonldap-ng.ini"
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
