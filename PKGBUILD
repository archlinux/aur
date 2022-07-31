# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Moses Narrow <moe_narrow@use.startmail.com>

pkgname="pterodactyl-panel"
pkgver=1.10.1
pkgrel=1
pkgdesc="An open-source game server management panel"
url="https://pterodactyl.io/"
license=("MIT")
arch=("any")
depends=("mariadb" "php" "php-gd" "redis")
source=("$pkgname-$pkgver.tar.gz::https://github.com/pterodactyl/panel/releases/download/v$pkgver/panel.tar.gz"
        "pterodactyl-queue.service"
        "pterodactyl-scheduler.service"
        "pterodactyl-scheduler.timer")
sha256sums=('29cbc3f90d4a3cb2ae821ed22fb4b9794b53e023dc294489504bd012b17f886a'
            '0f6e444671802f5fc162380a6c6116adf845156704e035170dcc3cea80307bc6'
            '4e98afb6d923c1f74048e9fc633694702ed60c192550cd50693bebacab18e791'
            'd627c8beb19d3203432958103c8565355b41f92bf2e34a2e11f4662d97996cf6')
noextract=("$pkgname-$pkgver.tar.gz")
backup=("etc/webapps/pterodactyl/config.env")
options=("!strip")

package(){
 # extract the archive content in a dedicated folder
 install -d "$pkgname-$pkgver"
 tar -xf "$pkgname-$pkgver.tar.gz" -C "$pkgname-$pkgver"
 cd "$pkgname-$pkgver"
 # program files
 install -d "$pkgdir/usr/share/webapps/pterodactyl"
 cp -r * "$pkgdir/usr/share/webapps/pterodactyl"
 # configuration
 install -D -o root -g http -m 640 ".env.example" "$pkgdir/etc/webapps/pterodactyl/config.env"
 ln -s "/etc/webapps/pterodactyl/config.env" "$pkgdir/usr/share/webapps/pterodactyl/.env"
 # temporary cache
 install -d "$pkgdir/var/cache/"
 mv "$pkgdir/usr/share/webapps/pterodactyl/bootstrap/cache" "$pkgdir/var/cache/pterodactyl"
 ln -s "/var/cache/pterodactyl" "$pkgdir/usr/share/webapps/pterodactyl/bootstrap/cache"
 chown -R http: "$pkgdir/var/cache/pterodactyl"
 chmod 750 "$pkgdir/var/cache/pterodactyl"
 # persistent storage
 install -d "$pkgdir/var/lib/"
 mv "$pkgdir/usr/share/webapps/pterodactyl/storage" "$pkgdir/var/lib/pterodactyl"
 ln -s "/var/lib/pterodactyl" "$pkgdir/usr/share/webapps/pterodactyl/storage"
 chown -R http: "$pkgdir/var/lib/pterodactyl"
 chmod 750 "$pkgdir/var/lib/pterodactyl"
 # systemd files
 install -D -m 644 "$srcdir/pterodactyl-queue.service" "$pkgdir/usr/lib/systemd/system/pterodactyl-queue.service"
 install -D -m 644 "$srcdir/pterodactyl-scheduler.service" "$pkgdir/usr/lib/systemd/system/pterodactyl-scheduler.service"
 install -D -m 644 "$srcdir/pterodactyl-scheduler.timer" "$pkgdir/usr/lib/systemd/system/pterodactyl-scheduler.timer"
}
