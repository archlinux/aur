# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="officelife-git"
pkgver=0.2.0.r53.g8f84294c
pkgrel=1
pkgdesc="Cover the entire employee lifecycle in a single application"
url="https://www.officelife.io/"
license=("BSD3")
arch=("any")
depends=("php>=8.0" "php-intl>=8.0")
makedepends=("composer" "yarn" "git")
optdepends=("mariadb: database"
            "mysql: database"
            "postgresql: database"
            "sqlite3: database"
            "apache: web server"
            "nginx: web server"
            "caddy: web server"
            "redis: cache and session driver")
source=("git+https://github.com/officelifehq/officelife.git")
sha256sums=("SKIP")
backup=("etc/webapps/officelife/config.env")
options=("!strip")

pkgver(){
 cd "officelife"
 git describe --long --tags | sed "s/\([^-]*-g\)/r\1/;s/-/./g;s/^v//"
}

package(){
 cd "officelife"
 composer install --no-interaction --no-suggest --no-dev --ignore-platform-reqs
 yarn install --non-interactive --ignore-optional --ignore-platform
 yarn production

 install -d "$pkgdir/usr/share/webapps/officelife"
 cp -r * "$pkgdir/usr/share/webapps/officelife"

 install -D -m 644 "LICENSE" "$pkgdir/usr/share/licenses/officelife/LICENSE"
 install -D -o root -g http -m 640 ".env.example" "$pkgdir/etc/webapps/officelife/config.env"
 ln -s "/etc/webapps/officelife/config.env" "$pkgdir/usr/share/webapps/officelife/.env"

 # not creating symlinks to /var/cache and /var/lib because they don't seem to work
 chown -R http: "$pkgdir/usr/share/webapps/officelife/bootstrap/cache"
 chown -R http: "$pkgdir/usr/share/webapps/officelife/storage"
 chmod 750  "$pkgdir/usr/share/webapps/officelife/bootstrap/cache"
 chmod 750 "$pkgdir/usr/share/webapps/officelife/storage"
}
