pkgname=wp-cli
pkgver=0.19.1
pkgrel=1
pkgdesc="A command-line tool for managing WordPress"
url="http://wp-cli.org/"
arch=('any')
license=('MIT')
depends=('php')
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
source=("https://github.com/wp-cli/wp-cli/archive/v${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/wp-cli/wp-cli/v${pkgver}/utils/wp-completion.bash")
md5sums=('13a86a482262dd38d00ae28b66a82534'
         '696410d404d8c0ad2e10a223302effe6')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  curl -sS https://getcomposer.org/installer | php
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  php ./composer.phar install --no-interaction --prefer-dist
  php -dphar.readonly=0 utils/make-phar.php wp-cli.phar --quiet
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./vendor/bin/phpunit
  php ./wp-cli.phar --version
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm655 wp-cli.phar "$pkgdir/usr/bin/wp"
  cd "$srcdir"
  install -Dm644 wp-completion.bash "${pkgdir}/usr/share/bash-completion/completions/wp"
}
