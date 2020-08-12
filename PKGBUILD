# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname=monica-git
_pkgname=monica
pkgver=v2.18.0.r159.g0db37fdd7
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
backup=("etc/webapps/$_pkgname/config.env")

pkgver(){
 cd "$_pkgname"
 git describe --long --tags | sed "s/\([^-]*-g\)/r\1/;s/-/./g"
}

package(){
 cd "$srcdir/$_pkgname"
 composer install --no-interaction --no-suggest --no-dev --ignore-platform-reqs

 install -d "$pkgdir/usr/share/webapps/$_pkgname" "$pkgdir/usr/share/licenses/$_pkgname" "$pkgdir/etc/webapps/$_pkgname"
 cp -rv * "$pkgdir/usr/share/webapps/$_pkgname"
 install -D "$srcdir/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname"

 cp -v .env.example "$pkgdir/etc/webapps/$_pkgname/config.env"
 ln -s "/etc/webapps/$_pkgname/config.env" "$pkgdir/usr/share/webapps/$_pkgname/.env"
 chown http: "$pkgdir/etc/webapps/$_pkgname/config.env"
 chmod 660 "$pkgdir/etc/webapps/$_pkgname/config.env"
 
 rm -rf "$pkgdir/usr/share/webapps/$_pkgname/bootstrap/cache"
 mkdir -p "$pkgdir/var/cache/$_pkgname"
 chown http:http "$pkgdir/var/cache/$_pkgname"
 ln -s "/var/cache/$_pkgname" "$pkgdir/usr/share/webapps/$_pkgname/bootstrap/cache"

 mkdir -p "$pkgdir/var/lib"
 mv "$pkgdir/usr/share/webapps/$_pkgname/storage" "$pkgdir/var/lib/$_pkgname"
 chown -R http: "$pkgdir/var/lib/$_pkgname"
 chmod 775 "$pkgdir/var/lib/$_pkgname"
 ln -s "/var/lib/$_pkgname" "$pkgdir/usr/share/webapps/$_pkgname/storage"
}
