pkgname=wp-cli
pkgver=2.1.0
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
md5sums=('80810da4724dbb89b8476ccc7545514c'
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
  # BEGIN TMP FIX - https://github.com/wp-cli/wp-cli-bundle/issues/68
  sed -i 's/639eb33aac1dc043c6a72323779ea836fb7795e5/7d4b691497b4c99149b89d93dba49775fbb4d2f3/g' composer.lock
  # END TMP FIX
  composer install --no-interaction --prefer-dist --no-scripts && composer dump
  echo -n "Building phar... "
  php -dphar.readonly=0 utils/make-phar.php wp-cli.phar --quiet
  echo "Done!"
}

check() {
  cd "${srcdir}/${pkgname}-bundle-${pkgver}"
  composer phpunit

  echo -n "Binary reporting as "
  php ./wp-cli.phar --version
}

package() {
  cd "${srcdir}/${pkgname}-bundle-${pkgver}"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm655 wp-cli.phar "$pkgdir/usr/bin/wp"
  cd "${srcdir}"
  install -Dm644 wp-completion.bash "${pkgdir}/usr/share/bash-completion/completions/wp"
}
