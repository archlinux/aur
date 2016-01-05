# Maintainer: Peter Hoeg <firstname at lastname dot com>

_pkgbase=pecl-database-mysql
pkgname=${_pkgbase}-git
pkgver=r12.294ce3b
pkgrel=1
pkgdesc='PECL MySQL - support mysql_* functions on PHP7'
arch=('x86_64' 'i686')
url=('http://www.php.net')
license=('GPL')
source=("git+https://github.com/php/pecl-database-mysql.git")
depends=('php')
sha1sums=('SKIP')

pkgver() {
  cd ${srcdir}/${_pkgbase}
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd ${srcdir}/${_pkgbase}
  git submodule update --init
}

build() {
  cd ${srcdir}/${_pkgbase}
  phpize
  ./configure --prefix="${pkgdir}/usr"
  make
}

check() {
  cd ${srcdir}/${_pkgbase}
  # make test
}

package() {
  cd ${srcdir}/${_pkgbase}
  install -dm755 ${pkgdir}/usr/lib/php/modules
  install -m644 modules/*.so ${pkgdir}/usr/lib/php/modules
}

# vim:set ts=2 sw=2 et:
