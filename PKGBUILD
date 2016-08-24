# Maintainer: tjbp (archlinux@tjbp.net)
# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: pohl7589

pkgname=php56-composer
epoch=1
pkgver=1.2.0
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
    'php56.patch'
    'phpunit56.patch'
)
sha256sums=(
    'SKIP'
    'dc80131545ed7f7b1369ae058824587f0718892f6a84bd86cfb0f28ab5e39095'
    '9514fe689925720256dc94f7d0a4ea7a0f232f5bd76dbb08dfdd48a691ec4ee5'
    'fc5dfa06b58369c17d44eff9a595eaf8ed7dadef184da1fea06ae3562b8af24f'
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
    install -Dm755 composer.phar ${pkgdir}/usr/bin/composer56
}
