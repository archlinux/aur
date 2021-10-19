# Maintainer: Boris Momčilović <boris.momcilovic@gmail.com>

pkgname=php-uopz-git
pkgver=v7.1.1.r1.g29a6663
pkgrel=1
pkgdesc="PHP User Operations for Zend"
arch=('i686' 'x86_64')
url="https://github.com/krakjoe/uopz"
license=('PHP')
depends=('php')
makedepends=('git')
source=("$pkgname"::'git://github.com/krakjoe/uopz.git')
md5sums=('SKIP')
_ininame="uopz.ini"
_inifile="etc/php/conf.d/$_ininame"
backup=("$_inifile")

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"

  phpize
  ./configure --prefix=/usr
  make
  #TEST_PHP_EXECUTABLE=`which php` php run-tests.php
}

package() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr INSTALL_ROOT="$pkgdir" install
  cat >> "$_ininame" <<EOF
;extension=uopz.so
;uopz.disable = 1
EOF

  install -vDm644 "$_ininame" "$pkgdir/$_inifile"
}
