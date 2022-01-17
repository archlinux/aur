# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>
# Maintainer: xeruf <27f at pm dot me>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Alex Smith <azphreal19@protonmail.com

pkgname=koel
pkgver=5.1.12
pkgrel=1
pkgdesc="A personal music streaming server that works."
arch=('any')
url="https://koel.dev/"
license=('MIT')
depends=(php php-sqlite python3 mysql openssl)
makedepends=(composer nodejs yarn)
backup=('usr/share/webapps/koel/.env')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${pkgname}/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('79d45c06c3b948fcd99f5ab0c3bb14b39b21594a3a3f0cb26bbdbb438c88f0011e064c3a10039ebee32add94fd5b5b84d9c41f3dcc0e400409ab37ad921fd817')

prepare() {
  cp "${srcdir}/${pkgname}-${pkgver}"/.env{.example,}
  sed -i 's|FFMPEG_PATH=/usr/local/bin/ffmpeg|FFMPEG_PATH=/usr/bin/ffmepg|g' "${srcdir}/${pkgname}-${pkgver}/.env.example"
}

build() {
  cd "$pkgname-$pkgver"
  echo "++ ENABLE THE FOLLOWING MODULES IN /etc/php/php.ini: pdo_sqlite, sqlite3, exif"
  php -d 'extension=pdo_sqlite' -d 'extension=sqlite3' -d 'extension=exif' /usr/bin/composer install
}

package() {
  mkdir -p "${pkgdir}/usr/share/webapps"
  cp -r "${pkgname}-${pkgver}" "${pkgdir}/usr/share/webapps/${pkgname}"
}
# vim:set ts=2 sw=2 et:
