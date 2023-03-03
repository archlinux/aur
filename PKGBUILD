# Maintainer Max <max@swk-web.com>
# Contributor: Stefan Auditor <stefan.auditor@erdfisch.de>
# Contributor: Marc Straube <email@marcstraube.de>
# Contributor: Attila Bukor <r1pp3rj4ck [at] w4it [dot] eu>

_pkgname=phpunit
pkgname=${_pkgname}
pkgver=10.0.14
pkgrel=1
pkgdesc="PHPUnit is a programmer-oriented testing framework for PHP."
conflicts=('phpunit-bin')
url="https://phpunit.de"
arch=("any")
license=("BSD")
depends=("php>=8.1.0")
makedepends=('ant' 'git' 'composer')
install="${_pkgname}.install"
source=("git+https://github.com/sebastianbergmann/phpunit.git#tag=${pkgver}"
        "composer.lock")
sha256sums=('SKIP'
            'f30e3c7e14f92fe4031ffd766be364edac9e61584ee67dfa891d24e1c88c69ee')

prepare() {
  cd ${_pkgname}
  cp ../composer.lock .
  composer install
}

build() {
  cd ${_pkgname}
  ant phar
}

package() {
  install -Dm 644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm 755 "${srcdir}/${_pkgname}/build/artifacts/${_pkgname}-${pkgver}.phar" "${pkgdir}/usr/share/webapps/bin/${_pkgname}.phar"

  install -dm 755 "${pkgdir}/usr/bin"
  ln -s "/usr/share/webapps/bin/${_pkgname}.phar" "${pkgdir}/usr/bin/${_pkgname}"
}

updlockfiles() {
  cd ${_pkgname}
  rm -f composer.lock
  composer update
  cp composer.lock "${outdir}/"
}
