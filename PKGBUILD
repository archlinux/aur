# Maintainer: tjbp (archlinux@tjbp.net)
# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: pohl7589

pkgname=php56-composer
epoch=1
pkgver=2.2.25
pkgrel=2
pkgdesc="Dependency Manager for PHP 5.6"
arch=('any')
license=('MIT')
url='https://getcomposer.org/'
depends=('php56')
makedepends=('git')
source=(
    "${pkgname}::git+https://github.com/composer/composer.git#tag=${pkgver}"
    'php56.patch'
)
sha256sums=(
    'SKIP'
    'bfaf8a8b4449afa77609f76d73240f23a95cd924768a5bf3d8f7ac1980a15e80'
)

prepare() {
    wget https://raw.githubusercontent.com/composer/getcomposer.org/master/web/installer -O - -q | php56 -- --quiet

    cd ${srcdir}/${pkgname}

    php56 ${srcdir}/composer.phar -n install --no-dev
}

build() {
    cd ${srcdir}/${pkgname}

    patch -p0 < ${srcdir}/php56.patch

    php56 -d phar.readonly=Off bin/compile
}

check() {
    cd ${srcdir}/${pkgname}

    # Install the dev dependencies to run the unit tests
    bin/composer -n install

    patch -p0 < ${srcdir}/phpunit56.patch

    vendor/bin/phpunit
}

package() {
    cd ${srcdir}/${pkgname}

    install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    install -Dm755 composer.phar ${pkgdir}/usr/bin/composer56
}
