# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname="invoiceninja"
pkgver=5.1.11
pkgrel=2
pkgdesc="Invoices, Expenses and Tasks built with Laravel and Flutter"
url="https://www.invoiceninja.com"
license=("custom")
arch=("any")
depends=("php" "php-gd" "php-tidy")
makedepends=("composer")
optdepends=("mariadb: database"
            "apache: web server"
            "nginx: web server"
            "redis: cache and session driver"
            "phantomjs: pdf creation")
source=("$pkgname-$pkgver::https://github.com/$pkgname/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=("90d9a68b1fe8f71b154231f8ee75b18ddcc45ad75de3f20274a373456e55463a")
backup=("etc/webapps/$pkgname/config.env")
options=("!strip")

prepare(){
 cd "$pkgname-$pkgver"
 sed -i ".env.example" \
     -e "s|PHANTOMJS_PDF_GENERATION=false|PHANTOMJS_PDF_GENERATION=false\n#PHANTOMJS_BIN_PATH=/usr/bin/phantomjs|"
}

package(){
 cd "$pkgname-$pkgver"
 composer install --no-interaction --no-suggest --no-dev --ignore-platform-reqs

 install -d "$pkgdir/usr/share/webapps/$pkgname"
 cp -r * "$pkgdir/usr/share/webapps/$pkgname"

 install -D -m 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
 install -D -o http -g http -m 600 ".env.example" "$pkgdir/etc/webapps/$pkgname/config.env"
 ln -s "/etc/webapps/$pkgname/config.env" "$pkgdir/usr/share/webapps/$pkgname/.env"

 install -d "$pkgdir/var/cache/"
 mv "$pkgdir/usr/share/webapps/$pkgname/bootstrap/cache" "$pkgdir/var/cache/$pkgname"
 ln -s "/var/cache/$pkgname" "$pkgdir/usr/share/webapps/$pkgname/bootstrap/cache"
 chown -R http: "$pkgdir/var/cache/$pkgname"
 chmod 750 "$pkgdir/var/cache/$pkgname"

 install -d "$pkgdir/var/lib/"
 mv "$pkgdir/usr/share/webapps/$pkgname/storage" "$pkgdir/var/lib/$pkgname"
 ln -s "/var/lib/$pkgname" "$pkgdir/usr/share/webapps/$pkgname/storage"
 chown -R http: "$pkgdir/var/lib/$pkgname"
 chmod 750 "$pkgdir/var/lib/$pkgname"
}
