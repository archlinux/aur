# Maintainer: James An <james@jamesan.ca>

pkgname="php-behat"
_pkgname=${pkgname#php-}
pkgver=3.4.3
pkgrel=1
pkgdesc='An open source behavior-driven development framework for PHP 5.3 and 5.4'
arch=('any')
url="http://$_pkgname.org"
license=('MIT')
depends=('php')
makedepends=('composer' 'php-box')
source=("https://github.com/${_pkgname^}/${_pkgname^}/archive/v$pkgver.tar.gz"
        "https://raw.githubusercontent.com/${_pkgname^}/${_pkgname^}/v$pkgver/box.json")
md5sums=('975a437b022f6e58704f03d7ed714052'
         '4fbe3a7e61f9e10e2beecd872bdb34a9')

prepare() {
  cd "${_pkgname^}-$pkgver"

  composer install --no-dev --prefer-dist --optimize-autoloader
  cp ../box.json .
}

build() {
  cd "${_pkgname^}-$pkgver"

  php -dphar.readonly=0 /usr/bin/php-box build
}

package() {
  cd "${_pkgname^}-$pkgver"

  install -D -m644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m755 "$_pkgname.phar" "$pkgdir/usr/share/webapps/bin/$pkgname.phar"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/webapps/bin/$pkgname.phar" "$pkgdir/usr/bin/$_pkgname"
}
