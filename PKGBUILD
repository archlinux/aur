# Maintainer: Martin Rys <rys.pw/contact>

pkgname=bookstack
_camelname=BookStack
pkgver=22.11.1
pkgrel=1
pkgdesc='A simple, self-hosted, easy-to-use platform for organising and storing information'
arch=('any')
url="https://github.com/BookStackApp/BookStack"
license=('MIT')
depends=(
    'php'
    'php-gd'
    'php-fpm'
)
makedepends=('composer')
source=("$pkgname-$pkgver.tar.gz::https://github.com/BookStackApp/BookStack/archive/v${pkgver}.tar.gz")
sha256sums=('b5110588684e8a0fdcca5bb08d7ae0558a73a2a3bf8abbbad2b947e6d2f3bc4c')
options=('!strip')
backup=("etc/webapps/$pkgname/config.env")

package() {
    cd "$srcdir/$_camelname-$pkgver"
    COMPOSER_ALLOW_SUPERUSER=1 composer install --no-dev --ignore-platform-reqs --no-interaction

    install -d "$pkgdir/usr/share/webapps/$pkgname" "$pkgdir/usr/share/licenses/$pkgname" "$pkgdir/etc/webapps/$pkgname"
    cp -r * "$pkgdir/usr/share/webapps/$pkgname"
    install -D "$srcdir/$_camelname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"

    cp .env.example "$pkgdir/etc/webapps/$pkgname/config.env"

    ln -s "/etc/webapps/$pkgname/config.env" "$pkgdir/usr/share/webapps/$pkgname/.env"
    rm -rf "$pkgdir/usr/share/webapps/$pkgname/bootstrap/cache"

    mkdir -p "$pkgdir/var/cache/$pkgname"
    chown http:http "$pkgdir/var/cache/$pkgname"
    ln -s "/var/cache/$pkgname" "$pkgdir/usr/share/webapps/$pkgname/bootstrap/cache"

    mkdir -p "$pkgdir/var/lib"
    mv "$pkgdir/usr/share/webapps/$pkgname/storage" "$pkgdir/var/lib/$pkgname"
    chown -R http:http "$pkgdir/var/lib/$pkgname"
    chmod 775 "$pkgdir/var/lib/$pkgname"
    ln -s "/var/lib/$pkgname" "$pkgdir/usr/share/webapps/$pkgname/storage"
}
