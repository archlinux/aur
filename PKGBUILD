# Maintainer: James An <james@jamesan.ca>

pkgname="php-behat"
_pkgname=${pkgname#php-}
pkgver=3.6.1
pkgrel=1
pkgdesc='An open source behavior-driven development framework for PHP'
arch=('any')
url="http://$_pkgname.org"
license=('MIT')
depends=('php')
makedepends=('composer' 'php-box')
source=("https://github.com/${_pkgname^}/${_pkgname^}/archive/v$pkgver.tar.gz"
        "https://raw.githubusercontent.com/${_pkgname^}/${_pkgname^}/v$pkgver/box.json")
sha512sums=('e2e5aac5168d814b71dc7bfdc3ef99ed376078ff22bc7edd9d8b7ad1643b7290bec2f2d779d62064ce244f48f6318c8cd021f8288afd864463fdc11e760c373a'
            '93d23e53cb65722146cbb7f44c9ad319c8849df7394a1af2991bfd4162c0f2c026d11ce2dbe2e4dcb0203758d005be858a57fa974b6d4ceeb4fc004f72ed8361')

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
