# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="simplesamlphp"
_pkgver=2.0.0-beta.4
pkgver="${_pkgver/-/}"
pkgrel=1
pkgdesc="Authentication and federation application supporting several protocols"
url="https://simplesamlphp.org/"
license=("LGPL2.1")
arch=("any")
depends=("php")
depends=("composer" "npm")
source=("$pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname/archive/refs/tags/v$_pkgver.tar.gz")
sha256sums=('485559d822b0ae24ba4e98c4ab95d8b7af7da66747a379b13b9c3ec4fca530f5')
backup=("etc/webapps/$pkgname/config/acl.php"
        "etc/webapps/$pkgname/config/authsources.php"
        "etc/webapps/$pkgname/config/config.php"
        "etc/webapps/$pkgname/metadata/saml20-idp-hosted.php"
        "etc/webapps/$pkgname/metadata/saml20-idp-remote.php"
        "etc/webapps/$pkgname/metadata/saml20-sp-remote.php"
       )
options=("!strip")

prepare(){
 cd "$pkgname-$_pkgver"
 # use private folder
 sed -i "config-templates/config.php" \
     -e "s|'logging.handler' => 'syslog',|'logging.handler' => 'file',|" \
     -e "s|'tempdir' => '/tmp/simplesaml',|'tempdir' => 'tmp/',|"
}

build(){
 cd "$pkgname-$_pkgver"
 # backend
 # find additional modules here: https://github.com/orgs/simplesamlphp/repositories?q=simplesamlphp-module&type=all&language=&sort=
 # some modules may result in additional files under /etc/webapps/simplesamlphp/, add these files to the "backup" array above to avoid overriding them
 # using asterisk because it could fail as new versions may fail due to conflicting dependencies
 composer require "predis/predis:*" --update-no-dev --ignore-platform-reqs
 composer require "simplesamlphp/simplesamlphp-module-ldap:*" --update-no-dev --ignore-platform-reqs
 # [...]
 composer install --no-interaction --no-dev --ignore-platform-reqs
 # frontend
 npm install
 npm run build
}

package(){
 cd "$pkgname-$_pkgver"
 # program files
 install -d "$pkgdir/usr/share/webapps/$pkgname"
 cp -r {attributemap,bin,lib,locales,modules,schemas,templates,vendor,www} "$pkgdir/usr/share/webapps/$pkgname"
 # persistent storage
 install -d "$pkgdir/var/lib/$pkgname/"{cert,data,log,tmp}
 ln -s "/var/lib/$pkgname/"{cert,data,log,tmp} "$pkgdir/usr/share/webapps/$pkgname"
 chown -R http:http "$pkgdir/var/lib/$pkgname"
 find "$pkgdir/var/lib/$pkgname" -type d -exec chmod 700 {} \;
 # configuration
 install -d "$pkgdir/etc/webapps/$pkgname"
 cp -r "config-templates" "$pkgdir/etc/webapps/$pkgname/config"
 cp -r "metadata-templates" "$pkgdir/etc/webapps/$pkgname/metadata"
 ln -s "/etc/webapps/$pkgname/config" "$pkgdir/usr/share/webapps/$pkgname"
 ln -s "/etc/webapps/$pkgname/metadata" "$pkgdir/usr/share/webapps/$pkgname"
 chown -R root:http "$pkgdir/etc/webapps/$pkgname"
 find "$pkgdir/etc/webapps/$pkgname" -type d -exec chmod 750 {} \;
 find "$pkgdir/etc/webapps/$pkgname" -type f -exec chmod 640 {} \;
}
