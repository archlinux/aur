# Maintainer: BlackCatDevel0per <bcdev@mail.ru>
# https://github.com/BlackCatDevel0per

pkgname=php82-composer
epoch=1
pkgver=2.5.5
pkgrel=2
pkgdesc="Dependency Manager for PHP 8.2 (php82)"
arch=('any')
license=('MIT')
url='https://getcomposer.org/'
depends=('php82')
makedepends=('git')
source=(
    "${pkgname}::git+https://github.com/composer/composer.git#tag=${pkgver}"
    'php82.patch'
)
sha256sums=(
    'SKIP'
    '55f34e12df1e93d8658d250fb59f3d6a0b34bbea35a024851acb413a24b54fcf'
)

prepare() {
    wget https://raw.githubusercontent.com/composer/getcomposer.org/master/web/installer -O - -q | php82 -- --quiet

    cd ${srcdir}/${pkgname}

    php82 ${srcdir}/composer.phar -n install --no-dev
}

build() {
    cd ${srcdir}/${pkgname}

    patch -p0 < ${srcdir}/php82.patch

    php82 -d phar.readonly=Off bin/compile
}

check() {
    cd ${srcdir}/${pkgname}

    # Install the dev dependencies to run the unit tests
    bin/composer -n install
}

package() {
    cd ${srcdir}/${pkgname}

    install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    install -Dm755 composer.phar ${pkgdir}/usr/bin/composer82
}
