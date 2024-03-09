# Maintainer: Max <max@swk-web.com>
# Contributor: Justin Kromlinger <hashworks@archlinux.org>
# Contributor: Stefan Auditor <stefan.auditor@erdfisch.de>
# Contributor: Marc Straube <email@marcstraube.de>
# Contributor: Attila Bukor <r1pp3rj4ck [at] w4it [dot] eu>

pkgname=phpunit
pkgver=11.0.4
pkgrel=1
pkgdesc="A programmer-oriented testing framework for PHP"
conflicts=('phpunit-bin')
url="https://phpunit.de"
arch=("any")
license=("BSD")
depends=("php>=8.1.0")
makedepends=('ant' 'git' 'composer')
install="${pkgname}.install"
source=("git+https://github.com/sebastianbergmann/phpunit.git#tag=${pkgver}")
sha256sums=('SKIP')

prepare() {
  cd ${pkgname}
  composer install
  sed \
	-e 's/^;extension=iconv$/extension=iconv/' \
	-e 's/^;phar.readonly = On$/phar.readonly = Off/' \
	/etc/php/php.ini > /tmp/php.ini
  export PHPRC=/tmp/php.ini
}

build() {
  cd ${pkgname}
  ant phar
}

package() {
  install -Dm 644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 755 "${srcdir}/${pkgname}/build/artifacts/${pkgname}-${pkgver}.phar" "${pkgdir}/usr/share/webapps/bin/${pkgname}.phar"

  install -dm 755 "${pkgdir}/usr/bin"
  ln -s "/usr/share/webapps/bin/${pkgname}.phar" "${pkgdir}/usr/bin/${pkgname}"
}
