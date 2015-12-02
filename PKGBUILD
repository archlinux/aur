# Mantainer: Bruno Galeotti <bgaleotti at gmail dot com>
# Contributor: Stefan Auditor <stefan.auditor@erdfisch.de>

pkgname=php-cs-fixer
_pkgname=PHP-CS-Fixer
pkgver=1.10.3
pkgrel=1
pkgdesc="Analyzes some PHP source code and tries to fix coding standards issues (PSR-1 and PSR-2 compatible)."
url="http://cs.sensiolabs.org/"
license="MIT"
arch=("any")
depends=("php>=5.3.6")
makedepends=("php-box" "php-composer")
install="${pkgname}.install"
source=("https://github.com/FriendsOfPHP/${_pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('ebd96e1304b03f8649ffe4557881f230b260d15ee2ce895bbac22eea43bd1338d05cc3cbca04be33c17b73c66c5183abd788060e855f190b4e31cf9e8c72012f')

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
