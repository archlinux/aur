# Maintainer: Raphaël Doursenaud <rdoursenaud@gpcsolutions.fr># Contributor: Thore Bödecker <me [at] foxxx0 [dot] de>

pkgname=php55-xdebug
_pkgbase="${pkgname#php55-}"
_phpbase="${pkgname#-xdebug}"
pkgver=2.5.0
_PKGVER="$(echo "${pkgver}" | tr '[:lower:]' '[:upper:]')"
pkgrel=1
pkgdesc="php55 debugging extension"
arch=('i686' 'x86_64')
url="http://www.xdebug.org"
license=('GPL')
depends=('php55>=5.5')
options=('!makeflags')
backup=('etc/php55/conf.d/xdebug.ini')
provides=("${_pkgbase}=${pkgver}-${pkgrel}" "php-${_pkgbase}=${pkgver}-${pkgrel}")
source=("http://www.xdebug.org/files/${_pkgbase}-${pkgver}.tgz"
        "xdebug.ini")
md5sums=('5306da5948e195c2e4585c9abd7741f9'
         '0e601dfb867b248f28d6a647611e4400')

build() {
  cd "$srcdir/${_pkgbase}-${_PKGVER}"
  phpize55
  ./configure --prefix=/usr --enable-xdebug
  make

  cd "$srcdir/${_pkgbase}-${_PKGVER}/debugclient"
  ./buildconf
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/${_pkgbase}-${_PKGVER}/debugclient"
  make DESTDIR=$pkgdir install

  cd "$srcdir/${_pkgbase}-${_PKGVER}"
  make INSTALL_ROOT=$pkgdir install
  install -D -m 644 $srcdir/xdebug.ini $pkgdir/etc/php55/conf.d/xdebug.ini

  # rename binary
  mv "$pkgdir/usr/bin/debugclient" "$pkgdir/usr/bin/debugclient55"
}
