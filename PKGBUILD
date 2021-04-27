# Maintainer: David Wu <xdavidwuph@gmail.com>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=composer1
pkgver=1.10.22
pkgrel=1
pkgdesc="Dependency Manager for PHP, version 1"
arch=('any')
license=('MIT')
url='https://getcomposer.org/'
depends=('php')
makedepends=('git' 'unzip')
source=("${pkgname}::git+https://github.com/composer/composer.git#tag=${pkgver}"
        "${pkgname}-${pkgver}.phar::https://getcomposer.org/download/${pkgver}/composer.phar")
sha256sums=('SKIP'
            '6127ae192d3b56cd6758c7c72fe2ac6868ecc835dae1451a004aca10ab1e0700')

prepare() {
	cd "${srcdir}/${pkgname}"

	php "${srcdir}/${pkgname}-${pkgver}.phar" -n install --no-dev --prefer-dist
}

build() {
	cd "${srcdir}/${pkgname}"

	php -d phar.readonly=Off bin/compile
}

check() {
	cd "${srcdir}"

	mkdir integration-test
	cd integration-test

	php "${srcdir}/${pkgname}/composer.phar" init \
		--no-interaction \
		--type=project \
		--name='archlinux/test' \
		--description='Composer Test Project' \
		--license='GPL-3.0-or-later' \
		--require='symfony/console:*'
	php "${srcdir}/${pkgname}/composer.phar" update --no-interaction --no-progress --prefer-dist
	php "${srcdir}/${pkgname}/composer.phar" validate --no-interaction
}

package() {
	cd "${srcdir}/${pkgname}"

	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm755 composer.phar "${pkgdir}/usr/bin/${pkgname}"
}

