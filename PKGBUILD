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
source=("https://www.xdebug.org/files/${_pkgbase}-${pkgver}.tgz"
        "xdebug.ini")
sha512sums=('75b1dbf32059eebb6ea3fb6ebb50ab26d73f8ce2964be1fec41ecfd9ae3d8bd55b6997daf03727b28b91ba06d08734865158bed6f038a46f00a1da5424ce5fe6'
            '738e6939a129a557d307a1659dfdfb0a0ded783b31c6c9a85f18cfa380a13afef4386cccce5a9ad3e1afcc66a2dedbebf29fa96d91f618a76af4a4d9e504f74e')

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
