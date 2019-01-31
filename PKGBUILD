# Maintainer: Boris Momčilović <boris.momcilovic@gmail.com>

_pkgname=componere
pkgname=php-$_pkgname-git
pkgver=1.3.0.r165.g6597644
pkgrel=1
pkgdesc="Complex Type Composition and Manipulation http://docs.php.net/intro.componere"
arch=('i686' 'x86_64')
url="https://github.com/krakjoe/componere"
license=('PHP')
depends=('php')
makedepends=('git')
source=(git://github.com/krakjoe/componere.git#branch=develop)
md5sums=('SKIP')
_ininame="componere.ini"
_inifile="etc/php/conf.d/$_ininame"
backup=("$_inifile")

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"

  phpize
  ./configure --prefix=/usr
  make
  #TEST_PHP_EXECUTABLE=`which php` php run-tests.php
}

package() {
  cd "$srcdir/$_pkgname"
  make PREFIX=/usr INSTALL_ROOT="$pkgdir" install
  cat >> "$_ininame" <<EOF
;extension=componere.so
EOF

  install -vDm644 "$_ininame" "$pkgdir/$_inifile"
}
