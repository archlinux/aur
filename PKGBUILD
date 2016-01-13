# We need composer from trunk for PHP7
_composer_from_trunk=1
_pkgname=wp-cli
pkgname=${_pkgname}-git
pkgver=r4970.a2dc6e0
pkgrel=1
pkgdesc="A command-line tool for managing WordPress"
url="http://wp-cli.org/"
arch=('any')
license=('MIT')
depends=('php')
optdepends=()
if [[ $_composer_from_trunk -eq 1 ]] ; then
makedepends=('')
else
makedepends=('php-composer')
fi
conflicts=('wp-cli')
replaces=()
backup=()
source=("git+https://github.com/wp-cli/${_pkgname}.git"
        "https://raw.githubusercontent.com/wp-cli/wp-cli/master/utils/wp-completion.bash"
        "https://raw.githubusercontent.com/wp-cli/wp-cli/a249578ae2053b88c3174b15378266c9c65a9dfe/composer.json")
md5sums=('SKIP'
         'f8acb424f1460428796451679631be86'
         '7359993f535213af66c2148ea27369b3')

pkgver() {
  cd ${srcdir}/${_pkgname}
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  if [[ -n $(php -r '$phar = new Phar("test.phar", 0,"wp-cli.phar");' 2>&1 | grep "Class 'Phar' not found") ]]; then
    echo "Error: Phar extension not found! Enable the phar extension in your php.ini"
    echo "Also be sure to disable the readonly setting for the phar extension: Set phar.readonly to Off"
    return 1
  fi

  if [[ -n $(php -r '$phar = new Phar("test.phar", 0,"wp-cli.phar");' 2>&1 | grep "phar.readonly") ]]; then
    echo "Error: Phar readonly setting is enabled!"
    echo "Disable the readonly setting for the phar extension in your php.ini: Set phar.readonly to Off"
    return 1
  fi

  if [[ -n $(php -r 'echo ini_get("open_basedir");') ]]; then
    echo "Warning: open_basedir is enabled and likely to cause errors with wp-cli"
  fi

  cd ${srcdir}/${_pkgname}
  git submodule update --init
}

build() {
  cd "${srcdir}/${_pkgname}"
  curl -sS https://getcomposer.org/installer | php
  if [[ $_composer_from_trunk -eq 1 ]] ; then
    php ./composer.phar update --no-interaction --prefer-dist
  else
    cp ../composer.json .
    composer update --no-interaction --prefer-dist
  fi
  php -dphar.readonly=0 utils/make-phar.php wp-cli.phar --quiet
}

check() {
  cd "${srcdir}/${_pkgname}"
  ./vendor/bin/phpunit
  php ./wp-cli.phar --version
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm655 wp-cli.phar "$pkgdir/usr/bin/wp"
  cd "$srcdir"
  install -Dm644 wp-completion.bash "${pkgdir}/usr/share/bash-completion/completions/wp"
}
