# Mantainer: Bruno Galeotti <bgaleotti at gmail dot com>

pkgname=php-semver-checker
pkgver=0.7.0
pkgrel=1
pkgdesc="Compares two source sets and determines the appropriate semantic versioning to apply."
url="https://github.com/tomzx/php-semver-checker"
license="MIT"
arch=("any")
depends=("php>=5.4.0")
makedepends=("php-box" "php-composer")
source=("https://github.com/tomzx/${pkgname}/archive/v${pkgver}.tar.gz")
#source=("${pkgname}::git+https://github.com/tomzx/${pkgname}.git")
sha512sums=('c26ea5aac23e91f533289f159765825abef435a2c17bee1e86c466799eae3540d2e9207fe209a27ffcdc5e5ca1d0aceb73889d3854cae3d3363f0088f5b9c08b')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  composer install --prefer-dist --no-dev
  sed -i '/git-version/d' box.json
  sed -i "s/@package_version@/${pkgver}/g" src/PHPSemVerChecker/Console/Application.php
  php-box build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m755 "${pkgname}.phar" "${pkgdir}/usr/share/webapps/bin/${pkgname}.phar"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/webapps/bin/${pkgname}.phar" "${pkgdir}/usr/bin/${pkgname}"
}
