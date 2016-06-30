# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>
# Please report issues at https://github.com/sanduhrs/arch-aur-drupalconsole

_pkgname=drupalconsole
pkgname=${_pkgname}
pkgver=1.0.0_beta3
pkgrel=1
pkgdesc="The Drupal Console is a suite of tools that you run on a command line interface (CLI) to generate boilerplate code and interact with a Drupal 8 installation."
arch=('any')
url="http://drupalconsole.com/"
license=('GPL')
depends=('php')
makedepends=("php-box" "php-composer" "git")
install="${_pkgname}.install"
source=("${_pkgname}"::"git+https://github.com/hechoendrupal/DrupalConsole.git")
sha512sums=('SKIP')

build() {
  cd "${srcdir}/${_pkgname}"

  # Increase open files limit to be able to compress the phar contents.
  # TODO: The 4096 is not enough anymore, but a greater value doesn't appear to
  # be possible either.
  # ulimit -n 4096
  # Until the previous is possible, remove the compression option from
  # configuration.
  sed -i '/compression/d' box.json

  php /usr/bin/composer install --no-dev
  php -d phar.readonly=Off /usr/bin/php-box build
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -D -m755 "drupal.phar" "${pkgdir}/usr/bin/drupal"
}
