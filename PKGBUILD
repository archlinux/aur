# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="simplesamlphp"
pkgver=2.0.3
pkgrel=1
pkgdesc="Authentication and federation application supporting several protocols"
url="https://simplesamlphp.org/"
license=("LGPL2.1")
arch=("any")
depends=("php")
depends=("composer")
source=("$pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e31a9e4333906711672f2ab641c4665332d4a69c5310330556d52042d1d91d7a')
backup=("etc/webapps/$pkgname/config/acl.php"
        "etc/webapps/$pkgname/config/authsources.php"
        "etc/webapps/$pkgname/config/config.php"
        "etc/webapps/$pkgname/metadata/saml20-idp-hosted.php"
        "etc/webapps/$pkgname/metadata/saml20-idp-remote.php"
        "etc/webapps/$pkgname/metadata/saml20-sp-remote.php"
       )
options=("!strip")

prepare(){
 cd "$pkgname-$pkgver"
 # use private folder
 sed -i "config/config.php.dist" \
     -e "s|'logging.handler' => 'syslog',|'logging.handler' => 'file',|" \
     -e "s|/var/simplesamlphp/mdq-cache|cache|g" \
     -e "s|/var/simplesamlphp/cert|cert|g" \
     -e "s|/var/data|data|g" \
     -e "s|/var/log|log|g" \
     -e "s|/tmp/simplesaml|tmp|g"
}

build(){
 cd "$pkgname-$pkgver"
 # find additional modules here: https://github.com/orgs/simplesamlphp/repositories?q=simplesamlphp-module&type=all&language=&sort=
 # some modules may result in additional files under /etc/webapps/simplesamlphp/, add these files to the "backup" array above to avoid overriding them
 # using asterisk because it could fail as new versions may fail due to conflicting dependencies
 composer require "predis/predis:*" --update-no-dev --ignore-platform-reqs
 composer require "simplesamlphp/simplesamlphp-module-ldap:*" --update-no-dev --ignore-platform-reqs
 composer install --no-interaction --no-dev --ignore-platform-reqs
}

package(){
 cd "$pkgname-$pkgver"
 # program files
 install -d "$pkgdir/usr/share/webapps/$pkgname"
 cp -r {attributemap,bin,lib,locales,modules,public,routing,templates,vendor} "$pkgdir/usr/share/webapps/$pkgname"
 # persistent storage
 install -d "$pkgdir/var/lib/$pkgname/"{cert,cache,data,log,log/stats,tmp}
 ln -s "/var/lib/$pkgname/"{cert,cache,data,log,tmp} "$pkgdir/usr/share/webapps/$pkgname"
 chown -R http:http "$pkgdir/var/lib/$pkgname"
 find "$pkgdir/var/lib/$pkgname" -type d -exec chmod 700 {} \;
 # configuration
 install -d "$pkgdir/etc/webapps/$pkgname/"{config,metadata}
 install -D -m 664 "config/acl.php.dist" "$pkgdir/etc/webapps/$pkgname/config/acl.php"
 install -D -m 664 "config/authsources.php.dist" "$pkgdir/etc/webapps/$pkgname/config/authsources.php"
 install -D -m 664 "config/config.php.dist" "$pkgdir/etc/webapps/$pkgname/config/config.php"
 install -D -m 664 "metadata/saml20-idp-hosted.php.dist" "$pkgdir/etc/webapps/$pkgname/metadata/saml20-idp-hosted.php"
 install -D -m 664 "metadata/saml20-idp-remote.php.dist" "$pkgdir/etc/webapps/$pkgname/metadata/saml20-idp-remote.php"
 install -D -m 664 "metadata/saml20-sp-remote.php.dist" "$pkgdir/etc/webapps/$pkgname/metadata/saml20-sp-remote.php"
 ln -s "/etc/webapps/$pkgname/config" "$pkgdir/usr/share/webapps/$pkgname/config"
 ln -s "/etc/webapps/$pkgname/metadata" "$pkgdir/usr/share/webapps/$pkgname/metadata"
 chown -R root:http "$pkgdir/etc/webapps/$pkgname"
 find "$pkgdir/etc/webapps/$pkgname" -type d -exec chmod 750 {} \;
 find "$pkgdir/etc/webapps/$pkgname" -type f -exec chmod 640 {} \;
}
