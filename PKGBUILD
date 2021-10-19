# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Matthew Gamble <git@matthewgamble.net>

pkgname="monica-git"
pkgver=3.3.1.r30.g2b37ad1c4
pkgrel=1
pkgdesc="Personal CRM. Remember everything about your friends, family and business relationships"
url="https://www.monicahq.com/"
license=("AGPL3")
arch=("any")
depends=("php7>=7.4" "php7-intl" "mariadb")
makedepends=("composer" "yarn" "git")
optdepends=("apache: web server"
            "caddy: web server"
            "nginx: web server"
            "redis: cache and session driver"
            "php7-redis: cache and session driver")
source=("git+https://github.com/monicahq/monica.git"
        "monica-scheduler.service"
        "monica-scheduler.timer")
sha256sums=('SKIP'
            '18eafdbf815189d00ac3d79ced030903b4b599492a16d2553d6759ed4f13ff30'
            '702ca06bf7922996aebb862fe962f137489fb92cdd99fb2cc25e8bb120f55755')
backup=("etc/webapps/monica/config.env")
options=("!strip")
install="monica.install"

pkgver(){
 cd "monica"
 git describe --long --tags | sed "s/\([^-]*-g\)/r\1/;s/-/./g;s/^v//"
}

package(){
 cd "monica"
 composer install --no-interaction --no-suggest --no-dev --ignore-platform-reqs
 yarn install
 yarn run production

 install -d "$pkgdir/usr/share/webapps/monica"
 cp -r * "$pkgdir/usr/share/webapps/monica"

 install -D -o root -g http -m 640 ".env.example" "$pkgdir/etc/webapps/monica/config.env"
 ln -s "/etc/webapps/monica/config.env" "$pkgdir/usr/share/webapps/monica/.env"

 install -d "$pkgdir/var/cache/"
 mv "$pkgdir/usr/share/webapps/monica/bootstrap/cache" "$pkgdir/var/cache/monica"
 ln -s "/var/cache/monica" "$pkgdir/usr/share/webapps/monica/bootstrap/cache"
 chown -R http: "$pkgdir/var/cache/monica"
 chmod 750 "$pkgdir/var/cache/monica"

 install -d "$pkgdir/var/lib/"
 mv "$pkgdir/usr/share/webapps/monica/storage" "$pkgdir/var/lib/monica"
 ln -s "/var/lib/monica" "$pkgdir/usr/share/webapps/monica/storage"
 chown -R http: "$pkgdir/var/lib/monica"
 chmod 750 "$pkgdir/var/lib/monica"

 install -D -m 644 "$srcdir/monica-scheduler.service" "$pkgdir/usr/lib/systemd/system/monica-scheduler.service"
 install -D -m 644 "$srcdir/monica-scheduler.timer" "$pkgdir/usr/lib/systemd/system/monica-scheduler.timer"
}
