pkgname=wp-cli
pkgver=1.5.1
pkgrel=2
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
source=("https://github.com/wp-cli/wp-cli/archive/v${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/wp-cli/wp-cli/v${pkgver}/utils/wp-completion.bash")
md5sums=('f6bc043d4dcafe7281c2359177000e63'
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
  cd "${srcdir}/${pkgname}-${pkgver}"
  composer install --no-interaction --prefer-dist --no-scripts && composer dump
  php -dphar.readonly=0 utils/make-phar.php wp-cli.phar --quiet
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # The version of PHPUnit included in the package breaks in PHP 7.2
  # Skip running the unit tests if the local PHP version is 7.2 or higher
  comp=$(php -r "echo version_compare(PHP_VERSION, '7.2.0');");
  if [[ "${comp}" -eq "-1" ]]; then
    ./vendor/bin/phpunit
  else
    echo "Notice: System PHP version incompatible with included phpunit!"
    echo -n "Checking for system install of phpunit... ";
    phpunit=0
    hash phpunit > /dev/null 2>&1 || phpunit=1
    if [[ "${phpunit}" -eq "0" ]]; then
      echo "Found!"
      echo -n "Running test suite... "
      phpunit > /dev/null
    else
      echo "Not Found... Skipping testing..."
    fi
  fi

  echo -n "Binary reporting as "
  php ./wp-cli.phar --version
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm655 wp-cli.phar "$pkgdir/usr/bin/wp"
  cd "${srcdir}"
  install -Dm644 wp-completion.bash "${pkgdir}/usr/share/bash-completion/completions/wp"
}
