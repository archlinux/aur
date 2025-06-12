# Maintainer: Stephen Cox <stephencoxmail@gmail.com>
# Contributor: lorico <lsteinert@uraziel.de>

_pkgname=data-importer
pkgname=firefly-iii-$_pkgname
pkgver=1.6.3
pkgrel=1
pkgdesc='The Firefly III Data Importer can import data into Firefly III'
arch=('any')
url="https://github.com/firefly-iii/$_pkgname"
license=('custom')
depends=('php>=8.4.0')
makedepends=('composer')
source=("$_pkgname-$pkgver.tar.gz::${url}/releases/download/v${pkgver}/DataImporter-v${pkgver}.tar.gz")
sha256sums=('499785f71707fa172a4078a8608da3505e9d03632d686ba140e77c279d7831d2')

backup=("etc/webapps/$pkgname/config.env")

package(){
    cd "$srcdir"
    COMPOSER_ALLOW_SUPERUSER=1 composer install --no-scripts --no-dev --ignore-platform-reqs

    install -d "$pkgdir/usr/share/webapps/$pkgname" "$pkgdir/usr/share/licenses/$pkgname" "$pkgdir/etc/webapps/$pkgname"
    cp -rv * "$pkgdir/usr/share/webapps/$pkgname"
    install -D "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"

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
