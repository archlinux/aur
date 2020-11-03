# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="roundcubemail-plugin-carddav"
pkgver=4.0.1
pkgrel=2
pkgdesc="CardDAV plugin for RoundCube Webmailer"
url="https://github.com/blind-coder/rcmcarddav"
license=("GPL2")
arch=("any")
conflicts=("roundcube-rcmcarddav" "roundcube-rcmcarddav-git" "roundcubemail-plugin-carddav-git")
replaces=("roundcube-rcmcarddav")
depends=("roundcubemail")
makedepends=("composer")
source=("$url/releases/download/v$pkgver/carddav-v$pkgver.tgz")
md5sums=("e1b801837689eb18a1703265ee07ac91")
backup=("etc/webapps/roundcubemail/plugins/carddav/config.inc.php")

prepare(){
 cd "carddav"
 # Waiting for https://github.com/blind-coder/rcmcarddav/pull/312 to be released
 sed -i 's|"dealerdirect/phpcodesniffer-composer-installer": "^0.6.0"|"dealerdirect/phpcodesniffer-composer-installer": "^0.7.0"|' "composer.json"
}

build(){
 cd "carddav"
 composer install --no-interaction --no-dev
}

package(){
 cd "carddav"
 install -d "$pkgdir/usr/share/webapps/roundcubemail/plugins/carddav"
 cp -r * "$pkgdir/usr/share/webapps/roundcubemail/plugins/carddav"
 install -D -m 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
 install -D -m 640 -o root -g http "config.inc.php.dist" "$pkgdir/etc/webapps/roundcubemail/plugins/carddav/config.inc.php"
 ln -s "/etc/webapps/roundcubemail/plugins/carddav/config.inc.php" "$pkgdir/usr/share/webapps/roundcubemail/plugins/carddav/config.inc.php"
}
