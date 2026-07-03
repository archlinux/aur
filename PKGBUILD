# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

pkgname=laravel
pkgver=5.30.0
pkgrel=1
pkgdesc="The Laravel application installer. Allows you to run laravel new."
arch=('any')
url="https://github.com/laravel/installer"
license=('MIT')
depends=('php' 'composer')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/laravel/installer/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('c082f74815788eb43c6626098a6ffd9df12c5ce3c4f24b40955d77fac798ebbd91b1455b2db1fee60d923057780069f5c174df7aa22c8b3e3a2db3ad59c03c3b')

prepare() {
  cd "${srcdir}/installer-${pkgver}"
  composer install --no-dev --prefer-dist --no-progress --no-interaction
}

build() {
  cd "${srcdir}/installer-${pkgver}"
  # Replace __DIR__.'/../../../autoload.php' with '/usr/lib/laravel/vendor/autoload.php'
  sed -i "s|__DIR__\.'/../../../autoload.php'|'/usr/lib/laravel/vendor/autoload.php'|g" bin/laravel
}

package() {
  cd "${srcdir}/installer-${pkgver}"

  install -D -m755 "bin/laravel" "${pkgdir}/usr/bin/laravel"

  install -dm 755 "${pkgdir}/usr/lib/laravel"
  cp -r src "${pkgdir}/usr/lib/laravel/"
  cp -r vendor "${pkgdir}/usr/lib/laravel/"

  install -D -m644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
