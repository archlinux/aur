# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="ldap-user-manager"
pkgver=1.11
pkgrel=1
pkgdesc="A PHP web-based interface for LDAP user account management and self-service password change"
url="https://github.com/wheelybird/ldap-user-manager"
license=("MIT")
arch=("any")
depends=("php")
makedepends=("composer")
optdepends=("openldap: LDAP server")
source=("$pkgname-$pkgver.tar.gz::https://github.com/wheelybird/ldap-user-manager/archive/refs/tags/v$pkgver.tar.gz"
        "config.env.php")
sha256sums=('71f464670bec4736f2369e7bdba7152887ca2b8be1a593a97456fd46b042a1b5'
            'f38f5fb62435791422dadca7bf683dc12fe2d482f9594a13a6d33df00b72cf28')
backup=("etc/webapps/ldap-user-manager/config.env.php")
options=("!strip")

prepare(){
 # include environmental variables
 cd "$pkgname-$pkgver"
 sed -i "www/includes/config.inc.php" \
     -e 's|<?php|<?php\n\ninclude ("config.env.php");|'
 # user maximum integer available
 sed -i "www/includes/web_functions.inc.php" \
     -e 's|rand(10000000, (int)100000000000);|rand(10000000, mt_getrandmax());|g'
 # install phpmailer and replace its location
 composer require "phpmailer/phpmailer" --no-interaction --ignore-platform-reqs
 sed -i "www/includes/mail_functions.inc.php" \
     -e "s|/opt/PHPMailer/|../vendor/phpmailer/phpmailer/|g"
}

package(){
 cd "$pkgname-$pkgver"
 install -d "$pkgdir/usr/share/webapps/ldap-user-manager"
 cp -r "www"/* "$pkgdir/usr/share/webapps/ldap-user-manager"
 install -D -o root -g http -m 640 "$srcdir/config.env.php" "$pkgdir/etc/webapps/ldap-user-manager/config.env.php"
 ln -s "/etc/webapps/ldap-user-manager/config.env.php" "$pkgdir/usr/share/webapps/ldap-user-manager/includes/config.env.php"
}
