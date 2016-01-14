# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>

_pkgname=drush
pkgname=${_pkgname}-git-alternative
pkgver=8.0.2.r10.gb1bb013
pkgrel=1
pkgdesc="Drush is a command line shell and Unix scripting interface for Drupal"
arch=('any')
url="https://github.com/drush-ops/${_pkgname}"
license=('GPL')
depends=('php')
makedepends=("php-box" "php-composer" "git")
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("${_pkgname}"::"git+https://github.com/drush-ops/${_pkgname}.git"
        "LICENSE"::"https://www.gnu.org/licenses/old-licenses/gpl-2.0.txt")
sha512sums=('SKIP'
            'aee80b1f9f7f4a8a00dcf6e6ce6c41988dcaedc4de19d9d04460cbfb05d99829ffe8f9d038468eabbfba4d65b38e8dbef5ecf5eb8a1b891d9839cda6c48ee957')

pkgver() {
  cd "${_pkgname}"
  (
    set -o pipefail
    git describe --long --tag | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  ) 2>/dev/null
}

build() {
  cd "${srcdir}/${_pkgname}"
  php /usr/bin/composer install --prefer-dist --no-dev
  cp box.json.dist box.json
  php -d phar.readonly=Off /usr/bin/php-box build
}

package() {
  cd "${_pkgname}"
  install -d "${pkgdir}/etc/${_pkgname}"
  install -m644 "examples/example.aliases.drushrc.php" "${pkgdir}/etc/${_pkgname}/aliases.drushrc.php"
  install -m644 "examples/example.drush.ini" "${pkgdir}/etc/${_pkgname}/drush.ini"
  install -m644 "examples/example.drushrc.php" "${pkgdir}/etc/${_pkgname}/drushrc.php"
  install -D -m644 "../LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -D -m755 "${_pkgname}.phar" "${pkgdir}/usr/share/webapps/bin/${_pkgname}.phar"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/webapps/bin/${_pkgname}.phar" "${pkgdir}/usr/bin/${_pkgname}"
}
