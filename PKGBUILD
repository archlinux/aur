# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="monica-git"
pkgver=v2.19.1.r262.g124a063fd
pkgrel=1
pkgdesc="Personal CRM. Remember everything about your friends, family and business relationships"
url="https://www.monicahq.com/"
license=("AGPL3")
arch=("any")
depends=("php>=7.2")
makedepends=("composer")
optdepends=("mariadb: database"
            "apache: web server"
            "nginx: web server"
            "redis: cache and session driver")
source=("git+https://github.com/monicahq/monica.git")
sha256sums=("SKIP")
backup=("etc/webapps/monica/config.env")
options=("!strip")

pkgver(){
 cd "monica"
 git describe --long --tags | sed "s/\([^-]*-g\)/r\1/;s/-/./g"
}

package(){
 cd "monica"
 composer install --no-interaction --no-suggest --no-dev --ignore-platform-reqs

 install -d "$pkgdir/usr/share/webapps/monica"
 cp -r * "$pkgdir/usr/share/webapps/monica"

 install -D -m 644 "LICENSE" "$pkgdir/usr/share/licenses/monica/LICENSE"
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
}
