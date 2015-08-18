# Maintainer: Tom Richards <tom@tomrichards.net>
# https://github.com/t-richards/aur-n98-magerun
pkgname=n98-magerun
pkgver=1.97.5
pkgrel=1
pkgdesc="The swiss army knife for Magento developers, sysadmins and devops."
arch=(any)
url="http://magerun.net/"
license=('MIT')
depends=('php')
makedepends=('php' 'php-composer' 'wget' 'git')
backup=("usr/share/$pkgname/php.ini")
source=("https://github.com/netz98/$pkgname/archive/$pkgver.tar.gz"
        "php.ini")
sha256sums=('b6e7f8db86c393a6227c13af339a4de369618c7e70fac6f2838223a90208e296'
            'd60d6f4a53854ce9b7b638044f498f1b1a269615f0e5310653632aab4c61b909')

prepare() {
    cd "$pkgname-$pkgver"

    sed -i build.xml \
        -e 's|./composer.phar|composer|g' \
        -e 's|gzip|none|g'
    sed "s~^#!/usr/bin/env php~#!/usr/bin/php -nc/usr/share/$pkgname/php.ini~g" -i build/_cli_stub.php

    composer install
    composer -d=build install
}

build() {
    cd "$pkgname-$pkgver"
    php -nc "$srcdir/php.ini" -f build/vendor/bin/phing -- -verbose dist
}

check() {
    cd "$pkgname-$pkgver"
    php -nc "$srcdir/php.ini" -f vendor/bin/phpunit -- --debug --stop-on-error --stop-on-failure
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm644 MIT-LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 ../php.ini "$pkgdir/usr/share/$pkgname/php.ini"
    install -Dm755 n98-magerun.phar "$pkgdir/usr/bin/n98-magerun"
}
