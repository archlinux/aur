#!/bin/bash
# Maintainer: Fredrick R. Brennan <copypaste@kittens.ph>
# Contributor: Brian BIdulock <bidulock@openss7.org>
pkgbase=sensible-utils
pkgname=(sensible-pager sensible-editor sensible-browser sensible-utils-data)
pkgver=0.0.17
_debianextra=+nmu1
pkgrel=3
pkgdesc="Utilities for sensible alternative selection"
arch=('any')
url="http://packages.debian.org/source/sid/sensible-utils"
license=('GPL')
depends=('bash')
makedepends=('po4a')
checkdepends=('ed')
source=(http://ftp.debian.org/debian/pool/main/s/$pkgbase/${pkgbase}_${pkgver}${_debianextra}.tar.xz)
sha256sums=('a4ead62e0dc8f965453221dcb09c964abc4f1bedad24f527d33c443a1570cb31')

build() {
  cd ${pkgbase}-${pkgver}${_debianextra}
  export -n EDITOR VISUAL
  ./configure --prefix=/usr
  make
}

check() {
  cd ${pkgbase}-${pkgver}${_debianextra}
  export -n EDITOR VISUAL
  make -k check
}

_package_sensible() {
  cd ${pkgbase}-${pkgver}${_debianextra}
  export -n EDITOR VISUAL
  make DESTDIR="$pkgdir/" install
  shopt -s globstar
  cd $pkgdir
  [[ $CURRENTLY_PACKAGING = sensible-utils ]] && return 0
  find . -type f -and \( -not -iname "*$CURRENTLY_PACKAGING*" \) | xargs rm -v
}

package_sensible-pager() {
  CURRENTLY_PACKAGING=sensible-pager _package_sensible
}

package_sensible-browser() {
  CURRENTLY_PACKAGING=sensible-browser _package_sensible
}

package_sensible-editor() {
  CURRENTLY_PACKAGING=editor _package_sensible
}

package_sensible-utils() {
  CURRENTLY_PACKAGING=sensible-utils _package_sensible
}

package_sensible-utils-data() {
  CURRENTLY_PACKAGING=gettext _package_sensible
}

# vim:set ts=2 sw=2 et:
