# Maintainer: Raphaël Doursenaud <rdoursenaud@gpcsolutions.fr># Contributor: Thore Bödecker <me [at] foxxx0 [dot] de>

pkgname=php55-xdebug
_pkgbase="${pkgname#php55-}"
_phpbase="${pkgname#-xdebug}"
pkgver=2.5.5
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
sha512sums=('9faab421bd90c03734c047d8c6dcc021c8bc665eb36781c692f194d04c7dca24fe1eb920ca8dc407e5bf4ae0912c4b917587f940f34b07171a8881d4cf8695d1'
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
