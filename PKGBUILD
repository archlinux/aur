# Maintainer: Bruno Silva <brunofernandes at ua dot pt>

pkgname=openpace-git
_pkgname=openpace
pkgver=1.1.3.r11.g1466126
pkgrel=1
pkgdesc="OpenPACE - Cryptographic library for EAC version 2"
arch=('i686' 'x86_64')
url="https://frankmorgner.github.io/openpace"
license=('LGPL3')
depends=('openssl')
makedepends=('autoconf'
             'make'
             'git'
             'libtool'
             'gengetopt'
             'help2man')
optdepends=()
provides=(openpace)
conflicts=(openpace)
replaces=()
source=('git+https://github.com/frankmorgner/openpace.git#branch=master')

sha512sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

build() {
  cd ${srcdir}/${_pkgname}
  autoreconf --verbose --install
  ./configure --prefix=/usr
  make -j1
}

package() {
  cd ${srcdir}/${_pkgname}
  DESTDIR="${pkgdir}" make install
  mv "${pkgdir}"/usr/etc "${pkgdir}"/
}
