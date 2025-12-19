# Maintainer: Stephen Cox <stephencoxmail@gmail.com>
# Contributor: lorico <lsteinert@uraziel.de>
# Contributor: angelsl <angelsl@in04.sg>
# Contributor: Simon Doppler (dopsi) <dop.simon@gmail.com>

pkgname=firefly-iii
pkgver=6.4.14
pkgrel=2
pkgdesc='PHP personal finances manager'
arch=('any')
url="https://github.com/${pkgname}/${pkgname}"
license=('AGPL-3.0-only')
options=('!strip' '!debug')
depends=('php' 'php-intl' 'php-gd')
optdepends=('php-sqlite: SQLite database support'
            'php-pgsql: PostgreSQL database support'
            'mariadb: MySQL/MariaDB database'
            'postgresql: PostgreSQL database'
            'php-fpm: FastCGI process manager'
            'nginx: web server'
            'apache: web server')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/${pkgname}/${pkgname}/releases/download/v${pkgver}/FireflyIII-v${pkgver}.tar.gz"
        "$pkgname-cron.service"
        "$pkgname-cron.timer")
sha256sums=('8d3a59b1124f7ab552538a397bf4d3e53ba729c893fd7a07b2e53183038bba6d'
            'SKIP'
            'SKIP')

backup=("etc/webapps/$pkgname/config.env")

package() {
    cd "$srcdir"

    install -d "$pkgdir/usr/share/webapps/$pkgname" "$pkgdir/usr/share/licenses/$pkgname" "$pkgdir/etc/webapps/$pkgname"
    cp -rv * "$pkgdir/usr/share/webapps/$pkgname"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    cp -v .env.example "$pkgdir/etc/webapps/$pkgname/config.env"
    ln -s "/etc/webapps/$pkgname/config.env" "$pkgdir/usr/share/webapps/$pkgname/.env"

    rm -rf "$pkgdir/usr/share/webapps/$pkgname/bootstrap/cache"
    install -d "$pkgdir/var/cache/$pkgname"
    ln -s "/var/cache/$pkgname" "$pkgdir/usr/share/webapps/$pkgname/bootstrap/cache"

    mkdir -p "$pkgdir/var/lib"
    mv "$pkgdir/usr/share/webapps/$pkgname/storage" "$pkgdir/var/lib/firefly-iii"
    ln -s "/var/lib/firefly-iii" "$pkgdir/usr/share/webapps/$pkgname/storage"

    install -Dm644 "$srcdir/$pkgname-cron.service" "$pkgdir/usr/lib/systemd/system/$pkgname-cron.service"
    install -Dm644 "$srcdir/$pkgname-cron.timer" "$pkgdir/usr/lib/systemd/system/$pkgname-cron.timer"
}

# vim:ts=4:sw=4:expandtab
