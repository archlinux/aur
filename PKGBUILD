# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="ldap-user-manager"
pkgver=2.2.2
# upstream renamed the project to luminary in 2.0
_srcname=luminary
pkgrel=1
pkgdesc="A PHP web-based interface for LDAP user account management and self-service password change"
url="https://github.com/wheelybird/ldap-user-manager"
license=("MIT")
arch=("any")
depends=("php")
makedepends=("composer")
optdepends=("openldap: LDAP server")
source=("$pkgname-$pkgver.tar.gz::https://github.com/wheelybird/$_srcname/archive/refs/tags/v$pkgver.tar.gz"
        "config.env.php")
sha256sums=('f31f35f783cf8c6f1f7f0b44032f64abed9f3cc2b67e799b831981c8f789bf7f'
            'f38f5fb62435791422dadca7bf683dc12fe2d482f9594a13a6d33df00b72cf28')
backup=("etc/webapps/ldap-user-manager/config.env.php")
options=("!strip")

prepare(){
 # include environmental variables
 cd "$_srcname-$pkgver"
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
 cd "$_srcname-$pkgver"
 install -d "$pkgdir/usr/share/webapps/ldap-user-manager"
 cp -r "www"/* "$pkgdir/usr/share/webapps/ldap-user-manager"
 install -D -o root -g http -m 640 "$srcdir/config.env.php" "$pkgdir/etc/webapps/ldap-user-manager/config.env.php"
 ln -s "/etc/webapps/ldap-user-manager/config.env.php" "$pkgdir/usr/share/webapps/ldap-user-manager/includes/config.env.php"
}
