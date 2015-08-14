# Mantainer: Bruno Galeotti <bgaleotti at gmail dot com>
# Contributor: Stefan Auditor <stefan.auditor@erdfisch.de>

pkgname=php-cs-fixer
_pkgname=PHP-CS-Fixer
pkgver=1.10
pkgrel=2
pkgdesc="Analyzes some PHP source code and tries to fix coding standards issues (PSR-1 and PSR-2 compatible)."
url="http://cs.sensiolabs.org/"
license="MIT"
arch=("any")
depends=("php>=5.3.6")
makedepends=("php-box" "php-composer")
install="${pkgname}.install"
source=("https://github.com/FriendsOfPHP/${_pkgname}/archive/v${pkgver}.tar.gz"
        "${pkgname}.install")
sha512sums=('755eb4bc11e791569b1297719181b4e343ef0f37559176c100515e5715b2348d64a487fd8733a8cf8be1ac2aa23270a2ea524117665036de2cf50fe6a51cc677'
            '0eff98de88ad715939217f16138941bb3e9c8bb6e34d85db875c1fc0166e3fb4b0ec8dd9df5d9865c9f772621dc5a6aaf668d2ba8e26b632905bdaedf435feb5')

prepare() {
  if ! php -i | grep 'PHP Archive support => enabled' >/dev/null 2>&1; then
    echo "Error: phar.so must be enabled and phar.readonly = Off in your php.ini to compile"
    exit 1
  fi

  if ! php -i | grep 'phar.readonly => Off' >/dev/null 2>&1; then
    echo "Error: phar.so is enabled but phar.readonly must be set to 'Off' in your php.ini to compile"
    exit 1
  fi
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  composer install --prefer-dist --no-dev
  sed -i '/git-commit/d' box.json
  php-box build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m755 "${pkgname}.phar" "${pkgdir}/usr/share/webapps/bin/${pkgname}.phar"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/webapps/bin/${pkgname}.phar" "${pkgdir}/usr/bin/${pkgname}"
}
