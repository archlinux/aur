# Maintainer: Matt Fields (0x6d617474) <aur at 0x6d617474 dot net>

pkgname=wp-cli
pkgver=2.1.0
pkgrel=2
pkgdesc="A command-line tool for managing WordPress"
url="http://wp-cli.org/"
arch=('any')
license=('MIT')
depends=('php')
optdepends=()
makedepends=('composer')
conflicts=()
replaces=()
backup=()
source=("https://github.com/wp-cli/wp-cli-bundle/archive/v${pkgver}.tar.gz")
md5sums=('80810da4724dbb89b8476ccc7545514c')

build() {
  cd "${pkgname}-bundle-${pkgver}"
  # BEGIN TMP FIX - https://github.com/wp-cli/wp-cli-bundle/issues/68
  sed -i 's/639eb33aac1dc043c6a72323779ea836fb7795e5/7d4b691497b4c99149b89d93dba49775fbb4d2f3/g' composer.lock
  # END TMP FIX
  composer install --no-interaction --prefer-dist --no-scripts && composer dump
  echo -n "Building phar... "
  php -dphar.readonly=0 utils/make-phar.php wp-cli.phar --quiet
  echo "Done!"
}

check() {
  cd "${pkgname}-bundle-${pkgver}"
  composer phpunit

  echo -n "Binary reporting as "
  php ./wp-cli.phar --version
}

package() {
  cd "${pkgname}-bundle-${pkgver}"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm655 wp-cli.phar "$pkgdir/usr/bin/wp"
  install -Dm644 vendor/wp-cli/wp-cli/utils/wp-completion.bash "${pkgdir}/usr/share/bash-completion/completions/wp"
}
