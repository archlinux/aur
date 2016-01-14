# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>

_pkgname=drush
pkgname=${_pkgname}-alternative
pkgver=8.0.2
pkgrel=1
pkgdesc="Drush is a command line shell and Unix scripting interface for Drupal"
arch=('any')
url="https://github.com/drush-ops/${_pkgname}"
license=('GPL')
depends=('php')
makedepends=("php-box" "php-composer")
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("${_pkgname}"::"https://github.com/drush-ops/${_pkgname}/archive/${pkgver}.tar.gz"
        "LICENSE"::"https://www.gnu.org/licenses/old-licenses/gpl-2.0.txt")
sha512sums=('10b1324db0d8c55d3ded33f2e0d0dbe7f052c879d9882e02c567d09d62f2af026658c80f1352a70e4268519da2f07c526de5f3184e5164c9ed67cbcbd00b0de9'
            'aee80b1f9f7f4a8a00dcf6e6ce6c41988dcaedc4de19d9d04460cbfb05d99829ffe8f9d038468eabbfba4d65b38e8dbef5ecf5eb8a1b891d9839cda6c48ee957')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  php /usr/bin/composer install --prefer-dist --no-dev
  cp box.json.dist box.json
  php -d phar.readonly=Off /usr/bin/php-box build
}

package() {
  cd "${_pkgname}-${pkgver}"
  install -d "${pkgdir}/etc/${_pkgname}"
  install -m644 "examples/example.aliases.drushrc.php" "${pkgdir}/etc/${_pkgname}/aliases.drushrc.php"
  install -m644 "examples/example.drush.ini" "${pkgdir}/etc/${_pkgname}/drush.ini"
  install -m644 "examples/example.drushrc.php" "${pkgdir}/etc/${_pkgname}/drushrc.php"
  install -D -m644 "../LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -D -m755 "${_pkgname}.phar" "${pkgdir}/usr/share/webapps/bin/${_pkgname}.phar"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/webapps/bin/${_pkgname}.phar" "${pkgdir}/usr/bin/${_pkgname}"
}
