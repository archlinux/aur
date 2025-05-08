# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname="invoiceninja"
pkgver=5.11.73
pkgrel=1
pkgdesc="Invoices, Expenses and Tasks built with Laravel and Flutter"
url="https://www.invoiceninja.com/"
license=("ELv2")
arch=("any")
depends=("php" "php-gd")
makedepends=("tar")
optdepends=("mariadb: database"
            "apache: web server"
            "nginx: web server"
            "redis: session driver"
            "chromium: pdf generation using snappdf"
           )
source=("$pkgname-$pkgver.tar::https://github.com/$pkgname/$pkgname/releases/download/v$pkgver/$pkgname.tar"
        "$pkgname-queue.service"
        "$pkgname-queue.timer"
        "$pkgname-scheduler.service"
        "$pkgname-scheduler.timer")
sha256sums=('e10f24547a27e12d639be88575c77dcc4ae6ee31129a8c008f3b5b3231034279'
            '2e41b2c94877d29f7abf8912d7bd9a26dd7d003876253c7d49762c6ec9f72ea5'
            'ed7ce9c42bf1de019c4ca43c1a7bfb32e65aae8c6687ce0e5a4474c7e4a7537e'
            'b54a95a349294c93a97832cc88652e46d30692c722906ef4bce99ef4d73e8d33'
            'a72270bdc4bb146cc00fe0162b8d366467eed96582f64a40ec6d8e2bd9a013ba')
noextract=("$pkgname-$pkgver.tar")
backup=("etc/webapps/$pkgname/config.env" "var/lib/$pkgname/config.env")
install="$pkgname.install"
options=("!strip")

prepare(){
 mkdir -p "$pkgname-$pkgver"
 tar xfv "$pkgname-$pkgver.tar" -C "$pkgname-$pkgver"
 cd "$pkgname-$pkgver"

 # create new copy of example configuration file
 cp ".env.example" "config.env"

 # remember to change value
 sed -i "config.env" \
     -e "s|PHANTOMJS_SECRET=.*|# change this value\n&=XXXXXX|" \
     -e "s|UPDATE_SECRET=.*|# change this value\n&=XXXXXX|"

 # provide necessary or useful variables not already included in the configuration file
 cat >> "config.env" << ADDITIONAL_ENV_VARIABLES
# prevent snappdf from downloading chromium, which should be installed from the official repo
SNAPPDF_SKIP_DOWNLOAD=true

# write to /var/lib/invoiceninja/app instead of /usr/share/webapps/invoiceninja/public
FILESYSTEM_DISK=local

# advanced log options
#EXPANDED_LOGGING=false
#LOG_PDF_HTML=false

# change this value
#API_SECRET=XXXXXX

ADDITIONAL_ENV_VARIABLES

 # use canonical binary path
 sed -i "vendor/beganovich/snappdf/src/Command/DownloadChromiumCommand.php" \
     -e 's|return dirname(__FILE__, $level) . "/versions/{$revision}/chrome-linux/chrome";|return "/usr/bin/chromium";|'
}

package(){
 cd "$pkgname-$pkgver"
 # program files
 install -d "$pkgdir/etc/webapps/$pkgname"
 install -d "$pkgdir/usr/share/webapps/$pkgname"
 cp -r * "$pkgdir/usr/share/webapps/$pkgname"
 # configuration (must be writable by the webapp)
 install -D -o http -g http -m 600 "config.env" "$pkgdir/var/lib/$pkgname/config.env"
 ln -s "/var/lib/$pkgname/config.env" "$pkgdir/etc/webapps/$pkgname/config.env"
 ln -s "/var/lib/$pkgname/config.env" "$pkgdir/usr/share/webapps/$pkgname/.env"
 rm "$pkgdir/usr/share/webapps/$pkgname/config.env"
 # cache
 install -d "$pkgdir/var/cache/"
 mv "$pkgdir/usr/share/webapps/$pkgname/bootstrap/cache" "$pkgdir/var/cache/$pkgname"
 ln -s "/var/cache/$pkgname" "$pkgdir/usr/share/webapps/$pkgname/bootstrap/cache"
 chown -R http: "$pkgdir/var/cache/$pkgname"
 chmod 750 "$pkgdir/var/cache/$pkgname"
 # persistent storage and logs
 install -d "$pkgdir/var/lib/"
 mv "$pkgdir/usr/share/webapps/$pkgname/storage" "$pkgdir/var/lib/$pkgname"
 ln -s "/var/lib/$pkgname/storage" "$pkgdir/usr/share/webapps/$pkgname/storage"
 chown -R http: "$pkgdir/var/lib/$pkgname"
 chmod 750 "$pkgdir/var/lib/$pkgname"
 # systemd files
 install -D -m 644 "$srcdir/$pkgname-queue.service" "$pkgdir/usr/lib/systemd/system/$pkgname-queue.service"
 install -D -m 644 "$srcdir/$pkgname-queue.timer" "$pkgdir/usr/lib/systemd/system/$pkgname-queue.timer"
 install -D -m 644 "$srcdir/$pkgname-scheduler.service" "$pkgdir/usr/lib/systemd/system/$pkgname-scheduler.service"
 install -D -m 644 "$srcdir/$pkgname-scheduler.timer" "$pkgdir/usr/lib/systemd/system/$pkgname-scheduler.timer"
 # license
 install -D -m 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
