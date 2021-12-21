# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname="invoiceninja"
pkgver=5.3.39
pkgrel=1
pkgdesc="Invoices, Expenses and Tasks built with Laravel and Flutter"
url="https://www.invoiceninja.com/"
license=("ELv2")
arch=("any")
depends=("php" "php-gd")
makedepends=("unzip")
optdepends=("mariadb: database"
            "apache: web server"
            "nginx: web server"
            "redis: cache and session driver"
            "at-spi2-atk: pdf creation"
            "atk: pdf creation"
            "gtk3: pdf creation"
            "mesa: pdf creation"
            "nss: pdf creation")
source=("$pkgname-$pkgver.zip::https://github.com/$pkgname/$pkgname/releases/download/v$pkgver/$pkgname.zip"
        "$pkgname-queue.service"
        "$pkgname-queue.timer"
        "$pkgname-scheduler.service"
        "$pkgname-scheduler.timer")
sha256sums=('a8d644c4e4a6c3f6f9a1492af8818ea27ac3c1a8dfa32ca2deefe6089dcc9109'
            '2e41b2c94877d29f7abf8912d7bd9a26dd7d003876253c7d49762c6ec9f72ea5'
            'ed7ce9c42bf1de019c4ca43c1a7bfb32e65aae8c6687ce0e5a4474c7e4a7537e'
            'b54a95a349294c93a97832cc88652e46d30692c722906ef4bce99ef4d73e8d33'
            'a72270bdc4bb146cc00fe0162b8d366467eed96582f64a40ec6d8e2bd9a013ba')
noextract=("$pkgname-$pkgver.zip")
backup=("etc/webapps/$pkgname/config.env")
options=("!strip")

prepare(){
 unzip -q -f "$pkgname-$pkgver.zip" -d "$pkgname-$pkgver"
 cd "$pkgname-$pkgver"
 # specify the newer pdf generator
 sed -i ".env.example" \
     -e "s|PDF_GENERATOR=phantom|PDF_GENERATOR=snappdf|"
}

package(){
 cd "$pkgname-$pkgver"
 # program files
 install -d "$pkgdir/usr/share/webapps/$pkgname"
 cp -r * "$pkgdir/usr/share/webapps/$pkgname"
 # configuration and license
 install -D -m 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
 install -D -o http -g http -m 640 ".env.example" "$pkgdir/etc/webapps/$pkgname/config.env"
 ln -s "/etc/webapps/$pkgname/config.env" "$pkgdir/usr/share/webapps/$pkgname/.env"
 # cachephp /srv/http/hosts/invoiceninja/artisan schedule:run >> /dev/null 2>&1
 install -d "$pkgdir/var/cache/"
 mv "$pkgdir/usr/share/webapps/$pkgname/bootstrap/cache" "$pkgdir/var/cache/$pkgname"
 ln -s "/var/cache/$pkgname" "$pkgdir/usr/share/webapps/$pkgname/bootstrap/cache"
 chown -R http: "$pkgdir/var/cache/$pkgname"
 chmod 750 "$pkgdir/var/cache/$pkgname"
 # persistent storage
 install -d "$pkgdir/var/lib/"
 mv "$pkgdir/usr/share/webapps/$pkgname/storage" "$pkgdir/var/lib/$pkgname"
 ln -s "/var/lib/$pkgname" "$pkgdir/usr/share/webapps/$pkgname/storage"
 chown -R http: "$pkgdir/var/lib/$pkgname"
 chmod 750 "$pkgdir/var/lib/$pkgname"
 # systemd files
 install -D -m 644 "$srcdir/$pkgname-queue.service" "$pkgdir/usr/lib/systemd/system/$pkgname-queue.service"
 install -D -m 644 "$srcdir/$pkgname-queue.timer" "$pkgdir/usr/lib/systemd/system/$pkgname-queue.timer"
 install -D -m 644 "$srcdir/$pkgname-scheduler.service" "$pkgdir/usr/lib/systemd/system/$pkgname-scheduler.service"
 install -D -m 644 "$srcdir/$pkgname-scheduler.timer" "$pkgdir/usr/lib/systemd/system/$pkgname-scheduler.timer"
}
