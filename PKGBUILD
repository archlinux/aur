# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>
# Contributor: Victor Häggqvist <aur@snilius.com>
# Please report issues at https://github.com/sanduhrs/arch-aur-drupalconsole-git

_pkgname=drupalconsole
pkgname=${_pkgname}-git
pkgver=1.0.0.alpha2.r42.g35370d5
pkgrel=1
pkgdesc="The Drupal Console is a suite of tools that you run on a command line interface (CLI) to generate boilerplate code and interact with a Drupal 8 installation."
arch=('any')
url="http://drupalconsole.com/"
license=('GPL')
depends=('php')
makedepends=("php-box" "composer" "git")
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
install="${_pkgname}.install"
source=("${_pkgname}"::"git+https://github.com/hechoendrupal/DrupalConsole.git")
sha512sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgname}"

  # Increase open files limit to be able to compress the phar contents
  # ulimit -n 4096
  # Remove the compression option from configuration
  sed -i '/compression/d' box.json

  php /usr/bin/composer install --no-dev
  php -d phar.readonly=Off /usr/bin/box build
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -D -m755 "drupal.phar" "${pkgdir}/usr/bin/drupal"
}
