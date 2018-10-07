pkgname=wp-cli
pkgver=2.0.1
pkgrel=1
pkgdesc="A command-line tool for managing WordPress"
url="http://wp-cli.org/"
arch=('any')
license=('MIT')
depends=('php')
optdepends=()
makedepends=('php-composer')
conflicts=()
replaces=()
backup=()
source=("https://github.com/wp-cli/wp-cli-bundle/archive/v${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/wp-cli/wp-cli/v${pkgver}/utils/wp-completion.bash")
md5sums=('39df7128998fad0756a8ecddb6d28f2d'
         'f8acb424f1460428796451679631be86')

prepare() {
  if [[ -n $(php -dphar.readonly=0 -r '$phar = new Phar("test.phar", 0,"wp-cli.phar");' 2>&1 | grep "Class 'Phar' not found") ]]; then
    echo "Error: Phar extension not found! Enable the phar extension in your php.ini"
    echo "Also be sure to disable the readonly setting for the phar extension: Set phar.readonly to Off"
    return 1
  fi

  if [[ -n $(php -dphar.readonly=0 -r '$phar = new Phar("test.phar", 0,"wp-cli.phar");' 2>&1 | grep "phar.readonly") ]]; then
    echo "Error: Phar readonly setting is enabled!"
    echo "Disable the readonly setting for the phar extension in your php.ini: Set phar.readonly to Off"
    return 1
  fi

  if [[ -n $(php -r 'echo ini_get("open_basedir");') ]]; then
    echo "Warning: open_basedir is enabled and likely to cause errors with wp-cli"
  fi
}

build() {
  cd "${srcdir}/${pkgname}-bundle-${pkgver}"
  composer install --no-interaction --prefer-dist --no-scripts --quiet && composer dump --quiet
  php -dphar.readonly=0 utils/make-phar.php wp-cli.phar --quiet
}

check() {
  cd "${srcdir}/${pkgname}-bundle-${pkgver}"
  composer phpunit --quiet
}

package() {
  cd "${srcdir}/${pkgname}-bundle-${pkgver}"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm655 wp-cli.phar "$pkgdir/usr/bin/wp"
  cd "${srcdir}"
  install -Dm644 wp-completion.bash "${pkgdir}/usr/share/bash-completion/completions/wp"
}
