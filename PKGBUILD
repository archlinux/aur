# Maintainer: Thore Bödecker <me [at] foxxx0 [dot] de>

pkgname=php56-xdebug
_pkgbase="${pkgname#php56-}"
_phpbase="${pkgname#-xdebug}"
pkgver=2.4.0rc3
_PKGVER="$(echo "${pkgver}" | tr '[:lower:]' '[:upper:]')"
pkgrel=1
pkgdesc="php56 debugging extension"
arch=('i686' 'x86_64')
url="http://www.xdebug.org"
license=('GPL')
depends=('php56>=5.6.17-3')
options=('!makeflags')
backup=('etc/php56/conf.d/xdebug.ini')
provides=("${_pkgbase}=${pkgver}-${pkgrel}" "php-${_pkgbase}=${pkgver}-${pkgrel}")
source=("http://www.xdebug.org/files/${_pkgbase}-${pkgver}.tgz"
        "xdebug.ini")
md5sums=('cc799ad91b3addf9c92b15bdfc25e9ee'
         '0e601dfb867b248f28d6a647611e4400')

build() {
  cd "$srcdir/${_pkgbase}-${_PKGVER}"
  phpize56
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
  install -D -m 644 $srcdir/xdebug.ini $pkgdir/etc/php56/conf.d/xdebug.ini

  # rename binary
  mv "$pkgdir/usr/bin/debugclient" "$pkgdir/usr/bin/debugclient56"
}
