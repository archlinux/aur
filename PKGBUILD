# Maintainer: lorico <lorenz@steinerts.de>

_pkgname=data-importer
pkgname=firefly-iii-$_pkgname
pkgver=1.2.2
pkgrel=1
pkgdesc='The Firefly III Data Importer can import data into Firefly III'
arch=('any')
url="https://github.com/firefly-iii/$_pkgname"
license=('custom')
makedepends=('composer')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/firefly-iii/$_pkgname/archive/v${pkgver}.tar.gz")
sha256sums=('2e69f8b68ab8fd0f078e585feb2128b99bf2dd3088c057d2dbd1c75a20860732')

package(){
    cd "$srcdir/$_pkgname-$pkgver"
    COMPOSER_ALLOW_SUPERUSER=1 composer install --no-scripts --no-dev --ignore-platform-reqs

    install -d "$pkgdir/usr/share/webapps/$pkgname" "$pkgdir/usr/share/licenses/$pkgname" "$pkgdir/etc/webapps/$pkgname"
    cp -rv * "$pkgdir/usr/share/webapps/$pkgname"
    install -D "$srcdir/$_pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"

    cp -v .env.example "$pkgdir/etc/webapps/$pkgname/.env"
    mv -v "$pkgdir/etc/webapps/$pkgname/.env" "$pkgdir/etc/webapps/$pkgname/config.env"

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
