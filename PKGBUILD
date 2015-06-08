# Mantainer: Bruno Galeotti <bgaleotti at gmail dot com>

pkgname=php-semver-checker
pkgver=0.6.2
pkgrel=1
pkgdesc="Compares two source sets and determines the appropriate semantic versioning to apply."
url="https://github.com/tomzx/php-semver-checker"
license="MIT"
arch=("any")
depends=("php>=5.4.0")
makedepends=("php-box" "php-composer")
source=("https://github.com/tomzx/${pkgname}/archive/v${pkgver}.tar.gz")
#source=("${pkgname}::git+https://github.com/tomzx/${pkgname}.git")
sha512sums=('c9b44353de4b8c63997e7dc5631edbc15ed5f4e4e43bf1af7456d81b316fd36701f2a746ad72385a105ab81a49531147b60791068edfa8e1221c21c756fe20cd')

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
