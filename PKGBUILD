# Maintainer: tjbp (archlinux@tjbp.net)
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=php-composer56
epoch=1
pkgver=1.0.0
pkgrel=1
pkgdesc="Dependency Manager for PHP 5.6"
arch=('any')
license=('MIT')
url='https://getcomposer.org/'
depends=('php56')
makedepends=('git')
source=(
    "${pkgname}::git+https://github.com/composer/composer.git#tag=${pkgver}"
    "${pkgname}-${pkgver}.phar::https://getcomposer.org/download/${pkgver}/composer.phar"
)
sha256sums=(
    'SKIP'
    '1acc000cf23bd9d19e1590c2edeb44fb915f88d85f1798925ec989c601db0bd6'
)

prepare() {
    cd ${srcdir}/${pkgname}

    php56 ${srcdir}/${pkgname}-${pkgver}.phar -n install --no-dev
}

build() {
    cd ${srcdir}/${pkgname}

    patch -p0 < ../../php56.patch

    php56 -d phar.readonly=Off bin/compile
}

check() {
    cd ${srcdir}/${pkgname}

    # Install the dev dependencies to run the unit tests
    bin/composer -n install

    patch -p0 < ../../phpunit56.patch

    vendor/bin/phpunit
}

package() {
    cd ${srcdir}/${pkgname}

    install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    install -Dm755 composer.phar ${pkgdir}/usr/bin/composer
}
