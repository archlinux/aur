# Maintainer: tjbp (archlinux@tjbp.net)
# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: pohl7589

pkgname=php56-composer
epoch=1
pkgver=1.9.0
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
    'phpunit56.patch'
)
sha256sums=(
    'SKIP'
    '9514fe689925720256dc94f7d0a4ea7a0f232f5bd76dbb08dfdd48a691ec4ee5'
    'fc5dfa06b58369c17d44eff9a595eaf8ed7dadef184da1fea06ae3562b8af24f'
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
