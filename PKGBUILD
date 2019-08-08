# Maintainer: Boris Momčilović <boris.momcilovic@gmail.com>

_pkgname=nocheq
pkgname=php-$_pkgname-git
pkgver=r39.6e3c4f8
pkgrel=1
pkgdesc="Sick of pesky type checking making your code too slow (and correct) ?"
arch=('i686' 'x86_64')
url="https://github.com/krakjoe/nocheq"
license=('PHP')
depends=('php')
makedepends=('git')
source=(git://github.com/krakjoe/nocheq.git)
md5sums=('SKIP')
_ininame="nocheq.ini"
_inifile="etc/php/conf.d/$_ininame"
backup=("$_inifile")

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
;extension=nocheq.so
EOF

  install -vDm644 "$_ininame" "$pkgdir/$_inifile"
}
