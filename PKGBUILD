# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

pkgname=laravel
pkgver=5.24.6
pkgrel=1
pkgdesc="The Laravel application installer. Allows you to run laravel new."
arch=('any')
url="https://github.com/laravel/installer"
license=('MIT')
depends=('php' 'composer')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/laravel/installer/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('65e57bea7906ab8cdc3c216c90fb9873a124342128d403a218f78ff6e92753236ad702f343e3f3d653545edff3974d68181791d47b686a91b57cc30188bc2a2d')

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
