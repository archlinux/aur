# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Moses Narrow <moe_narrow@use.startmail.com>

pkgname="pterodactyl-panel"
pkgver=1.11.5
pkgrel=2
pkgdesc="An open-source game server management panel"
url="https://pterodactyl.io/"
license=("MIT")
arch=("any")
depends=("php"
         "php-gd"
         "php-sodium")
optdepends=("redis: cache"
            "mariadb: database")
makedepends=("composer")
source=("$pkgname-$pkgver.tar.gz::https://github.com/pterodactyl/panel/releases/download/v$pkgver/panel.tar.gz"
        "pterodactyl-queue.service"
        "pterodactyl-scheduler.service"
        "pterodactyl-scheduler.timer")
b2sums=('292d9142cd69f728642c3be82c8e703e01efdf9b0b74b95b0fd4c65b6c7a627df2cce1311c9b8c316ab075622206250be512e664d880cc496b321b4460577240'
        'c59cd8370e4360538038fa2a6daac10c327407c3c2e71b1d9b60b107c2f69ab5377f22d4d8e00c7e0cdc9c882aa0ae663531f4ee12e39cc58e20ef66d5e4d48e'
        '38fa485a2d71cb9e7b5d181ded53bc9e228628cafb854ca9bd7087895b42af78b735c636840e3f2f74abdad03fa4682cc81d5b34972498ddbaf41a6f784469a2'
        '8924479c22eaff27483d0d85ec2c2385193d754adac6b655e0ef986bec1ab871c4a269f511b8f4a2b98b5f89ee45d0ed300ce1f632a2d33a2e0260e8e4a66ad7')
# extract later the archive content in a dedicated folder
# otherwise it will extract everything in "$srcdir"
noextract=("$pkgname-$pkgver.tar.gz")
backup=("etc/webapps/pterodactyl/config.env")
options=("!strip")

build(){
 # extract here the archive content in a dedicated folder
 # otherwise it will extract everything in "$srcdir"
 install -d "$pkgname-$pkgver"
 tar -xf "$pkgname-$pkgver.tar.gz" -C "$pkgname-$pkgver"
 cd "$pkgname-$pkgver"
 # download vendor files
 composer install --no-interaction --no-dev --ignore-platform-reqs
}

package(){
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
 rm "$pkgdir/usr/share/webapps/pterodactyl/storage/logs/laravel-"*
 mv "$pkgdir/usr/share/webapps/pterodactyl/storage" "$pkgdir/var/lib/pterodactyl"
 ln -s "/var/lib/pterodactyl" "$pkgdir/usr/share/webapps/pterodactyl/storage"
 chown -R http: "$pkgdir/var/lib/pterodactyl"
 chmod 750 "$pkgdir/var/lib/pterodactyl"
 # systemd files
 install -D -m 644 "$srcdir/pterodactyl-queue.service" "$pkgdir/usr/lib/systemd/system/pterodactyl-queue.service"
 install -D -m 644 "$srcdir/pterodactyl-scheduler.service" "$pkgdir/usr/lib/systemd/system/pterodactyl-scheduler.service"
 install -D -m 644 "$srcdir/pterodactyl-scheduler.timer" "$pkgdir/usr/lib/systemd/system/pterodactyl-scheduler.timer"
}
