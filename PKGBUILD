# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname=monica-git
pkgver=v2.18.0.r159.g0db37fdd
pkgrel=1
pkgdesc="Personal CRM. Remember everything about your friends, family and business relationships"
arch=("any")
url="https://www.monicahq.com/"
license=("AGPL-3.0")
depends=("php>=7.2")
makedepends=("composer")
optdepends=("mariadb: database"
            "mysql: database"
            "apache: web server"
            "nginx: web server"
            "redis: cache and session driver")
source=("git+https://github.com/monicahq/monica.git")
md5sums=("SKIP")
backup=("etc/webapps/monica/config.env")

pkgver(){
 cd "$srcdir/monica"
 git describe --long --tags | sed "s/\([^-]*-g\)/r\1/;s/-/./g"
}

package(){
 cd "$srcdir/monica"
 composer install --no-interaction --no-suggest --no-dev --ignore-platform-reqs

 install -d "$pkgdir/usr/share/webapps/monica"  
 cp -rv * "$pkgdir/usr/share/webapps/monica"
 
 install -d "$pkgdir/usr/share/licenses/monica"
 install -D "$srcdir/monica/LICENSE" "$pkgdir/usr/share/licenses/monica"

 install -d "$pkgdir/etc/webapps/monica"
 install -D .env.example "$pkgdir/etc/webapps/monica/config.env"
 ln -s "/etc/webapps/monica/config.env" "$pkgdir/usr/share/webapps/monica/.env"
 chown root:http "$pkgdir/etc/webapps/monica/config.env"
 chmod 640 "$pkgdir/etc/webapps/monica/config.env"
 
 install -d "$pkgdir/var/cache/"
 mv "$pkgdir/usr/share/webapps/monica/bootstrap/cache" "$pkgdir/var/cache/monica"
 ln -s "/var/cache/monica" "$pkgdir/usr/share/webapps/monica/bootstrap/cache"
 chown -R http: "$pkgdir/var/cache/monica"

 install -d "$pkgdir/var/lib/"
 mv "$pkgdir/usr/share/webapps/monica/storage" "$pkgdir/var/lib/monica"
 ln -s "/var/lib/monica" "$pkgdir/usr/share/webapps/monica/storage"
 chown -R http: "$pkgdir/var/lib/monica"
 chmod 750 "$pkgdir/var/lib/monica"
}
