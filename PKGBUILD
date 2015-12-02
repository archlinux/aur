# Mantainer: Bruno Galeotti <bgaleotti at gmail dot com>
# Contributor: Stefan Auditor <stefan.auditor@erdfisch.de>

pkgname=php-cs-fixer
_pkgname=PHP-CS-Fixer
pkgver=1.10.1
pkgrel=1
pkgdesc="Analyzes some PHP source code and tries to fix coding standards issues (PSR-1 and PSR-2 compatible)."
url="http://cs.sensiolabs.org/"
license="MIT"
arch=("any")
depends=("php>=5.3.6")
makedepends=("php-box" "php-composer")
install="${pkgname}.install"
source=("https://github.com/FriendsOfPHP/${_pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('3c85e269f6bd808314071de56040ffb4aac123b43ed488357fb52d2f66287b737743b9a0001d24e2be49248b5c6d91bf01a626b5f69329a7126989dc6bf3b3d6')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  composer install --prefer-dist --no-dev
  sed -i '/git-commit/d' box.json
  php -d extension=phar.so -d phar.readonly=Off -d display_errors=Off /usr/bin/php-box build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m755 "${pkgname}.phar" "${pkgdir}/usr/share/webapps/bin/${pkgname}.phar"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/webapps/bin/${pkgname}.phar" "${pkgdir}/usr/bin/${pkgname}"
}
