# Maintainer: Boris Momčilović <boris.momcilovic@gmail.com>

pkgname=php-componere-git
pkgver=v2.1.2.r23.ge0c32ed
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
  cd "$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$srcdir/$pkgname"
  git checkout release

  phpize
  ./configure --prefix=/usr
  make
  #TEST_PHP_EXECUTABLE=`which php` php run-tests.php
}

package() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr INSTALL_ROOT="$pkgdir" install
  cat >> "$_ininame" <<EOF
;extension=componere.so
EOF

  install -vDm644 "$_ininame" "$pkgdir/$_inifile"
}
